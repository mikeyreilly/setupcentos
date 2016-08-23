#install guest addition dependencies
yum -y install dkms kernel-devel-$(uname -r) kernel-headers-$(uname -r)

#Install MATE on CentOS 7

yum -y install epel-release
yum -y groupinstall "X Window system"
yum -y groupinstall "MATE Desktop"
systemctl set-default graphical.target

yum install -y wget curl-devel expat-devel gettext-devel \
      openssl-devel zlib-devel gcc perl-ExtUtils perl-devel
cd /usr/local/src
wget https://www.kernel.org/pub/software/scm/git/git-2.9.3.tar.gz
tar xzf git-2.9.3.tar.gz
cd git-2.9.3
./configure
make
make install

#Install Latest Stable Emacs from source on CentOS

yum install -y gtk3-devel libXpm-devel gcc giflib-devel libX11-devel libXft-devel \
       libjpeg-turbo-devel libtiff-devel make ncurses-devel -y
cd /usr/local/src
wget http://ftp.gnu.org/pub/gnu/emacs/emacs-24.5.tar.gz
tar xzvf emacs-24.5.tar.gz
cd emacs-24.5
./configure
make && make install


#Install Chrome on CentOS 7

cat <<EOF >/etc/yum.repos.d/google-chrome.repo
[google-chrome]
name=google-chrome
baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
enabled=1
gpgcheck=1
gpgkey=https://dl.google.com/linux/linux_signing_key.pub
EOF
yum install -y google-chrome-stable


