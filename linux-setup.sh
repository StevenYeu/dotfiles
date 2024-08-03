## Script setup
mkdir -p $HOME/.local/bin
cp ./linux_scripts/* $HOME/.local/bin
mkdir $HOME/Repos

## Zsh setup
# git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
cp ./.zshrc_linux $HOME/.zshrc

## Setup Tmux
cp ./.tmux.conf $HOME/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

## Install gvm
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

## Install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

## Configure Bat
mkdir -p "$(bat --config-dir)/themes"
cp ./bat-themes/* "$(bat --config-dir)/themes"
bat cache --build

# Install Packges
# yay -S htop find-fd bat tmux neovim neofetch bison chromium zig 1password otf-geist-mono-nerd docker docker-compose docker-buildx starship

# Setup starship
starship preset nerd-font-symbols -o ~/.config/starship.toml

# Configure git fzf
git clone https://github.com/junegunn/fzf-git.sh.git $HOME/Repos/fzf-git.sh
cp ./.gitconfig ~/

# Kitty
cp ./linux_config/kitty/* ~/.config/kitty

# Rofi
# cp ./linux_config/rofi/master-config.rasi ~/.config/rofi/
# cp ./linux_config/rofi/config-search.rasi ~/.config/rofi/

# Wlogout
cp ./linux_config/wlogout/style.css ~/.config/wlogout/
mkdir ~/.config/wlogout/icons/simple
cp ./linux_config/wlogout/icons/simple/* ~/.config/wlogout/icons/simple/
cp ./linux_config/hypr/scripts/Wlogout.sh ~/.config/hypr/scripts/


# CLI for controlling Apple Studio Display Brightness
# git clone https://github.com/juliuszint/asdbctl.git $HOME/Repos/asdbctil && cd $HOME/Repos/asdbctil 
# cargo build --release

cd $HOME/Projects/setup/
