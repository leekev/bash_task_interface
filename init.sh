# Installing Bash preexec.
curl https://raw.githubusercontent.com/rcaloras/bash-preexec/master/bash-preexec.sh -o ~/.bash-preexec.sh
source ~/.bash-preexec.sh
preexec() {
    echo "pre-exec"
}
# This function is where we need to verify the output of the command.
# Right now, the task passes if you create a file called "pass".
precmd() {
    TASK_NUM=${PWD##*/}

    if [[ $TASK_NUM == task_* ]]; then
        if [[ -e pass ]]; then
            echo "$TASK_NUM passed!"
        else
            echo "$TASK_NUM not passed."
            echo "TODO: print diff"
        fi
    fi
}

reset
