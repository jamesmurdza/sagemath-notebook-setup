#!/usr/bin/env bash
# One-time setup: installs SageMath + Jupyter Notebook (Debian/Ubuntu apt-based systems).
set -euo pipefail

echo "==> Updating apt and installing SageMath + Jupyter..."
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
  sagemath sagemath-jupyter jupyter-notebook

echo "==> Cleaning up apt cache to save disk space..."
sudo apt-get clean

echo "==> Verifying install..."
sage --version
jupyter --version

echo "==> Done. Run ./start-notebook.sh to launch the notebook server."
