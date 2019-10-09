DEFAULT_USER="hunghoang"
# ------------------------------------
# export
# ------------------------------------
#
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:$PATH:/$GOBIN
export NVM_DIR="$HOME/.nvm"
export ZSH=/Users/hunghoang/.oh-my-zsh
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

for file in ~/.{path,exports,aliases,functions,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  git-flow
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
# SOURCE FILES
# ------------------------------------

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
source ~/.bin/tmuxinator.zsh
source ~/.git-flow-completion.zsh
# Must after plugins
source $ZSH/oh-my-zsh.sh

# ------------------------------------
# ANTIGEN to install plugins of zsh
# ------------------------------------
source /usr/local/share/antigen/antigen.zsh
antigen theme bhilburn/powerlevel9k powerlevel9k
antigen bundle ytet5uy4/fzf-widgets
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle lukechilds/zsh-nvm
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

# Vi-mode: Backspace not working as expected in insert mode
# https://github.com/denysdovhan/spaceship-prompt/issues/91
bindkey "^?" backward-delete-char
