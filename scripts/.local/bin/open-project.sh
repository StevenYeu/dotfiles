selected=$(find ~/Projects ~/Work ~/Repos -mindepth 1 -maxdepth 1 -type d | fzf)
if [[ -z $selected ]]; then
   return 
fi
cd $selected 

