#!/usr/bin/env bash

# Install Homebrew
if ! brew -v COMMAND &> /dev/null
then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install brew capable software
brew install git
brew install python@3.7
brew install node npm
brew install zsh
brew install tmux
brew install --HEAD luajit
brew install --HEAD neovim
brew tap caskroom/cask
brew install --cask ubersicht
brew tap xorpse/formulae
brew install xorpse/formulae/yabai
brew install koekeishiya/formulae/skhd
brew services start skhd

# Install configs from github

# Simple-bar
git clone https://github.com/Jean-Tinland/simple-bar $HOME/Library/Application\ Support/Übersicht/widgets/simple-bar

# Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y

# Powerlevel 10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# LunarVim
LVBRANCH=rolling bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/rolling/utils/installer/install.sh)

