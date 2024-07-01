export PATH="$HOME/.local/bin:/opt/homebrew/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

ZSH_THEME=""
plugins=(
git
zsh-syntax-highlighting
zsh-autosuggestions
zsh-nvm
zsh-vi-mode
asdf
)
source $ZSH/oh-my-zsh.sh

alias tms="tmux-sessionizer.sh" 
alias vim="nvim"
alias tmm="tmux new -A -s main"
alias tl="tmux ls"
alias tks="tmux kill-server"
alias tss="tmux-switch.sh"
alias op=". open-project.sh"
alias ls="eza"
alias dcupd="docker compose up -d --build"
alias dcd="docker compose down"
alias dps="docker ps"

export VI_MODE_SET_CURSOR=true
ZVM_VI_EDITOR=/opt/homebrew/bin/nvim
ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK

export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH"$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


[[ -s "/Users/stevenyeu/.gvm/scripts/gvm" ]] && source "/Users/stevenyeu/.gvm/scripts/gvm"

eval "$(starship init zsh)"

function zvm_after_init() {
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
}
