# source: https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/git.plugin.zsh
alias g="git"
alias gss="git status -s"
alias gc="git commit"
alias gd='git diff'
alias ga='git add'
alias gaa='git add --all'
alias gah='git add .'
alias gb='git branch'
alias gbD='git branch -D'
alias gbr='git branch --remote'
alias gf='git fetch'
alias gfa='git fetch --all --prune'
alias gfo='git fetch origin'
alias gm='git merge'
alias gp="git push"
alias gl='git pull'
alias grh='git reset .'
alias grs='git reset . --staged'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcm='git checkout $(git_main_branch)'
alias gstp='git stash pop'
alias gsts='git stash show -p'
alias glog='git log --oneline --decorate --graph'
alias gsi='git submodule init'
alias gsu='git submodule update'
