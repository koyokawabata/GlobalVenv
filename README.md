# venv-global

個人用の共有 Python 環境です。軽い実験や、ソースを OneDrive に置く執筆・Quarto 作業で使います。

通常の開発プロジェクトでは、それぞれのプロジェクト内で `uv` による専用環境を使ってください。この環境を使うのは、独立した依存管理が不要な作業に限ります。

この作業フォルダは OneDrive の外にあり、環境は `.venv` に作られます。`pyproject.toml` と `uv.lock` が依存関係の基準です。環境への追加・削除はこのフォルダで `uv add` / `uv remove` を使って行い、手動の `pip install` は避けてください。`uv sync` はマニフェストにないパッケージを環境から削除します。

## 初回セットアップ・更新

```powershell
Set-Location "$HOME\work\venv-global"
uv sync
```

## PowerShell で有効化

どの作業フォルダからでも、次を実行します。

```powershell
. "$HOME\work\venv-global\activate.ps1"
```

有効化すると `python` が共有環境を指し、`QUARTO_PYTHON` にも同じ Python が設定されます。その PowerShell セッションから実験スクリプトや `quarto render` を実行できます。終了時は `deactivate` を実行します。

Quarto CLI 自体は Python パッケージではないため、別途インストールが必要です。この環境には Quarto の Python/Jupyter 実行に使う `jupyter` を含めています。

有効化せずに Python スクリプトを一度だけ実行する場合:

```powershell
uv run --project "$HOME\work\venv-global" -- python .\experiment.py
```
