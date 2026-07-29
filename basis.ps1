# ============================================================
# basis.ps1
# ============================================================
# Extracts the labeled mathematical basis of SE-100 from LaTeX.
#
# Each labeled environment is copied exactly from:
#
#   \begin{definition}[...]
#
# through:
#
#   \end{definition}
#
# The same applies to notes, assumptions, remarks, constraints,
# and examples.
#
# Output:
#
#   se100-lean-basis.md
#
# Run:
#
#   .\basis.ps1
#
# Optional:
#
#   .\basis.ps1 `
#     -TexPath ".\se100-neutral-substrates-v1.tex" `
#     -OutputPath ".\se100-lean-basis.md"
# ============================================================

param(
    [string] $TexPath = ".\se100-neutral-substrates-v1.tex",
    [string] $OutputPath = ".\se100-lean-basis.md"
)

$ErrorActionPreference = "Stop"

# ============================================================
# === EXPECTED PAPER BASIS ===
# ============================================================
# These labels are listed in authoritative paper order.
#
# The script fails if:
#
# - an expected label is missing;
# - an unexpected labeled environment appears;
# - a label is duplicated; or
# - the label order changes.
#
# This prevents an incomplete extraction from being accepted
# silently as the Lean formalization basis.

$ExpectedLabels = @(
    "se100.def.Substrate"
    "se100.def.SubstrateCommitment"
    "se100.note.CausalNormative"
    "se100.def.AttributionProposition"
    "se100.def.ObjectLevelInterpretiveProposition"
    "se100.def.ObjectLevelCausalNormativeCommitment"
    "se100.def.ReferentialRegime"
    "se100.def.ReferentialCommitments"
    "se100.def.AdmissibleFramework"
    "se100.note.FrameworkClass"
    "se100.def.PermittedAttributionProposition"
    "se100.def.FrameworkVariant"
    "se100.def.FrameworkInvariant"
    "se100.def.FrameworkCompatibleCommitmentSet"
    "se100.def.ContestedCausalNormative"
    "se100.assump.Contestability"
    "se100.assump.ReferentialCommonGround"
    "se100.remark.AttributionCommonGround"
    "se100.def.InterpretiveNonCommitment"
    "se100.def.ExtensionStability"
    "se100.assump.SubstrateConsistency"
    "se100.remark.PropertyRelation"
    "se100.def.NeutralityByDesign"
    "se100.constraint.Neutrality"
    "se100.example.ReificationFragment"
)

# ============================================================
# === RESOLVE INPUT AND OUTPUT PATHS ===
# ============================================================

if (-not (Test-Path -LiteralPath $TexPath -PathType Leaf)) {
    throw "LaTeX source file not found: $TexPath"
}

$ResolvedTexPath = (Resolve-Path -LiteralPath $TexPath).Path
$ResolvedOutputPath = [System.IO.Path]::GetFullPath($OutputPath)

$OutputDirectory = Split-Path -Parent $ResolvedOutputPath

if (-not (Test-Path -LiteralPath $OutputDirectory)) {
    New-Item `
        -ItemType Directory `
        -Path $OutputDirectory `
        -Force |
        Out-Null
}

# Read the source as UTF-8 and preserve each source line.
$Lines = [System.IO.File]::ReadAllLines(
    $ResolvedTexPath,
    [System.Text.Encoding]::UTF8
)

# ============================================================
# === TARGET LATEX ENVIRONMENTS ===
# ============================================================

$BeginPattern = (
    '^\s*\\begin\{' +
    '(?<kind>definition|note|assumption|remark|constraint|example)' +
    '\}' +
    '(?:\[(?<title>[^\]]*)\])?' +
    '\s*(?:%.*)?$'
)

$Items = [System.Collections.Generic.List[object]]::new()

# ============================================================
# === EXTRACT COMPLETE LABELED ENVIRONMENTS ===
# ============================================================

for ($Index = 0; $Index -lt $Lines.Length; $Index++) {
    $BeginMatch = [regex]::Match(
        $Lines[$Index],
        $BeginPattern
    )

    if (-not $BeginMatch.Success) {
        continue
    }

    $Kind = $BeginMatch.Groups["kind"].Value
    $Title = $BeginMatch.Groups["title"].Value.Trim()

    if ([string]::IsNullOrWhiteSpace($Title)) {
        $Title = "(untitled)"
    }

    $StartIndex = $Index
    $Depth = 1
    $SearchIndex = $Index + 1

    $EscapedKind = [regex]::Escape($Kind)

    $NestedBeginPattern = (
        "^\s*\\begin\{$EscapedKind\}" +
        "(?:\[[^\]]*\])?" +
        "\s*(?:%.*)?$"
    )

    $MatchingEndPattern = (
        "^\s*\\end\{$EscapedKind\}" +
        "\s*(?:%.*)?$"
    )

    while (
        $SearchIndex -lt $Lines.Length -and
        $Depth -gt 0
    ) {
        if (
            [regex]::IsMatch(
                $Lines[$SearchIndex],
                $NestedBeginPattern
            )
        ) {
            $Depth++
        }

        if (
            [regex]::IsMatch(
                $Lines[$SearchIndex],
                $MatchingEndPattern
            )
        ) {
            $Depth--
        }

        $SearchIndex++
    }

    if ($Depth -ne 0) {
        $SourceLine = $StartIndex + 1

        throw (
            "Unclosed LaTeX environment " +
            "'$Kind' beginning at source line $SourceLine."
        )
    }

    $EndIndex = $SearchIndex - 1
    $BlockLines = @($Lines[$StartIndex..$EndIndex])
    $BlockText = $BlockLines -join [Environment]::NewLine

    $LabelMatch = [regex]::Match(
        $BlockText,
        '\\label\{(?<label>se100\.[^}]+)\}'
    )

    # Ignore target environments that do not carry an SE-100 label.
    if (-not $LabelMatch.Success) {
        $Index = $EndIndex
        continue
    }

    $Label = $LabelMatch.Groups["label"].Value

    $Items.Add(
        [pscustomobject]@{
            Label     = $Label
            Kind      = $Kind
            Title     = $Title
            StartLine = $StartIndex + 1
            EndLine   = $EndIndex + 1
            Lines     = $BlockLines
        }
    )

    # Continue after the complete environment just extracted.
    $Index = $EndIndex
}

# ============================================================
# === VALIDATE THE EXTRACTION ===
# ============================================================

if ($Items.Count -eq 0) {
    throw "No labeled SE-100 environments were extracted."
}

$DuplicateLabels = @(
    $Items |
        Group-Object -Property Label |
        Where-Object Count -gt 1
)

if ($DuplicateLabels.Count -gt 0) {
    $Names = (
        $DuplicateLabels |
            ForEach-Object Name
    ) -join ", "

    throw "Duplicate SE-100 labels found: $Names"
}

$ActualLabels = @(
    $Items |
        ForEach-Object Label
)

$MissingLabels = @(
    $ExpectedLabels |
        Where-Object { $_ -notin $ActualLabels }
)

$UnexpectedLabels = @(
    $ActualLabels |
        Where-Object { $_ -notin $ExpectedLabels }
)

if ($MissingLabels.Count -gt 0) {
    throw (
        "Expected SE-100 labels were not extracted:`n  " +
        ($MissingLabels -join "`n  ")
    )
}

if ($UnexpectedLabels.Count -gt 0) {
    throw (
        "Unexpected SE-100 labels were extracted:`n  " +
        ($UnexpectedLabels -join "`n  ")
    )
}

if ($ActualLabels.Count -ne $ExpectedLabels.Count) {
    throw (
        "Expected $($ExpectedLabels.Count) labeled environments " +
        "but extracted $($ActualLabels.Count)."
    )
}

for (
    $LabelIndex = 0;
    $LabelIndex -lt $ExpectedLabels.Count;
    $LabelIndex++
) {
    if (
        $ActualLabels[$LabelIndex] -ne
        $ExpectedLabels[$LabelIndex]
    ) {
        throw (
            "SE-100 label order differs at position " +
            "$($LabelIndex + 1). Expected " +
            "'$($ExpectedLabels[$LabelIndex])' but found " +
            "'$($ActualLabels[$LabelIndex])'."
        )
    }
}

# ============================================================
# === BUILD THE ORGANIZED MARKDOWN OUTPUT ===
# ============================================================

$Markdown = [System.Collections.Generic.List[string]]::new()

$SourceFileName = Split-Path -Leaf $ResolvedTexPath
$GeneratedAt = Get-Date -Format "yyyy-MM-ddTHH:mm:ssK"

$Markdown.Add("# SE-100 Lean Formalization Basis")
$Markdown.Add("")
$Markdown.Add(
    "> Exact labeled mathematical environments extracted from " +
    "the authoritative Paper 100 LaTeX source."
)
$Markdown.Add("")
$Markdown.Add(('- Source: `{0}`' -f $SourceFileName))
$Markdown.Add(('- Extracted: {0}' -f $GeneratedAt))
$Markdown.Add(('- Labeled items: {0}' -f $Items.Count))
$Markdown.Add("")
$Markdown.Add(
    'Each item contains the exact LaTeX environment from its ' +
    'opening `\begin{...}` through its matching `\end{...}`.'
)
$Markdown.Add("")
$Markdown.Add(
    "The items remain in paper order. No mathematical text " +
    "inside an extracted environment has been rewritten."
)
$Markdown.Add("")

# ============================================================
# === SUMMARY BY KIND ===
# ============================================================

$Markdown.Add("## Summary")
$Markdown.Add("")
$Markdown.Add("| Kind | Count |")
$Markdown.Add("| --- | ---: |")

$KindOrder = @(
    "definition"
    "note"
    "assumption"
    "remark"
    "constraint"
    "example"
)

foreach ($KindName in $KindOrder) {
    $Count = @(
        $Items |
            Where-Object Kind -eq $KindName
    ).Count

    if ($Count -gt 0) {
        $Markdown.Add(
            ("| {0} | {1} |" -f $KindName, $Count)
        )
    }
}

$Markdown.Add("")

# ============================================================
# === PAPER-ORDER INDEX ===
# ============================================================

$Markdown.Add("## Paper-Order Index")
$Markdown.Add("")
$Markdown.Add(
    "| # | Paper ID | Kind | Title | Source lines |"
)
$Markdown.Add(
    "| ---: | --- | --- | --- | ---: |"
)

for (
    $ItemIndex = 0;
    $ItemIndex -lt $Items.Count;
    $ItemIndex++
) {
    $Item = $Items[$ItemIndex]

    $SafeTitle = $Item.Title.Replace("|", "\|")
    $LineRange = "$($Item.StartLine)-$($Item.EndLine)"

    $Markdown.Add(
        (
            '| {0} | `{1}` | {2} | {3} | {4} |' -f
                ($ItemIndex + 1),
                $Item.Label,
                $Item.Kind,
                $SafeTitle,
                $LineRange
        )
    )
}

$Markdown.Add("")

# ============================================================
# === EXACT EXTRACTED BLOCKS ===
# ============================================================

$Markdown.Add("## Extracted Basis")
$Markdown.Add("")

for (
    $ItemIndex = 0;
    $ItemIndex -lt $Items.Count;
    $ItemIndex++
) {
    $Item = $Items[$ItemIndex]
    $Number = $ItemIndex + 1

    $Markdown.Add(
        (
            '## {0:D2}. `{1}` — {2}' -f
                $Number,
                $Item.Label,
                $Item.Title
        )
    )

    $Markdown.Add("")
    $Markdown.Add(('- Kind: `{0}`' -f $Item.Kind))
    $Markdown.Add(
        (
            '- Source lines: `{0}-{1}`' -f
                $Item.StartLine,
                $Item.EndLine
        )
    )
    $Markdown.Add("")
    $Markdown.Add('```latex')

    foreach ($Line in $Item.Lines) {
        $Markdown.Add($Line)
    }

    $Markdown.Add('```')
    $Markdown.Add("")
}

# ============================================================
# === WRITE OUTPUT ===
# ============================================================

Set-Content `
    -LiteralPath $ResolvedOutputPath `
    -Value $Markdown `
    -Encoding utf8

# ============================================================
# === REPORT ===
# ============================================================

Write-Host ""
Write-Host "SE-100 Lean basis extracted successfully."
Write-Host ""
Write-Host "Source:"
Write-Host "  $ResolvedTexPath"
Write-Host ""
Write-Host "Output:"
Write-Host "  $ResolvedOutputPath"
Write-Host ""
Write-Host "Extracted:"
Write-Host "  $($Items.Count) labeled environments"
Write-Host ""

foreach ($KindName in $KindOrder) {
    $Count = @(
        $Items |
            Where-Object Kind -eq $KindName
    ).Count

    if ($Count -gt 0) {
        Write-Host ("  {0,-12} {1,2}" -f $KindName, $Count)
    }
}

Write-Host ""

Exit 0
