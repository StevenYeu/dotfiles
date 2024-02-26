selected=$(find ~/Projects -mindepth 1 -maxdepth 1 -type d | fzf)
if [[ -z $selected ]]; then
   return 
fi
echo $selected
cd $selected 
