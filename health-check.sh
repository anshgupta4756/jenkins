#!/usr/bin/env bash

set -euo pipefail

echo "Starting System Health Check"

PYTHON_COMMAND=""

if command -v python3 >/dev/null 2>&1; then
    PYTHON_COMMAND="python3"
elif command -v python >/dev/null 2>&1; then
    PYTHON_COMMAND="python"
else
    echo "Error: Python is not installed or is not available in PATH." >&2
    exit 1
fi

echo "Python is installed."
"$PYTHON_COMMAND" --version

echo "Health Check Successful"
