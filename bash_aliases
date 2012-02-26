# List
alias   l='ls -FCBH'
alias  la='ls -FCBHA'

alias  ll='ls -ohFH'
alias lal='ls -ohFHA'

alias  lt='ls -ohFHt'
alias lat='ls -ohFHtA'

alias  lg='ls -ohFH | grep'
alias lag='ls -ohFAH | grep'

# Functions
cdl() { cd "$@" && l; }
cdp() { cd "$HOME/space/$1" && l; }
mkcd() { mkdir "$@" && cd "$@"; }
mkscript() { touch "$@" && chmod +x "$@" && \
             { echo '#!/bin/bash' | tee -a "$@" > /dev/null; }; }
mkproj() { [ "$1" ] && mkdir "$HOME/space/$1" && cd "$HOME/space/$1" && hg init; }

# Diary
alias dr='diary'
alias drd='diary-dev'
alias drs='diary-stable'
alias dn='diary new'
alias dl='diary list'
alias ds='diary search'
alias dsw='diary search -w'
alias de='diary edit'
alias det='diary edit -t'
alias dc='diary checklist'

# Mercurial
alias hgl='hg glog | less'

# Misc
alias free='free -m'
alias vims='vim "+set spell"'
alias up='cd ..'
