#! /usr/bin/env bash

stow i3
stow nvim
stow lvim
stow personal-linux
stow fonts
stow tmux

ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
