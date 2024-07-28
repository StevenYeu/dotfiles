## Script setup
mkdir -p $HOME/.local/bin
cp ./linux_scripts/* $HOME/.local/bin
mkdir $HOME/Repos

## Zsh setup
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
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
sudo dnf install htop find-fd bat tmux neovim neofetch bison chromium zig

#Font
git clone --depth=1 https://github.com/ryanoasis/nerd-fonts.git ~/Repos/nerd-fonts 
./$HOME/Repos/nerd-fonts/install.sh Geist

# Docker  
sudo dnf -y install dnf-plugins-core\nsudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# 1password
sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
sudo sh -c 'echo -e "[1password]\nname=1Password Stable Channel\nbaseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=\"https://downloads.1password.com/linux/keys/1password.asc\"" > /etc/yum.repos.d/1password.repo'
sudo dnf install 1password

#Starship
sudo dnf copr enable atim/starship
sudo dnf install starship

# Configure git fzf
git clone https://github.com/junegunn/fzf-git.sh.git $HOME/Repos/fzf-git.sh
cp ./.gitconfig ~/

# Kitty
cp ./linux_config/kitty/* ~/.config/kitty

# Rofi
cp ./linux_config/rofi/master-config.rasi ~/.config/rofi/
cp ./linux_config/rofi/config-search.rasi ~/.config/rofi/

# Wlogout
cp ./linux_config/wlogout/style.css ~/.config/wlogout/
cp ./linux_config/wlogout/icons/simple/* ~/.config/wlogout/icons/simple/
cp ./linux_config/hypr/scripts/Wlogout.sh ~/.config/hypr/scripts/

# Hypr 
cp ./linux_config/hypr/hypridle.conf ~/.config/hypr/
cp ./linux_config/hypr/hyprlock.conf ~/.config/hypr/
cp ./linux_config/hypr/hyprland.conf ~/.config/hypr/
cp ./linux_config/hypr/UserConfigs/* ~/.config/hypr/UserConfigs/
cp ./linux_config/hypr/UserScripts/* ~/.config/hypr/UserScripts/


# CLI for controlling Apple Studio Display Brightness
git clone https://github.com/juliuszint/asdbctl.git $HOME/Repos/asdbctil && cd $HOME/Repos/asdbctil 
cargo build --release

cd $HOME/Projects/setup/
