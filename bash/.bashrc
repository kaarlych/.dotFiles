# ~/.bashrc

# bash-git-prompt
#if [ -f "/opt/homebrew/opt/bash-git-prompt/share/gitprompt.sh" ]; then
 #   __GIT_PROMPT_DIR="/opt/homebrew/opt/bash-git-prompt/share"
  #  source "/opt/homebrew/opt/bash-git-prompt/share/gitprompt.sh"
 # fi
 
 source "${HOME}/.shared_prompt"

PS1="\$(prompt_venv)" # virtual environment
PS1+="\[${bold}\]\n" # newline
PS1+="\[${userStyle}\]\u" # username
PS1+="\[${white}\] at "
PS1+="\[${hostStyle}\]\h" # host
PS1+="\[${white}\] in "
PS1+="\[${green}\]\W" # working directory
PS1+="\$(prompt_git)" # Git repository details
PS1+="\n"
PS1+="\[${white}\]\$ \[${reset}\]" # `$` (and reset color)
export PS1

PS2="\[${yellow}\]→ \[${reset}\]"
export PS2
 

#bash-completion
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
