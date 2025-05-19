set fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
    if type starship &> /dev/null
        starship init fish | source
    end

    # register-python-argcomplete requires asdf existing in $PATH already
    # but that's only loaded via the asdf plugin of oh-my-fish
    set -q ARGCOMPLETE_LIST
        or set -gx ARGCOMPLETE_LIST ~/.config/argcomplete.list
    
    if not test -f $ARGCOMPLETE_LIST
        echo "initialising $ARGCOMPLETE_LIST"
        for file in $PATH/*
            if begin file -bLI $file | head -n 1 | grep -q "text/x-script.python"
                and head -n 3 $file 2>/dev/null | fgrep -q ARGCOMPLETE
            end
                echo (basename $file) >&2
                basename $file
            end
        end > ~/.config/argcomplete.list
    end

    if begin test -f $ARGCOMPLETE_LIST; and type -q register-python-argcomplete; end
        while read -la script
            register-python-argcomplete -s fish $script | source
        end < $ARGCOMPLETE_LIST
    end

    export PYTHONPATH=.
end
