
$init = <<-SCRIPT
set +x
sudo apt-add-repository ppa:yubico/stable
sudo apt-get update 
sudo apt-get upgrade 
sudo apt-get install -y \
    gnupg2 gnupg-agent dirmngr \
    cryptsetup scdaemon pcscd \
    secure-delete hopenpgp-tools \
    yubikey-personalization yubikey-manager

cat << EOF > /home/vagrant/gpg.conf
auto-key-locate local,keyserver
keyserver-options no-auto-key-retrieve
photo-viewer "eog %i"
no-escape-from-lines
no-greeting
fixed-list-mode
no-emit-version
no-comments
keyid-format 0xlong
with-fingerprint
list-options show-usage show-uid-validity
verify-options show-policy-urls show-uid-validity
require-cross-certification
personal-digest-preferences SHA512
personal-cipher-preferences AES256 AES192 AES
personal-compress-preferences ZLIB BZIP2 ZIP Uncompressed
default-preference-list SHA512 SHA384 SHA256 AES256 AES192 AES ZLIB BZIP2 ZIP Uncompressed
cert-digest-algo SHA512
s2k-digest-algo SHA512
s2k-cipher-algo AES256
charset utf-8
throw-keyids
use-agent
ignore-time-conflict 
allow-freeform-uid 
EOF

SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.synced_folder "/Volumes/BLACK", "/home/vagrant/gpg-keys"
  config.vm.hostname = "gpg"
  config.vm.provision "shell", inline: $init, privileged: false
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--usb", "on"]
    vb.customize ["modifyvm", :id, "--usbehci", "on"]
  end
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["usbfilter", "add", "0",
        "--target", :id,
        "--name", "Yubico YubiKey OTP+FIDO+CCID [0512]",
        "--product", "YubiKey OTP+FIDO+CCID"]
  end
end

