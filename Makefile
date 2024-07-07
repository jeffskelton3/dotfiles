SHELL := /bin/sh

DOTFILES_SCRIPT := ./symlink_dotfiles.sh

.PHONY: all
all: symlink

.PHONY: symlink
symlink:
	@echo "Creating symlinks for dotfiles..."
	@chmod +x $(DOTFILES_SCRIPT)
	@$(DOTFILES_SCRIPT)
	@echo "Symlink creation complete."
