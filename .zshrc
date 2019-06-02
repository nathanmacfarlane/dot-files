export ZSH="/Users/nathanmacfarlane/.oh-my-zsh"

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="sorin"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  web-search
  osx
  colored-man-pages
)

# zsh
source $ZSH/oh-my-zsh.sh
export PATH="/usr/local/mysql/bin:$PATH"
export PATH=$PATH:/usr/local/mysql/bin
# git 
alias gs="git status"
alias gnb="git checkout -b"
alias gpu="git push origin"
alias cat="bat"
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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/nathanmacfarlane/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/nathanmacfarlane/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/nathanmacfarlane/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/nathanmacfarlane/google-cloud-sdk/completion.zsh.inc'; fi
