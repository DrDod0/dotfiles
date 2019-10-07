#!/bin/bash


# naming the session
session_name="my_motherfucking_session"

# 'tmux has-session' test for existing session, in this case, "my_motherfucking_session"
# '$> /dev/null' send error msg with /dev/null, so they don't show in the command line.
tmux has-session -t $session_name &> /dev/null

# if '$?' exit status of last task IS NOT 0 then createa new session (session_name)

if [ $? != 0 ]
then
    tmux new-session -s $session_name -n script -d tmux send-key -t $session_name "$HOME/dotfiles/tmux/my_session.sh" C-m
fi

# session_name found attaching
tmux attach -t $session_name

