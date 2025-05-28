#!/bin/bash
set -e

# Install Solana CLI
echo "🔄 Installing Solana CLI..."
sh -c "$(curl -sSfL https://release.solana.com/v1.18.0/install)"
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"
echo 'export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"' >> ~/.bashrc

# Ensure latest Rust
rustup update stable
rustup default stable

# Install Anchor
echo "⚓ Installing Anchor..."
cargo install --git https://github.com/coral-xyz/anchor anchor-cli --locked --force

# Verify
echo -e "\n✅ Installation Complete:"
solana --version
anchor --version
rustc --version
node --version
