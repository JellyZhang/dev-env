#!/bin/bash

read -p "Enter user home path:" home
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

sudo npm install -g neovim


rm -rf ~/.config >> /dev/null
mkdir -p ~/.config/nvim

if [ -f ~/.config/nvim/init.vim ]
then
    rm ~/.config/nvim/init.vim  >> /dev/null
fi

cp ./init.vim ~/.config/nvim/init.vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

/snap/bin/nvim +PlugInstall +qall
go env -w GO111MODULE=on
mkdir ~/go
go env -w GOPATH=$home/go
go env -w GOROOT=/snap/bin/go
go env -w GOPROXY=https://goproxy.cn,direct
/snap/bin/nvim --headless +GoInstallBinaries +qall

if [ -f ~/.config/nvim/coc-settings.json ]
then
    rm ~/.config/nvim/coc-settings.json >> /dev/null
fi
cp ./coc-settings.json ~/.config/nvim/coc-settings.json

rm -rf ~/.oh-my-zsh >> /dev/null
cp -r ./.oh-my-zsh ~/.oh-my-zsh
rm ~/.zshrc >> /dev/null
cp ./.zshrc ~/.zshrc
rm ~/.p10k.zsh >> /dev/null
cp ./.p10k.zsh ~/.p10k.zsh
zsh ~/.zshrc
cp -r ./ranger ~/.config/ranger


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
git clone https://github.com/gpakosz/.tmux.git ~/.tmux
ln -s -f ~/.tmux/.tmux.conf
cp ./.tmux.conf.local ~/.tmux.conf.local

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
sudo apt-get install docker-ce docker-ce-cli containerd.io


