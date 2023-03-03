source ~/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# https://safjan.com/top-popular-zsh-plugins-on-github-2021/
# https://phuctm97.com/blog/zsh-antigen-ohmyzsh 
# Bundles from the default repo (oh-my-zsh).
# antigen reset - command to new
antigen bundle git
antigen bundle web-search 
antigen bundle pip
antigen bundle docker
antigen bundle python
antigen bundle command-not-found
antigen bundle copypath
antigen bundle copyfile
antigen bundle pp_json

# Syntax highlighting bundle.
eval "$(starship init zsh)"

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
# Tell Antigen that you're done.
antigen apply

# enable autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

#autoload -U compinit promptinit
#compinit
#promptinit

# <tab> for .*
_comp_options+=(globdots)

# ls after cd 
function lcd() {cd "$1" && ls}

# Completion style and rehash
zstyle ':completion:*' menu select 
zstyle ':completion:*' rehash true
setopt completealiases

# Save zshrc in case terminal frozen
ttyctl -f

# Hotkeys like bash
#[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
#[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
#[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
#[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
#[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
#[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history

# Recursive 
bindkey -v
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

# Help like in bash
autoload -U run-help
autoload run-help-git
autoload run-help-svn
autoload run-help-svk
#unalias run-help
alias help=run-help

# Autocorrection(thefuck alternative)
setopt correct

# magic sort: http://linuxshellaccount.blogspot.ru/2008/07/fancy-globbing-with-zsh-on-linux-and.html
setopt extended_glob

# Dont beep
unsetopt beep

# Vivat vim
export EDITOR="vim"

# Manage history
HISTFILE=$HOME/.zsh_history
HISTSIZE=9999
SAVEHIST=9999
# +time for commands in history
setopt extended_history
# <enter> -> new history
setopt inc_append_history
# common history for sessions and terms
setopt share_history
# ignore duplicates,cmd fc and history, and str like ' +', ' '  
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt HIST_NO_STORE
alias history='fc -il 1'

# Jobs change status notify
setopt NOTIFY

# rust tools
alias grep='rg'
alias cat='batcat'
#alias ps='procs'
alias ls='exa'

# work
alias janus='/Users/agayfutdinov/janus-cli get-password -pgpass'
export PATH="$PATH:$HOME/.local/bin"

# alias
alias blog='cd /mnt/c/projects/blog/rtmfrdch.github.io'
alias public_blog='pushd /mnt/c/projects/blog/rtmfrdch.github.io/public;\
        git add . ;\
        git commit -m "One more post";\
        git push;\
        popd'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

function cht() {curl "cht.sh/$1"}
