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

upl() { cd ".." && l; }

mkcd() { mkdir "$@" && cd "$@"; }

mkbash() { touch "$@" && chmod +x "$@" && \
           { echo '#!/bin/bash' | tee -a "$@" > /dev/null; }; }

mkpython() { touch "$@" && chmod +x "$@" && \
             { echo '#!/usr/bin/env python3' | tee -a "$@" > /dev/null; }; }

alias mkpy=mkpython

mkproj() { [ "$1" ] && mkdir "$HOME/space/$1" && cd "$HOME/space/$1" && hg init; }

# Diary
alias dr='diary'
alias dn='diary new'
alias dl='diary list'
alias ds='diary search'
alias dsw='diary search -w'
alias de='diary edit'
alias det='diary edit -t'
alias dc='diary chain'

# Mercurial
alias hgl='hg glog | less'

# Misc
alias free='free -m'
alias vims='vim "+set syntax=markdown" "+set spell" "+set wrap" "+set linebreak" "+set breakat=\ " "+set display=lastline"'
alias up='cd ..'
alias dus='du -Dhs'
alias py='python3'
alias pyi='python3 -i'
alias back='cd -'
alias df='df -hT'
