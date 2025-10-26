#!/bin/sh

set -eu

# Function to print a formatted header
print_header() {
  echo
  echo "-------------------------------------------------"
  echo "$1"
  echo "-------------------------------------------------"
}

# Step 1: Update system and install packages from official repositories
install_packages() {
  print_header "Updating system and installing pacman packages"
  sudo pacman -Syu --noconfirm
  sudo pacman -S --noconfirm --needed \
    base-devel \
    docker \
    firefox \
    fish \
    flatpak \
    fzf \
    git \
    gwenview \
    keepassxc \
    kitty \
    lazygit \
    less \
    man-db \
    mise \
    neovim \
    okular \
    otf-font-awesome \
    oxygen \
    ripgrep \
    stow \
    ttf-jetbrains-mono-nerd \
    unrar \
    unzip \
    vlc \
    xsel
}

# Step 2: Install yay AUR helper
install_yay() {
  print_header "Installing yay AUR Helper"
  if ! command -v yay &> /dev/null; then
    echo "yay could not be found, installing..."
    # Use a temporary directory for the build
    TMP_DIR=$(mktemp -d)
    git clone https://aur.archlinux.org/yay-bin.git "$TMP_DIR"
    (cd "$TMP_DIR" && makepkg -si --noconfirm)
    # Clean up the temporary directory
    rm -rf "$TMP_DIR"
  else
    echo "yay is already installed."
  fi
}

# Step 3: Set up Flatpak
setup_flatpak() {
  print_header "Setting up Flatpak"
  sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
}

# Step 4: Clone and set up dotfiles
setup_dotfiles() {
  print_header "Cloning and setting up dotfiles"
  git clone "https://github.com/nxvxl/dotfiles.git" "$HOME/.dotfiles"

  # Change to dotfiles directory to run stow
  cd "$HOME/.dotfiles"

  stow --adopt -t "$HOME" kde kitty nvim fish
  git restore .
}

# Step 5: Configure user environment
configure_user() {
  print_header "Configuring user environment"
  echo "Setting default shell to fish..."
  sudo usermod -s /bin/fish "$(whoami)"
  echo "Adding user to docker group..."
  sudo usermod -aG docker "$(whoami)"
}

# Main execution flow
main() {
  install_packages
  install_yay
  setup_flatpak
  setup_dotfiles
  configure_user

  print_header "Setup complete!"
  echo "Please log out and log back in for all changes to take effect."
}

# Run the main function
main
