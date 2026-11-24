# GlobalVenv

A shared Python environment for lightweight experiments and writing workflows, including Quarto projects whose source files live in OneDrive.

Use a dedicated `uv` environment for each regular development project. This shared environment is intended for work that does not need its own dependency set.

This working directory is outside OneDrive, and the environment lives in `.venv`. `pyproject.toml` and `uv.lock` are the source of truth for dependencies. Add or remove packages from this directory with `uv add` or `uv remove`; avoid installing packages with `pip` directly. `uv sync` removes packages that are not declared in the project.

## Initial setup and updates

```powershell
Set-Location "$HOME\work\GlobalVenv"
uv sync
```

## Activate in PowerShell

From any working directory, run:

```powershell
. "$HOME\work\GlobalVenv\activate.ps1"
```

The `python` command will then use the shared environment, and `QUARTO_PYTHON` will point to the same interpreter. Run experiment scripts or `quarto render` in that PowerShell session. Run `deactivate` when you are finished.

The Quarto CLI is installed separately; it is not a Python package. This environment includes `jupyter` for Quarto's Python/Jupyter execution.

To run a Python script once without activating the environment:

```powershell
uv run --project "$HOME\work\GlobalVenv" -- python .\experiment.py
```
