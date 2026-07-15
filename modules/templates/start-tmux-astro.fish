#! /usr/bin/env fish

# Project Variables
set SESSION_NAME booktax-website
set PROJECT_DIR ~/code/booktax-website

# Check if session is running
if not tmux has-session -t $SESSION_NAME 2>/dev/null
    # Create the session, start it detached (-d), name the first window "editor", and set the directory (-c)
    tmux new-session -d -s $SESSION_NAME -n editor -c $PROJECT_DIR

    # Open our editor in the first window
    tmux send-keys -t $SESSION_NAME:editor "nvim ." C-m

    # Create a second window named "engine" for server and terminal
    tmux new-window -t $SESSION_NAME -n engine -c $PROJECT_DIR

    # Start the Astro dev server in the left pane
    tmux send-keys -t $SESSION_NAME:engine "npm run dev" C-m

    # Split the "engine" window to create a right pane for Git/CLI
    tmux split-window -h -t $SESSION_NAME:engine -c $PROJECT_DIR

    # Focus back on the editor window
    tmux select-window -t $SESSION_NAME:editor
end

# Attach to the session
tmux attach -t $SESSION_NAME
