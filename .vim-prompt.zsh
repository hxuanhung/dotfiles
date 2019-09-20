function zle-keymap-select zle-line-init
{
    # change cursor shape in iTerm2
    case $KEYMAP in
        vicmd)      print -n -- "\e[2 q";;  # block cursor
        viins|main) print -n -- "\e[4 q";;  # line cursor
    esac

    zle reset-prompt
    zle -R
}

function zle-line-finish
{
    print -n -- "\e[2 q"  # block cursor
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select

# Using underscore works for vscode as well. The above function only in iTerm
# "\e[4 q": solid underscore
# "\e[2 q": solid block
# zle-keymap-select () {
#     if [ "$TERM" = "xterm-256color" ]; then
#         if [ $KEYMAP = vicmd ]; then
#             # the command mode for vi
#             echo -ne "\e[2 q"
#         else
#             # the insert mode for vi
#             echo -ne "\e[4 q"
#         fi
#     fi
# }