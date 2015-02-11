#####################
# tmux window title #
#####################
case "$TERM" in
    screen*)
        PROMPT_COMMAND="printf '\033k$(hostname -s)\033\\';"${PROMPT_COMMAND}
        ;;
esac

###
# Silliness
###
alias motd="cat /etc/motd"
