if [ -d $HOME/.cask/bin ]; then
    export PATH="$HOME/.cask/bin:$PATH"
fi

if [ ! -z $TERM ]; then
    export TERM="xterm-256color"
fi

if [ ! -z $ALTERNATE_EDITOR ]; then
    export ALTERNATE_EDITOR=""
fi
