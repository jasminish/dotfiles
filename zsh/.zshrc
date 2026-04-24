# general stuff
unsetopt flow_control
export EDITOR=/usr/bin/vim
export VIMINIT='source ~/.config/vim/vimrc'
export GIT_CONFIG_GLOBAL="$HOME/.config/gitconfig"

export ZSH_COMPDUMP=~/.cache/zsh/.zcompdump-$HOST
export HISTFILE=~/.cache/zsh/.zhistory
export HISTSIZE=1000
export SAVEHIST=1000
export LESSHISTFILE=~/.cache/.lesshst

setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution


fpath=(~/.config/zsh $fpath)
autoload -Uz compinit && compinit -i -d ~/.cache/zsh/zcompdump

# plugins
UZ_PLUGIN_PATH=~/.cache/zsh/zsh_plugins
export _Z_DATA=~/.cache/zsh/.z
source ~/.config/zsh/uz.zsh
zadd rupa/z
zadd zsh-users/zsh-autosuggestions
zadd zsh-users/zsh-history-substring-search
zadd zsh-users/zsh-syntax-highlighting


zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'


# prompt
setopt PROMPT_SUBST
source ~/.config/zsh/git.zsh
ZSH_AHEAD_COMMIT_PREFIX=" %F{green}+"
ZSH_BEHIND_COMMIT_PREFIX=" %F{red}-"
ZSH_GIT_DIRTY=" %F{red}⛔️%F{white}"
ZSH_GIT_CLEAN=" %F{green}✅%F{white}"

PROMPT="%F{yellow}%c ➜%F{white} "
PROMPT2="%F{yellow}➜%F{white} "
RPROMPT='%F{yellow} $(git_current_branch)$(git_commits_diff)$(git_dirty)'

# aliases
alias ..='cd ..'
alias ...='cd ../..'
calc() { echo $(($1)) }
alias ls='ls --color=auto'
alias l='ls -alh'
alias f='rg --files | fzf --preview "cat {}"'
s() { rg -i -l $1 | fzf --preview "cat {}"}
alias mkdir='mkdir -p'
alias pls='sudo -E'
alias src='source ~/.zshrc'

