DEFAULT_USER="hunghoang"
# ------------------------------------
# export
# ------------------------------------
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:$PATH
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# Path to your oh-my-zsh installation.
export ZSH=/Users/hunghoang/.oh-my-zsh

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

source $ZSH/oh-my-zsh.sh
source ~/.bin/tmuxinator.zsh
# Git flow completion
source ~/.git-flow-completion.zsh
# End------------------------------------


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  git-flow
	osx
  last-working-dir colored-man-pages
  wd
  history
  docker
  docker-compose
  npm
  yarn
  tmux
  python
  node
)

# ------------------------------------
# ANTIGEN to install plugins of zsh
# ------------------------------------
source /usr/local/share/antigen/antigen.zsh
antigen theme bhilburn/powerlevel9k powerlevel9k
antigen bundle ytet5uy4/fzf-widgets
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle lukechilds/zsh-nvm
# Tell antigen that you're done
antigen apply

# ------------------------------------
# VIM
# ------------------------------------
# Use vim mode in zsh
bindkey -v
export KEYTIMEOUT=1
# Change cursor indicator in zsh
source ~/.vim-prompt.zsh

# Enable Exact-match by fzf-insert-history
FZF_WIDGET_OPTS[insert-history]='--exact'

# Start fzf in a tmux pane
FZF_WIDGET_TMUX=1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
