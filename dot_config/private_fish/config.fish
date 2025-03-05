set fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
    if type starship > /dev/null
        starship init fish | source
    end


    export PYTHONPATH=.
end

