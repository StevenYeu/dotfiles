## Homebrew etup
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
/opt/homebrew/bin/brew bundle install

## Script setup
mkdir -p $HOME/.local/bin
cp ./scripts/* $HOME/.local/bin
mkdir $HOME/Repos
mkdir $HOME/Projects

## Zsh setup
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
cp ./.zshrc $HOME/.zshrc

## Setup Aerospace 
cp ./.aerospace.toml $HOME/.aerospace.toml

## Setup wezterm
cp ./.wezterm.lua $HOME/.wezterm.lua

## Setup Tmux
cp ./.tmux.conf $HOME/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

## Install gvm
# zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

## Install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

## Configure Bat
mkdir -p "$(bat --config-dir)/themes"
cp ./bat-themes/* "$(bat --config-dir)/themes"
bat cache --build


## Configure git fzf
git clone https://github.com/junegunn/fzf-git.sh.git $HOME/Repos/fzf-git.sh
cp ./.gitconfig ~/
