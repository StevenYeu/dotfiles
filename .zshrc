export PATH="$HOME/.local/bin:/opt/homebrew/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="refined"

plugins=(
git
zsh-syntax-highlighting
zsh-autosuggestions
zsh-nvm
)

export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES
source $ZSH/oh-my-zsh.sh

alias tms="tmux-sessionizer" 
alias vim="nvim"
alias tmm="tmux new -A -s main"
alias tl="tmux ls"
alias tss="tmux-switch.sh"
alias op=". open-project.sh"
alias ls="eza"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH"$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[[ -s "/Users/stevenyeu/.gvm/scripts/gvm" ]] && source "/Users/stevenyeu/.gvm/scripts/gvm"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH=$PATH:/Users/stevenyeu/.spicetify
