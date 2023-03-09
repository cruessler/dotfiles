stow:
	# this will respect `.stow-local-ignore`
	stow -t $(HOME) .

bootstrap_rust:
	# https://rustup.rs/
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

bootstrap_tmux:
	git clone https://github.com/tmux-plugins/tpm $(HOME)/.tmux/plugins/tpm

bootstrap_fish:
	mkdir -p $(HOME)/.config/fish/functions

bootstrap_nvim:
	curl --create-dirs -o $(HOME)/.vim/colors/molokai.vim https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
