while true; do
  read -p "> " line
  if [[ -z $line ]]; then
    break
  fi
  num_panes=$(tmux display -p "#{window_panes}")
  this_pane=$(tmux display -p "#{pane_index}")
  for pane in $(seq 0 $((num_panes-1))); do
    if [[ $pane -ne $this_pane ]]; then
      tmux send-keys -t .$pane "$line" c-m 2> /dev/null
    fi
  done
done
