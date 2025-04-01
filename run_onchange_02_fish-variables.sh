#!/usr/bin/env fish

fish_add_path --move ~/.asdf/shims
fish_add_path --move ~/bin

# weird custom ssh for work
if test -d /opt/pkissh
  fish_add_path --move /opt/pkissh/bin
end

if type docker &> /dev/null
  test -f ~/.config/fish/completions/docker.fish || docker completion fish > ~/.config/fish/completions/docker.fish
end
