
#on git
function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1) /'
}

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[0;35m\]"
GRAY="\[\033[0m\]"
DARK="\[\033[30m\]"

# show branch name on the prompt
export PS1="$GREEN\u@$BLUE\h:\w$YELLOW\$(parse_git_branch)$GRAY\$ "
