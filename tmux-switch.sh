
if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(tmux ls | fzf)
fi


if [[ -z $selected ]]; then
    exit 0
fi

selected_session=$(echo $selected | awk -F ":" '{print $1}')
tmux switch-client -t $selected_session    
