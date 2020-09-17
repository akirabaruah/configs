function emacs --wraps='emacs -nw' --description 'alias emacs env TERM=xterm-24bit emacs -nw'
    env TERM=xterm-24bit emacs -nw $argv
end
