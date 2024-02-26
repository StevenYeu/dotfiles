
if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(tmux ls | fzf)
fi


if [[ -z $selected ]]; then
   return 
fi

selected_session=$(echo $selected | awk -F ":" '{print $1}')
tmux switch-client -t $selected_session    
