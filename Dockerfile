FROM node:slim

RUN apt update && apt install -y git wget procps zsh

# setup zsh color scheme inside container
ENV TERM xterm
ENV ZSH_THEME agnoster
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

WORKDIR /app

RUN npm install -g @vue/cli

COPY package.json package-lock.json /app/

RUN npm ci

COPY . /app

EXPOSE 8080