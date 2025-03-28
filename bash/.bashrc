# ~/.bashrc

# bash-git-prompt
if [ -f "/opt/homebrew/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    __GIT_PROMPT_DIR="/opt/homebrew/opt/bash-git-prompt/share"
    source "/opt/homebrew/opt/bash-git-prompt/share/gitprompt.sh"
fi

#bash-completion
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

# aliases
if [ -f ~/my_aliases ]; then
	source ~/my_aliases
fi

# bash history
HISTFILE=~/.bash_history
HISTCONTROL=ignoredups
HISTSIZE=10000
SAVEHIST=10000
HISTIGNORE="&:ls:ps:history"
ISTTIMEFORMAT="%F %T "
shopt -s histappend

# Check if the history file exists, if not, create it
if [[ ! -f $HISTFILE ]]; then
  touch $HISTFILE
  chmod 600 $HISTFILE
fi
