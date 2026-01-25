# Git prompt support
if [[ -f /usr/share/git/completion/git-prompt.sh ]]; then
    source /usr/share/git/completion/git-prompt.sh
fi

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM=auto
export GIT_OPTIONAL_LOCKS=0

RESET="\[\033[0m\]"

RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
MAGENTA="\[\033[0;35m\]"
CYAN="\[\033[0;36m\]"
GRAY="\[\033[0;90m\]"

project_root() {
    git rev-parse --show-toplevel 2>/dev/null
}


zig_segment() {
	local root
	root=$(project_root) || return 
	[[ -f "$root/build.zig" ]] || return
	local v
	v=$(zig version 2>/dev/null) || return
	echo " ${CYAN}zig:${v}${RESET}"
}

c_segment() {
	local root
	root=$(project_root) || return 
	[[ -f "$root/Makefile" || -f "$root/CMakeLists.txt" || -n $(ls *.c 2>/dev/null) ]] || return
	local cc
	cc=$(cc --version 2>/dev/null | head -n1 | awk '{print $1}')
	echo " ${CYAN}${cc}${RESET}"
}

python_segment() {
	local root
	root=$(project_root) || return 
    [[ -n "$VIRTUAL_ENV" || -f "$root/pyproject.toml" || -f "$root/requirements.txt" ]] || return
    local v
    v=$(python3 --version 2>/dev/null | awk '{print $2}')
    echo " ${CYAN}py:${v}${RESET}"
}

go_segment(){ 
	local root
	root=$(project_root) || return 
	[[ -f "$root/go.mod" || `ls -l *.go 2>/dev/null | wc -l` -gt 0 ]] || return 
	local v
	v=$(go version 2>/dev/null | awk '{printf $3}' | sed 's/^go//')
	echo " ${CYAN}go:${v}${RESET}"
}

rust_segment(){
	local root
	root=$(project_root) || return 
	[[ -f "$root/Cargo.toml" ]] || return 
	local v
	v=$(rustc --version 2>/dev/null | awk '{printf $2}')
	echo " ${CYAN}rust:${v}${RESET}"
}

__prompt_command() {
    local exit_code=$?

    if [[ $exit_code -eq 0 ]]; then
        ARROW="${GREEN}➜"
    else
        ARROW="${RED}➜"
    fi

    PS1="${ARROW} \
${BLUE}\W\
${MAGENTA}\
$(zig_segment)\
$(c_segment)\
$(python_segment)\
$(go_segment)\
$(rust_segment)\
${RESET} "
}

PROMPT_COMMAND=__prompt_command
