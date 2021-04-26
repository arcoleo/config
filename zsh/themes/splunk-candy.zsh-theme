PROMPT=$'%{$fg_bold[green]%}%n %{$fg[blue]%}%D{[%X]} %{$reset_color%}%{$fg[white]%}[%~]%{$reset_color%} $(git_prompt_info) [$(splunk_cloudctl_ps1)] $(splunk_kube_ps1)\
%{$fg[blue]%}->%{$fg_bold[blue]%} %#%{$reset_color%} '

# PROMPT=$'%{$fg_bold[green]%}%n@%m %{$fg[blue]%}%D{[%X]} %{$reset_color%}%{$fg[white]%}[%~]%{$reset_color%} $(git_prompt_info) [$(splunk_cloudctl_ps1)] $(kube_ps1)\
# %{$fg[blue]%}->%{$fg_bold[blue]%} %#%{$reset_color%} '


ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
