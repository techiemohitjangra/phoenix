# Git prompt support
if [[ -f /usr/share/git/completion/git-prompt.sh ]]; then
    source /usr/share/git/completion/git-prompt.sh
fi

export GIT_OPTIONAL_LOCKS=0

# Disable git-prompt's own status symbols so only our custom _git_state symbols appear
export GIT_PS1_SHOWDIRTYSTATE=0
export GIT_PS1_SHOWSTASHSTATE=0
export GIT_PS1_SHOWUNTRACKEDFILES=0
export GIT_PS1_SHOWUPSTREAM=""

RESET="\[\033[0m\]"
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"

_git_state() {
    local state=""
    local staged=0 unstaged=0 untracked=0
    local line x y

    while IFS= read -r line; do
        [[ -z "$line" ]] && continue
        x="${line:0:1}"
        y="${line:1:1}"

        [[ "$x" == "?" || "$y" == "?" ]] && untracked=1
        [[ "$x" != " " && "$x" != "?" ]] && staged=1
        [[ "$y" != " " && "$y" != "?" ]] && unstaged=1
    done <<< "$(git status --porcelain 2>/dev/null)"

    if (( staged && unstaged )); then
        state+="✕"
    elif (( staged )); then
        state+="↑"
    elif (( unstaged )); then
        state+="→"
    fi

    (( untracked )) && state+="+"
    git rev-parse --verify refs/stash >/dev/null 2>&1 && state+="↓"

    echo "$state"
}

__prompt_command() {
    local exit_code=$?
    local arrow

    if [[ $exit_code -eq 0 ]]; then
        arrow="${GREEN}➜"
    else
        arrow="${RED}➜"
    fi

    local branch state git_info
    branch=$(__git_ps1 '%s')
    state=$(_git_state)

    # Branch color options:
    # Option A: always yellow branch
    local git_color="${YELLOW}"
    # Option B: green when clean, yellow when dirty
    # local git_color="${GREEN}"
    # [[ -n "$state" ]] && git_color="${YELLOW}"

    if [[ -n "$branch" ]]; then
        git_info=" ${branch}"
        [[ -n "$state" ]] && git_info+=" ${state}"
    fi

    PS1="${arrow}${RESET} ${BLUE}\W${RESET}${git_color}${git_info}${RESET} "
}

if [[ -n "$PROMPT_COMMAND" && "$PROMPT_COMMAND" != *"__prompt_command"* ]]; then
    PROMPT_COMMAND="$PROMPT_COMMAND; __prompt_command"
else
    PROMPT_COMMAND=__prompt_command
fi
