# PostToolUse hook: format a Dart file right after Claude edits it.
# Reads the hook JSON payload from stdin, pulls out the edited path, and runs
# `dart format` on it when it is a .dart file inside this project.
# Never blocks the tool call: any failure exits 0 silently.
$ErrorActionPreference = 'SilentlyContinue'
try {
    $raw = [Console]::In.ReadToEnd()
    if ([string]::IsNullOrWhiteSpace($raw)) { exit 0 }
    $payload = $raw | ConvertFrom-Json
    $path = $payload.tool_input.file_path
    if ([string]::IsNullOrWhiteSpace($path)) { exit 0 }
    if ($path -notmatch '\.dart$') { exit 0 }
    if (-not (Test-Path -LiteralPath $path)) { exit 0 }
    # Generated files are never hand-formatted.
    if ($path -match '\.(g|freezed|config|gr)\.dart$') { exit 0 }
    if ($path -match 'strings\.g\.dart$') { exit 0 }
    & dart format --output=write $path | Out-Null
} catch { }
exit 0
