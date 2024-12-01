#!/bin/bash

sudo docker build -t dotfiles:dev -f docker/Dockerfile .
sudo docker run -it dotfiles:dev bash
