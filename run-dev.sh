#!/bin/bash

sudo docker build -t dev/dotfiles-setup -f Dockerfile .
sudo docker run -it dev/dotfiles-setup bash
