# List
alias l='ls -FCBH'
alias ll='ls -ohFH'
alias la='ls -ohFAH'
alias lg='ls -ohFH | grep'
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

# Misc
alias free='free -m'
