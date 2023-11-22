selected=$(find ~/Projects -mindepth 1 -maxdepth 1 -type d | fzf)
if [[ -z $selected ]]; then
    exit 0
fi
echo $selected
cd $selected 
