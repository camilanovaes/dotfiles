FROM ubuntu:jammy

RUN apt update && apt install -y python3 sudo

COPY . dotfiles

WORKDIR dotfiles
