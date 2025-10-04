export ZSH="/Users/nathanmacfarlane/.oh-my-zsh"

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="sorin"

plugins=(
  git
  zsh-autosuggestions
  web-search
  colored-man-pages
  zsh-syntax-highlighting
)

# zsh
source $ZSH/oh-my-zsh.sh
export PATH="/usr/local/mysql/bin:$PATH"
export PATH=$PATH:/usr/local/mysql/bin
# source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
# git 
alias gs="git status"
alias gst="git stash --include-untracked"
alias gnb="git checkout -b"
alias gpu="git push origin"
alias cat="bat"
alias gundo="git reset HEAD~1"
# projects
alias 431="cd $HOME/School/CSC431/compiler-false-false"
alias take="cd $HOME/School/CSC436/Take"
alias takegh="open https://github.com/nathanmacfarlane/Take"
# random
alias weather="curl wttr.in"
set clipboard=unnamed
# open vim sesson
alias vsl="vim -S ~/.vim_session"
alias c="clear"

# Minimal zsh theme
# Requires Nerd Fonts for the icons

# # Configuration
# num_dirs=1 # Use 0 for full path
# truncated_path="%F{cyan}%$num_dirs~%f"
# decoration=$'%F{magenta}\uF054%F{magenta}\uF054%F{magenta}\uF054%f'
# background_jobs=$'%(1j.%F{green}\uf1d8 %f.)'
# non_zero_return_value=$'%(0?..%F{red}\uf165  %f)'

# # Left part of prompt
# PROMPT='$truncated_path $decoration '
# # Right part of prompt
# RPROMPT='$background_jobs  $non_zero_return_value'
# # Input in bold
# zle_highlight=(default:bold)

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
# This loads nvm bash_completion

export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# bun completions
[ -s "/Users/nathanmacfarlane/.bun/_bun" ] && source "/Users/nathanmacfarlane/.bun/_bun"
