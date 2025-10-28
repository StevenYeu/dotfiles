export PATH="$HOME/.local/bin:/opt/homebrew/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH=`go env GOPATH`/bin/:$PATH
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

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
alias ls="eza --long --color=always"
alias lsbp="eza --long --color=always --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias dcupd="docker compose up -d --build"
alias dcd="docker compose down"
alias dps="docker ps"
alias clr="clear"
alias lg="lazygit"
alias ldk="lazydocker"
alias vpn="sudo openconnect --user syeu@ucsd.edu --authgroup '2-Step Secured - split' vpn.ucsd.edu"
alias snp="op item get Snippets --reveal --fields "

bindkey -v
bindkey '^n' menu-complete
bindkey '^p' reverse-menu-complete
# Vim mode for zsh
# export VI_MODE_SET_CURSOR=true
# VI_MODE_CURSOR_INSERT=0

# Pyenv setup
# export PYENV_VIRTUALENV_DISABLE_PROMPT=1
# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

# Go version manager setup
[[ -s "/Users/stevenyeu/.gvm/scripts/gvm" ]] && source "/Users/stevenyeu/.gvm/scripts/gvm"

# Fzf setup
source <(fzf --zsh)
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAD"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
# export FZF_DEFAULT_OPTS="
# 	--color=fg:#908caa,bg:#191724,hl:#ebbcba
# 	--color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
# 	--color=border:#403d52,header:#31748f,gutter:#191724
# 	--color=spinner:#f6c177,info:#9ccfd8,separator:#403d52
# 	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"
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
