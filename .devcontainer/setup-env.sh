#!/bin/bash
# ----------------------------------------------------------------------
# setup-env.sh
#
# DESCRIPTION:
#   Initializes the lab environment, configures permissions, and 
#   tethers the local repository to the system shell (~/.bashrc).
#
# USAGE:
#   ./.devcontainer/setup-env.sh
# ----------------------------------------------------------------------

# 1. Define the absolute path to this repository
REPO_DIR=$(pwd)

echo "--- 🛠️  Initializing Lab Environment ---"

# 2. Portable .bashrc Tethering
# This block is injected into the user's ~/.bashrc.
# It uses a guard clause to ensure it only runs if the directory exists.
TETHER_BLOCK=$(cat <<EOF
# --- Lab Environment Setup (Added $(date +'%Y-%m-%d')) ---
if [ -d "$REPO_DIR" ]; then
    export REPO_ROOT="$REPO_DIR"
    export PATH="\$PATH:\$REPO_ROOT/bin"
    # Source the repo-specific .bashrc for aliases and custom prompts
    [ -f "\$REPO_ROOT/.bashrc" ] && source "\$REPO_ROOT/.bashrc"
fi
# -------------------------------------------------------
EOF
)

# Only append if the REPO_ROOT for this specific directory isn't already set
if ! grep -q "REPO_ROOT=\"$REPO_DIR\"" ~/.bashrc; then
    echo "$TETHER_BLOCK" >> ~/.bashrc
    echo "✅ Success: Environment tethered to ~/.bashrc"
else
    echo "ℹ️  System: ~/.bashrc already tethered for this directory."
fi

# 3. Global Command Setup (Symlinking)
# This allows students to type 'repo.sh' from any directory.
if [ -f "$REPO_DIR/bin/repo.sh" ]; then
    sudo ln -sf "$REPO_DIR/bin/repo.sh" /usr/local/bin/repo.sh
    echo "✅ Success: 'repo.sh' linked to /usr/local/bin"
else
    echo "⚠️  Warning: bin/repo.sh not found. Global command link skipped."
fi

# 4. Permission Synchronization
# Sets execution bits for the student (user) and the vscode group.
echo "🔧 Syncing permissions..."
if [ -d "$REPO_DIR/bin" ]; then
    chmod ug+x "$REPO_DIR/bin/"*.sh
    echo "✅ Success: bin/*.sh marked as executable."
fi

# Ensure the lib directory is readable but not executable (Standard Security)
if [ -d "$REPO_DIR/lib" ]; then
    chmod ug-x "$REPO_DIR/lib/"*.sh 2>/dev/null
    echo "✅ Success: lib/ permissions hardened."
fi

echo "--- ✅ Environment Initialization Complete ---"
