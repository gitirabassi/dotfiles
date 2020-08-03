ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="bira"
plugins=(
  git
  vagrant
  python
  golang
  docker
  docker-compose
  kubectl
  colored-man-pages
  gpg-agent
  aws
  nmap
)
source $ZSH/oh-my-zsh.sh
eval "$(direnv hook zsh)"
autoload -U compinit && compinit
source $HOME/.cargo/env

# Direct Exports
export EDITOR=nvim
export KUBE_EDITOR=nvim
export GOPATH=$HOME/go
export PATH=/opt/brew/bin:$PATH
export PATH=$HOME/go/bin:$PATH
export PATH=$PATH:$HOME/go/src/k8s.io/kubernetes/_output/bin
export PATH="/usr/local/sbin:$PATH"
export PATH=$HOME/.krew/bin:$PATH
export CLICOLOR=1
export ETCDCTL_API=3
export GO111MODULE=on
export CC=clang
export GOX_PARALLEL_BUILDS=2
export DOCKER_BUILDKIT=1
export KUBECTL_EXTERNAL_DIFF=colordiff
export PASSWORD_STORE_DIR=$HOME/go/src/github.com/gitirabassi/passwordstore
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export LDFLAGS="-L/usr/local/opt/node@10/lib"
export CPPFLAGS="-I/usr/local/opt/node@10/include"
export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig"
export LDFLAGS="-L/usr/local/opt/icu4c/lib"
export CPPFLAGS="-I/usr/local/opt/icu4c/include"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/usr/local/opt/icu4c/bin:$PATH"

# Aliases
alias da='direnv allow'
alias profile="code $HOME/.zshrc"
alias reload="source ~/.zshrc"
alias kl=kubectl
alias wkl="watch kubectl"
alias kns=kubens
alias kctx=kubectx
alias down="youtube-dl -o \"~/youtube/%(title)s-%(id)s.%(ext)s\" --"
alias newssh="ssh-keygen -t rsa -b 4096"
alias yk="ykman --serial=$SERIAL"
alias msfconsole="docker run --rm -it metasploitframework/metasploit-framework:latest"
alias jwtinfo="pbpaste | step crypto jwt inspect --insecure"
alias resetgpg="gpgconf --kill gpg-agent"
alias listkeys="security list-smartcards"

# Direct commands
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
gpgconf --launch gpg-agent
ln -s /Users/gitirabassi/go/src/k8s.io/kubernetes/_output/bin/kubectl /usr/local/bin/kubectl 2> /dev/null | true
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

function certinfo() {
  openssl x509 -in $1 -text -noout
}

function kubectl-whois() {
echo "apiVersion: authentication.k8s.io/v1beta1
kind: TokenReview
spec:
  token: $1
" | kubectl create -f - -o json | jq
}

function decrypt64() {
  echo $1 | base64 -D | gpg -d
}

function yamlJson() {
  yq r -d'*' -j $1 | jq |clipcopy
}

function vdev() {
  vault server -dev -dev-root-token-id=root
}

function vclient() {
  export VAULT_ADDR=http://127.0.0.1:8200
  export VAULT_TOKEN=root
}


local kube_cluster_color="yellow"
local kube_namespace_color="blue"

kube_ctx(){
  kubectl config get-contexts --no-headers $(kubectl config current-context)
}

kube_cluster() {
  kube_ctx | awk '{ print $3 }'
}

kube_namespace() {
  ns=$(kube_ctx | awk '{ print $5 }')
  if [[ $ns != '' ]]; then
    echo ":(%{$fg[$kube_namespace_color]%}$ns%{$fg[$kube_cluster_color]%})"
  fi
}

RPROMPT='%{$fg[$kube_cluster_color]%}$(kube_cluster)$(kube_namespace)%{$reset_color%}'

kube-vault() {
  SECRET_NAME=`kubectl get -n vault sa vault-auth -o json | jq '.secrets[] | .name' -r`
  TOKEN=`kubectl get -n vault secret $SECRET_NAME -o json | jq .data.token -r | base64 -D`
  echo $TOKEN | pbcopy
}

sign() {
  pass -c Signify/passphrase
  signify -S -s ~/.signify/newkey.sec -m $1 -x $1.sig
}

verify() {
  signify -V -p ~/.signify/newkey.pub -m $1 -x $1.sig
}

