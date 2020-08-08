# the Debian package has the executable as `batcat`
#
# mkdir -p ~/.local/bin
# ln -s /usr/bin/batcat ~/.local/bin/bat
#
# https://github.com/sharkdp/bat#on-ubuntu-using-apt
if type -q batcat; and test ! -e $HOME/.local/bin/bat
  ln -s /usr/bin/batcat $HOME/.local/bin/bat
end

if type -q bat
  function cat --wraps=bat --description 'alias cat=bat'
    bat $argv;
  end
end
