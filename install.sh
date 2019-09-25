#!/usr/bin/env bash

# Install brew 
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null ; brew install caskroom/cask/brew-cask 2> /dev/null

brew install mackup
mackup restore 

###NOTE: some of the following command needs Mackup to be restored
###NOTE: After running this check if mackup has restored configs file, if not need to delete newly created files and restore mackup again
# VIM
brew install vim -- --with-override-system-vim --with-lua --with-luajit
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
brew install neovim

# APP
brew cask install iterm2
brew cask install bettertouchtool
brew cask install Dropbox
brew cask install Lastpass
brew cask install Chrome
brew cask install Itsycal
brew cask install kap

# ZSH
brew install antigen
brew install tmux
# upgrade Ruby version: https://stackoverflow.com/questions/38194032/how-to-update-ruby-version-2-0-0-to-the-latest-version-in-mac-osx-yosemite
brew link --overwrite ruby
gem install tmuxinator


# Developer
brew install nvm
nvm alias default node

brew install node
brew install yarn
brew install git-flow-avh # this one has bugfix branch
brew install ccat
brew install fzf

mkdir -p ~/workspace

# VS Code
brew cask install visual-studio-code-insiders
# If the following command fails, open vscode and Run: Install 'vscode-insiders' command in PATH
code-insiders --install-extension Shan.code-settings-sync