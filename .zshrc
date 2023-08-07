export PATH=$HOME/bin:/usr/local/bin:/opt/homebrew/bin:$HOME/.local/bin:$PATH
export ZSH="/Users/stevenyeu/.oh-my-zsh"
alias tms="tmux-sessionizer" 
alias vim="nvim"
alias tmm="tmux new -A -s main"
alias tl="tmux ls"
alias tss="tmux-switch.sh"
alias op=". open-project.sh"
ZSH_THEME="refined"

plugins=(
git
zsh-syntax-highlighting
zsh-autosuggestions
zsh-nvm
)
export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES
source $ZSH/oh-my-zsh.sh

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH"$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


export PATH="/Library/TeX/texbin:$PATH"

[[ -s "/Users/stevenyeu/.gvm/scripts/gvm" ]] && source "/Users/stevenyeu/.gvm/scripts/gvm"

export XDG_CONFIG_HOME="$HOME/.config"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH=$PATH:/Users/stevenyeu/.spicetify
