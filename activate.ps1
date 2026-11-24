# Dot-source this script to activate the shared environment in the current shell:
#   . "$HOME\work\venv-global\activate.ps1"

$venvPath = Join-Path $PSScriptRoot ".venv"
$activateScript = Join-Path $venvPath "Scripts\Activate.ps1"
$pythonPath = Join-Path $venvPath "Scripts\python.exe"

if (-not (Test-Path -LiteralPath $activateScript)) {
    throw "Shared environment not found. Run 'uv sync' in '$PSScriptRoot' first."
}

. $activateScript
$env:QUARTO_PYTHON = $pythonPath
Write-Host "Activated shared Python environment: $venvPath"
