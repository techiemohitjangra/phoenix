#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# ====================
#       CONFIG        
# ====================
set -o vi
bind -m vi


# ====================
#      HISTORY        
# ====================
HISTSIZE=100000
HISTFILESIZE=200000
HISTCONTROL=ignoreboth
shopt -s histappend
PROMPT_COMMAND="history -a; history -n"



# ====================
#      ALIASES        
# ====================
alias ls='lsd --color=auto'
alias grep='grep --color=auto'
alias tree='tree -C'
alias cat='bat'

# ====================
#      EXPORTS        
# ====================
export QT_QPA_PLATFORM=wayland
export LIBVA_DRIVER_NAME=radeonsi
export VDPAU_DRIVER=radeonsi
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.local/scripts
export PATH=$PATH:$HOME/go/bin

# ====================
#       CUSTOM        
# ====================

# search history using fzf
history_search_fzf() {
  local out key cmd

  out=$(history |
    sort |
    sed 's/^[[:space:]]*[0-9]\+[[:space:]]*//' |
    fzf --scheme=history --no-sort --expect=enter,ctrl-e) || return

  key=$(head -n1 <<<"$out")
  cmd=$(tail -n1 <<<"$out")

  [[ -z "$cmd" ]] && return

  case "$key" in
  enter | "")
    printf '%s\n' "$cmd"
    ;;
  ctrl-e)
    eval "$cmd"
    ;;
  esac
}

# ====================
#      KEYBINDS       
# ====================
bind -x '"\C-h":"history_search_fzf"'
bind -x '"\C-t":"tmux_sessionizer"'

# ====================
#      Execute        
# ====================
source $HOME/.bash_prompt.sh
