# Debug
[[ -n $DEBUG ]] && set -x

setopt PROMPT_SUBST
autoload -U add-zsh-hook
add-zsh-hook precmd _work_platformbin_ps1_get_context_ns
zmodload zsh/stat
zmodload zsh/datetime

WORK_PLATFORMBIN_PS1_BINARY="${WORK_PLATFORMBIN_PS1_BINARY:-platformbin}"
WORK_PLATFORMBIN_PS1_LAST_TIME=0
WORK_PLATFORMBIN_PS1_ENABLED=true
WORK_PLATFORMBIN_PS1_SYMBOL_ENABLE="${WORK_PLATFORMBIN_PS1_SYMBOL_ENABLE:-true}"
WORK_PLATFORMBIN_PS1_SYMBOL_DEFAULT="${WORK_PLATFORMBIN_PS1_SYMBOL_DEFAULT:-\u23C8 }"
# WORK_PLATFORMBIN_PS1_SYMBOL_USE_IMG="${WORK_PLATFORMBIN_PS1_SYMBOL_USE_IMG:-false}"

WORK_PLATFORMBIN_PS1_COLOR_SYMBOL="%{$fg[blue]%}"
WORK_PLATFORMBIN_PS1_COLOR_CONTEXT="%{$fg[yellow]%}"

_work_platformbin_ps1_binary_check() {
  command -v "$1" >/dev/null
}

_work_platformbin_ps1_symbol() {
  [[ "${WORK_PLATFORMBIN_PS1_SYMBOL_ENABLE}" == false ]] && return

  WORK_PLATFORMBIN_PS1_SYMBOL="${WORK_PLATFORMBIN_PS1_SYMBOL_DEFAULT}"
  WORK_PLATFORMBIN_PS1_SYMBOL_IMG="\u26C8 "

  if [[ "${WORK_PLATFORMBIN_PS1_SYMBOL_USE_IMG}" == true ]]; then
    WORK_PLATFORMBIN_PS1_SYMBOL="${WORK_PLATFORMBIN_PS1_SYMBOL_IMG}"
  fi

  echo "${WORK_PLATFORMBIN_PS1_SYMBOL}"
}

# function to disable the prompt on the current shell
work_platformbin_on(){
  WORK_PLATFORMBIN_PS1_ENABLED=true
}

# function to disable the prompt on the current shell
work_platformbin_off(){
  WORK_PLATFORMBIN_PS1_ENABLED=false
}

_work_platformbin_ps1_get_context_ns() {

  # Set the command time
  SPLUK_CLOUDCTL_PS1_LAST_TIME=$EPOCHSECONDS
  WORK_PLATFORMBIN_PS1_CONTEXT="$(cat ~/.platformbin/config.yaml | grep env | awk '{print $2}')"
  if [[ -z "${WORK_PLATFORMBIN_PS1_CONTEXT}" ]]; then
    WORK_PLATFORMBIN_PS1_CONTEXT="N/A-Context"
    return
  fi
}

# Build our prompt
work_platformbin_ps1 () {
  local reset_color="%{$reset_color%}"
  [[ ${WORK_PLATFORMBIN_PS1_ENABLED} != 'true' ]] && return

  WORK_PLATFORMBIN_PS1="${reset_color}$WORK_PLATFORMBIN_PS1_PREFIX"
  WORK_PLATFORMBIN_PS1+="${WORK_PLATFORMBIN_PS1_COLOR_SYMBOL}$(_work_platformbin_ps1_symbol)"
  WORK_PLATFORMBIN_PS1+="${reset_color}$WORK_PLATFORMBIN_PS1_SEPERATOR"
  WORK_PLATFORMBIN_PS1+="${WORK_PLATFORMBIN_PS1_COLOR_CONTEXT}$WORK_PLATFORMBIN_PS1_CONTEXT${reset_color}"
  WORK_PLATFORMBIN_PS1+="$WORK_PLATFORMBIN_PS1_SUFFIX"

  echo "${WORK_PLATFORMBIN_PS1}"
}

