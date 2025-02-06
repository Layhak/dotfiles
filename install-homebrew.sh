#!/bin/bash

# Exit on error
set -e

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Updating Homebrew..."
    brew update
fi

# Install formulae
echo "Installing formulae..."
FORMULAE=(
    ansible aom apr apr-util argon2 autoconf bat blueutil brotli c-ares ca-certificates
    cairo capstone certifi cffi colima composer cryptography curl dtc eza fd fontconfig
    freetds freetype fzf gd gettext gh giflib git glib gmp gnu-getopt gnupg gnutls
    graphite2 harfbuzz highway hugo icu4c@76 imath javacc jpeg-turbo jpeg-xl jq krb5
    lazygit libassuan libavif libdeflate libevent libgcrypt libgit2 libgpg-error
    libidn2 libksba libnghttp2 libpng libpq libslirp libsodium libssh libssh2 libtasn1
    libtiff libtool libunistring libusb libuv libvmaf libvterm libx11 libxau libxcb
    libxdmcp libxext libxrender libyaml libzip lima little-cms2 lpeg lua luajit luarocks
    luv lz4 lzo m4 mpdecimal msgpack ncurses neovim net-snmp nettle node nowplaying-cli
    npth oniguruma openexr openjdk openjdk@17 openldap openssl@3 p11-kit pass pcre2 php
    pinentry pixman pkgconf pycparser pyenv python-packaging python@3.13 qemu
    qrencode readline ripgrep rtmpdump sketchybar snappy sqlite stow switchaudio-osx
    tidy-html5 tldr tmux tree tree-sitter unbound unibilium unixodbc utf8proc vde webp
    xorgproto xz zoxide zsh-autosuggestions zsh-syntax-highlighting zsh-vi-mode zstd
)

for formula in "${FORMULAE[@]}"; do
    echo "Installing $formula..."
    brew install "$formula" || echo "Failed to install $formula"
done

# Install casks
echo "Installing casks..."
CASKS=(
    aerospace docker font-fira-code-nerd-font font-hack-nerd-font
    font-jetbrains-mono-nerd-font font-meslo-lg font-meslo-lg-nerd-font
    font-sf-pro ghostty git-credential-manager hashicorp-vagrant herd
    karabiner-elements postman rectangle sf-symbols utm
)

for cask in "${CASKS[@]}"; do
    echo "Installing $cask..."
    brew install --cask "$cask" || echo "Failed to install $cask"
done

echo "Installation complete!"
