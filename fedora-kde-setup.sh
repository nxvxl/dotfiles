#!/bin/sh
set -eu

# --- Functions ---

# Function to print a header for each section
heading() {
  echo
  echo "--------------------------------------------------"
  echo "$1"
  echo "--------------------------------------------------"
}

# Install system packages from DNF, RPM Fusion, and Copr
install_packages() {
  heading "Updating system and enabling repositories"
  sudo dnf upgrade -y

  heading "Enabling RPM Fusion and third-party repositories"
  sudo dnf install -y \
    "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" \
    "https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm" \
    fedora-workstation-repositories \
    dnf-plugins-core

  heading "Enabling external repositories (Copr, Docker)"
  sudo dnf copr enable -y jdxcode/mise
  sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

  heading "Installing packages"
  sudo dnf install -y \
    containerd.io \
    docker-buildx-plugin \
    docker-ce \
    docker-ce-cli \
    docker-compose-plugin \
    fish \
    flatpak \
    fzf \
    git \
    google-chrome-stable \
    kitty \
    mise \
    neovim \
    plasma-oxygen \
    ripgrep \
    stow \
    unzip
}

# Setup Flatpak and Flathub
setup_flatpak() {
  heading "Setting up Flathub"
  echo "Adding the Flathub remote repository (unfiltered)..."
  sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
}

# Install JetBrains Mono Nerd Font
install_fonts() {
  heading "Installing JetBrains Mono Nerd Font"
  local font_zip="JetBrainsMono.zip"
  local font_url="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip"
  local font_dir="$HOME/.local/share/fonts"

  echo "Downloading JetBrains Mono Nerd Font..."
  curl --progress-bar -L "$font_url" -o "$TMP_DIR/$font_zip"
  
  mkdir -p "$font_dir"
  unzip -o "$TMP_DIR/$font_zip" -d "$font_dir"
  
  echo "Updating font cache..."
  fc-cache -fv
}

# Install KWin scripts
install_kwin_scripts() {
  heading "Installing KWin scripts (Krohnkite and Geometry Change)"

  # Krohnkite
  local krohnkite_script="krohnkite.kwinscript"
  local krohnkite_url="https://github.com/anametologin/krohnkite/releases/download/0.9.9.2/krohnkite.kwinscript"
  echo "Downloading Krohnkite..."
  curl --progress-bar -L "$krohnkite_url" -o "$TMP_DIR/$krohnkite_script"
  kpackagetool6 -t KWin/Script -i "$TMP_DIR/$krohnkite_script" --upgrade

  # Geometry Change Effect
  local geo_change_archive="kwin4_effect_geometry_change_1_5.tar.gz"
  local geo_change_url="https://github.com/peterfajdiga/kwin4_effect_geometry_change/releases/download/v1.5/$geo_change_archive"
  local effects_dir="$HOME/.local/share/kwin/effects/"
  echo "Downloading Geometry Change Effect..."
  curl --progress-bar -L "$geo_change_url" -o "$TMP_DIR/$geo_change_archive"
  mkdir -p "$effects_dir"
  tar -xvzf "$TMP_DIR/$geo_change_archive" -C "$effects_dir"
}

# Setup dotfiles and user environment
setup_environment() {
  heading "Setting up dotfiles"
  if [ -d "$HOME/.dotfiles" ]; then
    echo "Dotfiles directory already exists. Skipping clone."
  else
    echo "Cloning dotfiles..."
    
    printf "Choose a method to clone the dotfiles repository:\n"
    printf "  1) HTTPS (recommended)\n"
    printf "  2) SSH (requires SSH key setup with GitHub)\n"
    printf "Enter your choice [1]: "
    read -r choice

    case "$choice" in
      2)
        echo "Using SSH to clone."
        git_url="git@github.com:nxvxl/dotfiles.git"
        ;;
      *)
        echo "Using HTTPS to clone."
        git_url="https://github.com/nxvxl/dotfiles.git"
        ;;
    esac

    git clone "$git_url" "$HOME/.dotfiles"
  fi
  
  heading "Stowing configuration files"
  echo "Replacing any existing configs with symlinks from the repository..."
  cd "$HOME/.dotfiles"
  # Use --adopt to handle pre-existing configs, then restore the repo to its original state.
  stow --adopt -t "$HOME" kde kitty neovim fish
  git restore .

  heading "Configuring user environment"
  echo "Adding user to the 'docker' group..."
  sudo usermod -aG docker "$(whoami)"
  
  echo "Changing default shell to fish..."
  sudo usermod -s /bin/fish "$(whoami)"
}


# --- Main Script ---

# Create a temporary directory and schedule it for removal on exit
TMP_DIR=$(mktemp -d)
trap 'rm -rf -- "$TMP_DIR"' EXIT

install_packages
setup_flatpak
install_fonts
install_kwin_scripts
setup_environment

heading "Setup Complete!"
echo "Please log out and log back in for all changes to take effect."
echo "(Specifically for Docker permissions and the new default shell)."
