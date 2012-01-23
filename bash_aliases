# List
alias   l='ls -FCBH'
alias  la='ls -FCBHA'

alias  ll='ls -ohFH'
alias lal='ls -ohFHA'
alias  lt='ls -ohFHt'
alias lat='ls -ohFHtA'
alias  lg='ls -ohFH | grep'
alias lag='ls -ohFAH | grep'

function cdl { cd "$@"; l; }
function mkcd { mkdir "$@"; cd "$@"; }

# Diary
alias dr='diary'
alias dl='diary list'
alias ds='diary search'
alias dsw='diary search -w'
alias de='diary edit'
alias dc='diary checklist'

# Mercurial
alial hgl='hg glog | less'

# Misc
alias free='free -m'
