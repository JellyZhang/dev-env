#!/bin/bash
echo "Enter user home path:"
read home
sudo apt -y install \
    curl \
    git \
    python3 \
    wget \
    nodejs \
    npm \
    snapd \
    zsh \
    ranger \
    python3-dev \
    python3-pip \
    tmux

sudo snap install --classic \
    go \
    nvim \
    ccls


# zsh
rm -rf $home/.oh-my-zsh >> /dev/null
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm $home/.zshrc >> /dev/null
cp ./.zshrc $home/.zshrc
sed -i "1i export ZSH=$home/.oh-my-zsh"  "$home/.zshrc"
zsh $home/.zshrc

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

rm $home/.p10k.zsh >> /dev/null
cp ./.p10k.zsh $home/.p10k.zsh
zsh $home/.zshrc

# ranger
cp -r ./ranger $home/.config/ranger

# nvim
rm -rf $home/.config >> /dev/null
mkdir -p $home/.config/nvim

if [ -f $home/.config/nvim/init.vim ]
then
    rm $home/.config/nvim/init.vim  >> /dev/null
fi


sudo npm install -g neovim
cp ./init.vim $home/.config/nvim/init.vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

/snap/bin/nvim +PlugInstall +qall
export GO111MODULE=on
mkdir $home/go
export GOPATH=$home/go
export GOPROXY=https://goproxy.cn,direct
/snap/bin/nvim --headless +GoInstallBinaries +qall

if [ -f $home/.config/nvim/coc-settings.json ]
then
    rm $home/.config/nvim/coc-settings.json >> /dev/null
fi
cp ./coc-settings.json $home/.config/nvim/coc-settings.json



pip3 install pynvim

go get github.com/gin-gonic/gin
go get github.com/tidwall/gjson
go get github.com/fperf/fperf
go get github.com/fsnotify/fsnotify
go get github.com/spf13/viper
go get github.com/spf13/pflag
go get github.com/spf13/cobra
go get go.uber.org/zap
go get github.com/sony/sonyflake
go get github.com/nicksnyder/go-i18n
go get gorm.io/gorm
go get github.com/jinzhu/now
go get github.com/jinzhu/configor
go get github.com/go-pg/pg/v10
go get github.com/go-redis/redis/v8
go get github.com/go-redis/cache/v8
go get github.com/google/wire/cmd/wire
go get github.com/spf13/viper
go get google.golang.org/grpc
go get github.com/spf13/cobra
go get github.com/prometheus/client_golang

# tmux
git clone https://github.com/gpakosz/.tmux.git $home/.tmux
ln -s -f $home/.tmux/.tmux.conf
cp ./.tmux.conf.local $home/.tmux.conf.local

# docker
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io



