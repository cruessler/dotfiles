stow:
	# this will respect `.stow-local-ignore`
	stow -t $(HOME) .

bootstrap_tmux:
	git clone https://github.com/tmux-plugins/tpm $(HOME)/.tmux/plugins/tpm
