#!/usr/bin/env bash
set -euo pipefail

# === HELP FUNCTION ===
usage() {
    cat << EOF
Usage: $0 [options]

Options:
  -p, --path DIR         Path to initialize the Git repository (default: /opt/myrepo)
  -b, --branch BRANCH    Branch to initialize (default: main)
  -r, --remote NAME=URL  Add a remote (can be specified multiple times)
  -h, --help             Show this help message and exit

Examples:
  # Initialize default repo at /opt/myrepo with main branch
  $0

  # Initialize repo at custom path with custom branch
  $0 -p /srv/myapp -b develop

  # Initialize repo and add remotes
  $0 -p /srv/myapp -b main -r origin=https://github.com/example/repo.git -r upstream=git@github.com:upstream/repo.git
EOF
}

# === DEFAULTS ===
REPO_PATH="~/devel/U-Boot"
BRANCH="main"
REMOTES=(
  "u-boot-mainline=https://github.com/u-boot/u-boot.git"
  "u-boot-xlnx=https://github.com/Xilinx/u-boot-xlnx.git"
  "uboot-imx=https://github.com/nxp-imx/uboot-imx.git"
  )

# === PARSE ARGUMENTS ===
while [[ $# -gt 0 ]]; do
    case "$1" in
        -p|--path)
            REPO_PATH="$2"
            shift 2
            ;;
        -b|--branch)
            BRANCH="$2"
            shift 2
            ;;
        -r|--remote)
            REMOTES+=("$2")
            shift 2
            ;;
        -h|--help)
            usage
            exit 0
            ;;
        *)
            echo "[ERROR] Unknown option: $1"
            usage
            exit 1
            ;;
    esac
done

# === SCRIPT ===
echo "[INFO] Ensuring repository directory exists: $REPO_PATH"
mkdir -p "$REPO_PATH"

cd "$REPO_PATH"

if [ ! -d ".git" ]; then
    echo "[INFO] Initializing new git repository with branch '$BRANCH'"
    git init -b "$BRANCH"
else
    echo "[INFO] Git repository already initialized"
fi

for remote in "${REMOTES[@]}"; do
    NAME="${remote%%=*}"
    URL="${remote#*=}"

    if git remote | grep -q "^$NAME$"; then
        echo "[INFO] Remote '$NAME' already exists, skipping"
    else
        echo "[INFO] Adding remote '$NAME' -> $URL"
        git remote add "$NAME" "$URL"
    fi
done

echo "[INFO] Fetching from all remotes"
git fetch --all
echo "[INFO] Done!"

