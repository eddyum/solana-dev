#!/bin/bash
set -e

# Install Solana CLI if not installed
if ! command -v solana &> /dev/null; then
    echo "🔄 Installing Solana CLI..."
    sh -c "$(curl -sSfL https://release.solana.com/v1.18.0/install)"
    SOLANA_PATH="$HOME/.local/share/solana/install/active_release/bin"
    export PATH="$SOLANA_PATH:$PATH"
    echo "export PATH=\"$SOLANA_PATH:\$PATH\"" >> ~/.bashrc
else
    echo "✅ Solana CLI already installed"
fi

# Update Rust
rustup update stable
rustup default stable

# Install Anchor if not installed
if ! command -v anchor &> /dev/null; then
    echo "⚓ Installing Anchor..."
    cargo install --git https://github.com/coral-xyz/anchor anchor-cli --locked --force
else
    echo "✅ Anchor already installed"
fi

# Verify installations
echo -e "\n✅ Environment:"
solana --version
anchor --version
rustc --version
node --version