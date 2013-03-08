# List
alias   l='ls -FCBH --group-directories-first'
alias  la='ls -FCBHA --group-directories-first'

alias  ll='ls -ohFH --group-directories-first'
alias lal='ls -ohFHA --group-directories-first'

alias  lt='ls -ohFHt --group-directories-first'
alias lat='ls -ohFHtA --group-directories-first'

alias  lg='ls -ohFH | grep --group-directories-first'
alias lag='ls -ohFAH | grep --group-directories-first'

alias  lr='ls -FCBHR --group-directories-first'
alias lar='ls -FCBHAR --group-directories-first'

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
alias diary='~/space/diary/stable/src/diary'
alias dr='diary'
alias dn='diary new'
alias dl='diary list'
alias ds='diary search'
alias dsw='diary search -w'
alias de='diary edit'
alias det='diary edit -t'
alias dc='diary chain'

# Mercurial
alias hl='hg glog | less'
alias hs='hg st'
alias hc='hg ci'

# Misc
alias free='free -m'
alias vims='vim "+set syntax=markdown" "+set spell" "+set wrap" "+set linebreak" "+set breakat=\ " "+set display=lastline"'
alias up='cd ..'
alias dus='du -Dhs'
alias py='python3'
alias pyi='python3 -i'
alias back='cd -'
alias df='df -hT'
