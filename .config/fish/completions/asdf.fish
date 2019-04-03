# https://asdf-vm.github.io/asdf/#/core-manage-asdf-vm?id=add-to-your-shell
set completions $HOME/.asdf/completions/asdf.fish

if test -f $completions
  source $completions
end
