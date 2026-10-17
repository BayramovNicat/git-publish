#!/usr/bin/env bash
#
# Installer for git-publish
#

set -e

INSTALL_DIR="${HOME}/.local/bin"
SCRIPT_SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/git-publish"

echo "Installing git-publish to ${INSTALL_DIR}..."

mkdir -p "${INSTALL_DIR}"
chmod +x "${SCRIPT_SRC}"
cp -f "${SCRIPT_SRC}" "${INSTALL_DIR}/git-publish"

echo "✔ Successfully installed git-publish to ${INSTALL_DIR}/git-publish"

# Check if ~/.local/bin is in PATH
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
  echo ""
  echo "⚠️  Note: ${INSTALL_DIR} is not currently in your PATH."
  echo "   Add this line to your ~/.zshrc or ~/.bash_profile:"
  echo "   export PATH=\"\$HOME/.local/bin:\$PATH\""
else
  echo "✔ ${INSTALL_DIR} is already in your PATH!"
fi

echo ""
echo "🎉 You can now run:"
echo "   git publish [repo-name] [options]"
echo "   or"
echo "   git-publish [repo-name] [options]"
