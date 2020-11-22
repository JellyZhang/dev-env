FROM alpine
MAINTAINER jellyzhang "zhangjelly0405@gmail.com"

# 修改apk源
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk update

# 安装常用工具
RUN apk add -u \
    curl \
    git \
    python3 \
    wget


# 安装golang
RUN apk add -u go
RUN go version


WORKDIR /root

## 安装nvim
RUN apk add \
    neovim \
    nodejs \
    npm 

RUN npm install -g neovim
RUN mkdir -p /root/.config/nvim
COPY ./init.vim ./.config/nvim/init.vim
RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
RUN nvim +PlugInstall +qall


## nvim go支持
RUN go env -w GO111MODULE=on && go env -w GOPROXY=https://goproxy.cn,direct
RUN nvim --headless +GoInstallBinaries +qall

## nvim cpp支持
RUN apk add alpine-sdk cmake make clang clang-static clang-dev llvm-dev llvm-static \
    && git clone --depth=1 --recursive https://github.com/MaskRay/ccls \
    && cd ccls \
    && cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release \
    && cmake --build Release --target install
COPY ./coc-settings.json ./.config/nvim/coc-settings.json


# zsh
RUN apk add zsh which
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
RUN git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
COPY ./.zshrc ./.zshrc
COPY ./.p10k.zsh ./.p10k.zsh
RUN zsh ./.zshrc


# ranger
RUN apk add ranger
COPY ./ranger ./.config/ranger

# python
RUN apk add \
    python2-dev \
    python3-dev \
    py-pip

RUN pip install pynvim

RUN apk add \
        openssh

# golang package
RUN go get github.com/gin-gonic/gin
RUN go get github.com/tidwall/gjson
RUN go get github.com/fperf/fperf
RUN go get github.com/fsnotify/fsnotify
RUN go get github.com/spf13/viper
RUN go get github.com/spf13/pflag
RUN go get github.com/spf13/cobra
RUN go get go.uber.org/zap
RUN go get github.com/sony/sonyflake
RUN go get github.com/nicksnyder/go-i18n
RUN go get gorm.io/gorm
RUN go get github.com/jinzhu/now
RUN go get github.com/jinzhu/configor
RUN go get github.com/go-pg/pg/v10
RUN go get github.com/go-redis/redis/v8
RUN go get github.com/go-redis/cache/v8
RUN go get github.com/google/wire/cmd/wire
RUN go get github.com/spf13/viper
RUN go get google.golang.org/grpc
RUN go get github.com/spf13/cobra
RUN go get github.com/prometheus/client_golang

# tmux
RUN apk add \
        tmux

RUN git clone https://github.com/gpakosz/.tmux.git
RUN ln -s -f ./.tmux/.tmux.conf
COPY ./.tmux.conf.local ./.tmux.conf.local






CMD tail -f /dev/null
