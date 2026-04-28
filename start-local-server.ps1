param(
  [int]$Port = 8080
)

$projectRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $projectRoot

if (Get-Command py -ErrorAction SilentlyContinue) {
  py -m http.server $Port
  exit $LASTEXITCODE
}

if (Get-Command python -ErrorAction SilentlyContinue) {
  python -m http.server $Port
  exit $LASTEXITCODE
}

Write-Error "Python ya py launcher install nahi mila. Kisi bhi static server se folder serve kar lo."
