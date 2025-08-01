export PATH="$HOME/.local/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""
plugins=(
git
zsh-syntax-highlighting
zsh-autosuggestions
zsh-nvm
zsh-autocomplete
)
source $ZSH/oh-my-zsh.sh

alias tms="tmux-sessionizer.sh" 
alias vim="nvim"
alias tmm="tmux new -A -s main"
alias tl="tmux ls"
alias tks="tmux kill-server"
alias tss="tmux-switch.sh"
alias opn=". open-project.sh"
alias opass="/usr/bin/op"
alias ls="eza --long --color=always"
alias lsbp="eza --long --color=always --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias dcupd="docker compose up -d --build"
alias dcd="docker compose down"
alias dps="docker ps"
alias clr="clear"
alias lg="lazygit"
alias ldk="lazydocker"
alias g="~/.g/bin/g"
alias snp="op item get Snippets --reveal --fields "
alias vpn="sudo openconnect --user syeu@ucsd.edu --authgroup '2-Step Secured - split' vpn.ucsd.edu"

bindkey -v
bindkey '^n' menu-complete
bindkey '^p' reverse-menu-complete

# Pyenv setup
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
eval "$(pyenv virtualenv-init - zsh)"

# Fzf setup
source <(fzf --zsh)
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAD"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_OPTS="
	--color=fg:#908caa,bg:-1,hl:#ebbcba
	--color=fg+:#e0def4,bg+:-1,hl+:#ebbcba
	--color=border:#403d52,header:#31748f,gutter:-1
	--color=spinner:#f6c177,info:#9ccfd8,separator:#403d52
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

_fzf_compgen_path(){
    fd --hidden --exclude .git . "$1"
} 


_fzf_compgen_dir(){
    fd --type=d --hidden --exclude .git . "$1"
} 
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo $'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}
source ~/Repos/fzf-git.sh/fzf-git.sh

# Bat 
export BAT_THEME=rose-pine

# Yazi
export EDITOR="nvim"
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Starship
eval "$(starship init zsh)"

# Zoxide 
eval "$(zoxide init zsh)"

# 1password completion
eval "$(op completion zsh)"; compdef _op op

# Golang Version Manager
if [[ -n $(alias g 2>/dev/null) ]]; then
    unalias g
fi
[ -s "${HOME}/.g/env" ] && \. "${HOME}/.g/env"  # g shell setup

