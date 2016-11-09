#!/usr/bin/env bash

wget https://gitlab.com/alexey-wild/dotfiles/repository/archive.zip?ref=$1-$2 && unzip archive.zip ~/.dotfiles && rm archive.zip && bash  ~/.dotfiles/install.sh