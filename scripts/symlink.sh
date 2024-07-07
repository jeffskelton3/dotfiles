#!/bin/sh

set -eu
set -o pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
DOTFILES_DIR="$(cd "${SCRIPT_DIR}/.." && git rev-parse --show-toplevel)"

if [ -z "${DOTFILES_DIR}" ]; then
  echo "Error: Not inside a Git repository" >&2
  exit 1
fi

CONFIG_DIR="${HOME}/.config"

mkdir -p "${CONFIG_DIR}"

create_symlink() {
  local source="$1"
  local target="$2"

  if [ ! -e "${source}" ]; then
    echo "Error: Source file does not exist: ${source}" >&2
    return 1
  fi

  if [ -L "${target}" ]; then
    local current_source
    current_source=$(readlink "${target}" || true)
    if [ "${current_source}" = "${source}" ]; then
      echo "Symlink already exists and is correct: ${target} -> ${source}"
    else
      echo "Updating existing symlink: ${target}"
      ln -sf "${source}" "${target}"
      echo "Updated: ${target} -> ${source}"
    fi
  elif [ -e "${target}" ]; then
    echo "Warning: ${target} already exists and is not a symlink. Skipping." >&2
  else
    ln -s "${source}" "${target}"
    echo "Created symlink: ${target} -> ${source}"
  fi
}

remove_symlink() {
  local target="$1"

  if [ -L "${target}" ]; then
    rm "${target}"
    echo "Removed symlink: ${target}"
  elif [ -e "${target}" ]; then
    echo "Warning: ${target} exists but is not a symlink. Skipping." >&2
  else
    echo "${target} does not exist. Nothing to remove."
  fi
}

process_dotfiles() {
  local action="$1"

  if [ "$action" = "create" ]; then
    create_symlink "${DOTFILES_DIR}/nvim" "${CONFIG_DIR}/nvim"
    create_symlink "${DOTFILES_DIR}/bashrc" "${HOME}/.bashrc"
    create_symlink "${DOTFILES_DIR}/tmux.conf" "${HOME}/.tmux.conf"
    create_symlink "${DOTFILES_DIR}/gitconfig" "${HOME}/.gitconfig"
    create_symlink "${DOTFILES_DIR}/.vimrc" "${HOME}/.vimrc"
    # Add more dotfiles as needed
  elif [ "$action" = "remove" ]; then
    remove_symlink "${CONFIG_DIR}/nvim"
    remove_symlink "${HOME}/.bashrc"
    remove_symlink "${HOME}/.tmux.conf"
    remove_symlink "${HOME}/.gitconfig"
    remove_symlink "${HOME}/.vimrc"
    # Add more dotfiles as needed
  else
    echo "Error: Invalid action. Use 'create' or 'remove'." >&2
    exit 1
  fi
}

print_usage() {
  echo "Usage: $0 [create|remove]"
  echo "  create: Create symlinks for dotfiles"
  echo "  remove: Remove symlinks for dotfiles"
}

main() {
  if [ $# -eq 0 ]; then
    print_usage
    exit 1
  fi

  case "$1" in
  create)
    process_dotfiles create
    echo "Symlink creation complete."
    ;;
  remove)
    process_dotfiles remove
    echo "Symlink removal complete."
    ;;
  *)
    print_usage
    exit 1
    ;;
  esac
}

main "$@"
