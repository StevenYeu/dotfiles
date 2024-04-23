export PATH="$HOME/.local/bin:/opt/homebrew/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="refined"

plugins=(
git
zsh-syntax-highlighting
zsh-autosuggestions
zsh-nvm
zsh-vi-mode
)

export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES
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

ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK
ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH"$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[[ -s "/Users/stevenyeu/.gvm/scripts/gvm" ]] && source "/Users/stevenyeu/.gvm/scripts/gvm"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

