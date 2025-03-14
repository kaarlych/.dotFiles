# ~/.bashrc

# bash-git-prompt
if [ -f "/opt/homebrew/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    __GIT_PROMPT_DIR="/opt/homebrew/opt/bash-git-prompt/share"
    source "/opt/homebrew/opt/bash-git-prompt/share/gitprompt.sh"
  fi

#bash-completion
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"