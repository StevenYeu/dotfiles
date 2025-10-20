## Script setup
mkdir -p $HOME/.local/bin
mkdir $HOME/Repos
mkdir $HOME/Projects

## Zsh setup
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete

## Bat
bat cache --build

## Configure git fzf
git clone https://github.com/junegunn/fzf-git.sh.git $HOME/Repos/fzf-git.sh

## Copy over wallpapers
git clone https://github.com/JaKooLit/Wallpaper-Bank.git $HOME/Pictures/Wallpapers
