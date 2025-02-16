set fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

if test -d /opt/pkissh
  fish_add_path --global --move --path /opt/pkissh/bin
end

if type asdf
  asdf completion fish | source
end

export PYTHONPATH=.
