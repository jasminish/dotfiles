# Git functions
function is_git_repo() {
  return $(command git rev-parse --git-dir &>/dev/null)
}

function git_current_branch() {
  echo $(command git symbolic-ref --short HEAD 2>/dev/null)
}

function git_commits_diff() { # number of commits ahead / behind remote
    local behind="$(git rev-list --count HEAD..@{upstream} 2>/dev/null)"
    local ahead="$(git rev-list --count @{upstream}..HEAD 2>/dev/null)"
    local diff=""
    if [[ -n "$behind" && "$behind" != 0 ]]; then
      diff+="$ZSH_BEHIND_COMMIT_PREFIX$behind"
    fi
    if [[ -n "$ahead" && "$ahead" != 0 ]]; then
      diff+="$ZSH_AHEAD_COMMIT_PREFIX$ahead"
    fi
       echo "$diff"
}

function git_dirty() {
  if $(is_git_repo); then
    local stat=$(command git status --porcelain 2> /dev/null | tail -n1)
    if [[ -n $stat ]]; then
     echo $ZSH_GIT_DIRTY
    else 
      echo $ZSH_GIT_CLEAN
    fi
  fi
}

# Git aliases 
alias g='git'
alias ga='git add'
alias gb='git branch'
alias gc='git clone'
alias gcn!='git commit --no-edit --amend'
alias gcm='git checkout master'
alias gcmsg='git commit -m'
alias gco='git checkout'
alias gd='git diff'
alias gf='git fetch'
alias glog='git log --oneline --decorate --graph'
alias gm='git merge'
alias gp='git push origin $(git_current_branch)'
alias gsh='git show'
alias gst='git status'
alias gsta='git stash push'
alias gstp='git stash pop'
alias gupa='git pull --rebase --autostash'
alias gbclean='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'

