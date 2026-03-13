param(
    [switch]$NoClean
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# -----------------------------------------------------------------------------
# Logging
# -----------------------------------------------------------------------------

function Write-Info([string]$Message) { Write-Host $Message -ForegroundColor Cyan }
function Write-Ok([string]$Message) { Write-Host $Message -ForegroundColor Green }
function Write-Fail([string]$Message) { Write-Host $Message -ForegroundColor Red }

# -----------------------------------------------------------------------------
# Utilities
# -----------------------------------------------------------------------------

function Add-ToPathIfExists([string]$Dir) {
    if ([string]::IsNullOrWhiteSpace($Dir)) { return }
    if (Test-Path -LiteralPath $Dir) {
        $parts = $env:PATH -split ';'
        if (-not ($parts | Where-Object { $_ -eq $Dir })) {
            $env:PATH = $Dir + ";" + $env:PATH
        }
    }
}

function Assert-Command([string]$Name) {
    if (-not (Get-Command $Name -ErrorAction SilentlyContinue)) {
        throw "Required tool not found on PATH: $Name"
    }
}

function Resolve-ExistingPath([string]$Path, [string]$What) {
    if (-not (Test-Path -LiteralPath $Path)) {
        throw "Missing $What at: $Path"
    }
    return (Resolve-Path -LiteralPath $Path).Path
}

function New-Directory([string]$Path) {
    New-Item -ItemType Directory -Force -Path $Path 2>$null | Out-Null
}

function Invoke-OrStop {
    param(
        [Parameter(Mandatory = $true)][scriptblock]$Action,
        [Parameter(Mandatory = $true)][string]$FailMessage
    )

    $result = & $Action
    if (-not $result) {
        Write-Fail $FailMessage
        exit 1
    }
}

# -----------------------------------------------------------------------------
# Build
# -----------------------------------------------------------------------------

function Build-Paper {
    param(
        [Parameter(Mandatory = $true)][string]$PaperDir,
        [Parameter(Mandatory = $true)][string]$TexFile,
        [Parameter(Mandatory = $true)][string]$Name,
        [Parameter(Mandatory = $true)][string]$RepoRoot
    )

    Write-Ok ""
    Write-Ok "Building $Name..."

    Push-Location $PaperDir
    try {
        $texPath = Join-Path (Get-Location) $TexFile
        if (-not (Test-Path -LiteralPath $texPath)) {
            Write-Fail "TeX file not found: $texPath"
            return $false
        }

        New-Directory "build"

        $latexmkCmd = Get-Command latexmk -ErrorAction Stop
        Write-Info ("Using latexmk: {0}" -f $latexmkCmd.Source)

        & $latexmkCmd.Source `
            -pdf `
            -bibtex `
            -interaction=nonstopmode `
            -halt-on-error `
            -auxdir=build `
            -outdir=build `
            $TexFile

        $exitCode = [int]$LASTEXITCODE
        if ($exitCode -ne 0) {
            Write-Fail ("FAILED: {0} (latexmk exit code {1})" -f $Name, $exitCode)
            return $false
        }

        $texBaseName = [System.IO.Path]::GetFileNameWithoutExtension($TexFile)
        $pdfPath = Join-Path (Join-Path (Get-Location) "build") ("{0}.pdf" -f $texBaseName)

        if (-not (Test-Path -LiteralPath $pdfPath)) {
            Write-Fail ("FAILED: {0} - expected PDF not found: {1}" -f $Name, $pdfPath)
            return $false
        }

        Copy-Item -LiteralPath $pdfPath -Destination (Join-Path $RepoRoot ("{0}.pdf" -f $texBaseName)) -Force

        Write-Ok "OK: $Name"
        return $true
    }
    catch {
        Write-Fail "FAILED: $Name (exception)"
        Write-Fail $_.Exception.Message
        return $false
    }
    finally {
        Pop-Location
    }
}

# -----------------------------------------------------------------------------
# Preflight: PATH + required tools
# -----------------------------------------------------------------------------

Add-ToPathIfExists (Join-Path $env:LOCALAPPDATA "Programs\MiKTeX\miktex\bin\x64")
Add-ToPathIfExists "C:\Program Files\MiKTeX\miktex\bin\x64"
Add-ToPathIfExists "C:\Program Files\MiKTeX\miktex\bin"

Assert-Command "latexmk"

# -----------------------------------------------------------------------------
# Preflight: required repo layout
# -----------------------------------------------------------------------------

$RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot "..\..")).Path
$PaperDir = $RepoRoot
$PaperTex = "se100_the_ontological_neutrality_theorem.tex"
$null = Resolve-ExistingPath (Join-Path $PaperDir $PaperTex) "paper TeX file"

# -----------------------------------------------------------------------------
# Cleanup (optional)
# -----------------------------------------------------------------------------

if (-not $NoClean) {
    Write-Info "Cleaning build artifacts..."
    Get-ChildItem -Path $RepoRoot -Recurse -Include *.aux, *.bbl, *.blg, *.fdb_latexmk, *.fls, *.log, *.synctex.gz -ErrorAction SilentlyContinue |
        Remove-Item -Force -ErrorAction SilentlyContinue
}

# -----------------------------------------------------------------------------
# Build Standard (fail-fast)
# -----------------------------------------------------------------------------

Invoke-OrStop { Build-Paper -PaperDir $PaperDir -TexFile $PaperTex -Name "Paper 00: Neutral Ontology" -RepoRoot $RepoRoot } `
    "Stopping: Paper 00 standard build failed."

Write-Ok ""
Write-Ok "ALL BUILDS SUCCEEDED."
exit 0
