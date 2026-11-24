#!/usr/bin/env bash

# Source this file to activate the shared environment in the current shell.
if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
    printf 'Source this script in Bash: source "%s"\n' "$0" >&2
    exit 1
fi

_globalvenv_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)" || return
_globalvenv_activate="$_globalvenv_root/.venv/bin/activate"
_globalvenv_python="$_globalvenv_root/.venv/bin/python"

if [[ ! -f "$_globalvenv_activate" || ! -x "$_globalvenv_python" ]]; then
    printf "Shared environment not found. Run 'uv sync' in '%s' first.\n" "$_globalvenv_root" >&2
    unset _globalvenv_root _globalvenv_activate _globalvenv_python
    return 1
fi

source "$_globalvenv_activate"
export QUARTO_PYTHON="$_globalvenv_python"
printf 'Activated shared Python environment: %s/.venv\n' "$_globalvenv_root"

unset _globalvenv_root _globalvenv_activate _globalvenv_python
