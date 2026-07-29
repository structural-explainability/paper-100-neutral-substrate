$tex = ".\se100-neutral-substrates-v1.tex"

Select-String -LiteralPath $tex `
  -SimpleMatch "\label{se100." `
  -Context 1,1

Exit 0

Select-String -LiteralPath $tex `
  -SimpleMatch "object-level" `
  -Context 3,3

Exit 0

$citeKeys =
  Select-String -LiteralPath $tex `
    -Pattern "\\cite[a-zA-Z*]*\{([^}]+)\}" |
  ForEach-Object {
    if ($_.Line -match "\\cite[a-zA-Z*]*\{([^}]+)\}") {
      $Matches[1] -split "," | ForEach-Object { $_.Trim() }
    }
  } |
  Sort-Object -Unique

$bibItemKeys =
  Select-String -LiteralPath $tex `
    -Pattern "\\bibitem(?:\[[^\]]+\])?\{([^}]+)\}" |
  ForEach-Object {
    if ($_.Line -match "\\bibitem(?:\[[^\]]+\])?\{([^}]+)\}") {
      $Matches[1].Trim()
    }
  } |
  Sort-Object -Unique

$unused =
  $bibItemKeys |
  Where-Object { $citeKeys -notcontains $_ }

if ($unused) {
  "UNUSED BIBITEM KEYS:"
  $unused
} else {
  "OK: no unused bibitem keys."
}

exit 0

$citeKeys =
  Select-String -LiteralPath $tex `
    -Pattern "\\cite[a-zA-Z*]*\{([^}]+)\}" |
  ForEach-Object {
    if ($_.Line -match "\\cite[a-zA-Z*]*\{([^}]+)\}") {
      $Matches[1] -split "," | ForEach-Object { $_.Trim() }
    }
  } |
  Sort-Object -Unique

$bibItemKeys =
  Select-String -LiteralPath $tex `
    -Pattern "\\bibitem(?:\[[^\]]+\])?\{([^}]+)\}" |
  ForEach-Object {
    if ($_.Line -match "\\bibitem(?:\[[^\]]+\])?\{([^}]+)\}") {
      $Matches[1].Trim()
    }
  } |
  Sort-Object -Unique

$missing =
  $citeKeys |
  Where-Object { $bibItemKeys -notcontains $_ }

$unused =
  $bibItemKeys |
  Where-Object { $citeKeys -notcontains $_ }

if ($missing) {
  "MISSING BIBITEM KEYS:"
  $missing
} else {
  "OK: all citation keys have matching \bibitem entries."
}

if ($unused) {
  ""
  "UNUSED BIBITEM KEYS:"
  $unused
}

exit 0

$expected = @{
  "DefRef"    = "^se100\.def\."
  "AssumpRef" = "^se100\.assump\."
  "ConstRef"  = "^se100\.constraint\."
  "ExRef"     = "^se100\.example\."
  "RemRef"    = "^se100\.remark\."
  "NoteRef"   = "^se100\.note\."
  "SecRef"    = "^sec:"
}

$refs =
  Select-String -LiteralPath $tex `
    -Pattern "\\(DefRef|AssumpRef|ConstRef|ExRef|RemRef|NoteRef|SecRef)\{([^}]+)\}" |
  ForEach-Object {
    if ($_.Line -match "\\(DefRef|AssumpRef|ConstRef|ExRef|RemRef|NoteRef|SecRef)\{([^}]+)\}") {
      [PSCustomObject]@{
        Macro      = $Matches[1]
        Target     = $Matches[2]
        LineNumber = $_.LineNumber
        Line       = $_.Line.Trim()
      }
    }
  }

$wrongType =
  $refs |
  Where-Object {
    $_.Target -notmatch $expected[$_.Macro]
  }

if ($wrongType) {
  "CUSTOM REFERENCE TYPE MISMATCHES:"
  $wrongType | Format-Table -AutoSize
} else {
  "OK: all custom references use the correct macro type."
}

exit 0

$labels =
  Select-String -LiteralPath $tex -Pattern "\\label\{([^}]+)\}" |
  ForEach-Object {
    if ($_.Line -match "\\label\{([^}]+)\}") {
      $Matches[1]
    }
  } |
  Sort-Object -Unique

$refs =
  Select-String -LiteralPath $tex `
    -Pattern "\\(DefRef|AssumpRef|ConstRef|ExRef|RemRef|NoteRef|SecRef)\{([^}]+)\}" |
  ForEach-Object {
    if ($_.Line -match "\\(DefRef|AssumpRef|ConstRef|ExRef|RemRef|NoteRef|SecRef)\{([^}]+)\}") {
      [PSCustomObject]@{
        Macro      = $Matches[1]
        Target     = $Matches[2]
        LineNumber = $_.LineNumber
        Line       = $_.Line.Trim()
      }
    }
  }

$missing =
  $refs |
  Where-Object { $labels -notcontains $_.Target }

if ($missing) {
  "MISSING CUSTOM REFERENCE TARGETS:"
  $missing | Format-Table -AutoSize
} else {
  "OK: all custom reference targets exist."
}

Exit 0

Select-String -LiteralPath $tex `
  -SimpleMatch "neutral by design" `
  -Context 3,3

Select-String -LiteralPath $tex `
  -SimpleMatch "neutrality by design" `
  -Context 3,3

Exit 0

Select-String -LiteralPath $tex `
  -Pattern "interpretive commitment|interpretive|commitments|interpretive content must|interpretive claims must" `
  -Context 4,4

Exit 0

Select-String -LiteralPath $tex `
  -Pattern "permitted attribution propositions|permitted attribution proposition|attribution propositions whose|attributional basis|grounded in|fixed by" `
  -Context 3,3



Select-String -LiteralPath $tex `
  -SimpleMatch "provenance-bearing assertions" `
  -Context 3,3

Select-String -LiteralPath $tex `
  -Pattern "\\Asserts\(" `
  -Context 2,2

Select-String -LiteralPath $tex `
  -SimpleMatch "\Asserts(x,\varphi)" `
  -Context 2,2

Select-String -LiteralPath $tex `
  -SimpleMatch "\Asserts(\Framework" `
  -Context 3,3

Select-String -LiteralPath $tex `
  -Pattern "substrate-layer commitment[s]?" `
  -Context 3,3

Select-String -LiteralPath $tex `
  -SimpleMatch "object-level causal or normative" `
  -Context 3,3

Select-String -LiteralPath $tex `
  -Pattern "object-level interpretive commitment[s]?" `
  -Context 3,3

Select-String -LiteralPath $tex `
  -SimpleMatch "object-level interpretive" `
  -Context 3,3

Select-String -LiteralPath $tex `
  -SimpleMatch "causal and normative content" `
  -Context 3,3

Select-String -LiteralPath $tex `
  -SimpleMatch "C_{cn}" `
  -Context 4,4

Select-String -LiteralPath $tex `
  -SimpleMatch "framework-invariant" `
  -Context 3,3

Select-String -LiteralPath $tex `
  -SimpleMatch "uncertified at design time" `
  -Context 4,4

Select-String -LiteralPath $tex `
  -SimpleMatch "neutral by design" `
  -Context 3,3

Select-String -LiteralPath $tex `
  -SimpleMatch "neutrality by design" `
  -Context 3,3

Select-String -LiteralPath $tex `
  -SimpleMatch "referential commitments" `
  -Context 3,3

Select-String -LiteralPath $tex `
  -SimpleMatch "\SubstrateRef" `
  -Context 3,3

Select-String -LiteralPath $tex `
  -SimpleMatch "attributional basis" `
  -Context 3,3

Select-String -LiteralPath $tex `
  -Pattern "boundary|contested reference|referential regime|unavailable" `
  -Context 3,3

Select-String -LiteralPath $tex `
  -Pattern "all interpretive|any interpretive|every interpretive|interpretive content must|interpretive claims must" `
  -Context 4,4

Select-String -LiteralPath $tex `
  -Pattern "evidentiary|explanatory|justificatory|institutional conclusions|empirical" `
  -Context 3,3

Select-String -LiteralPath $tex `
  -Pattern "\\label\{[^}]+\}" `
  -Context 0,0

Select-String -LiteralPath $tex -Pattern "\\label\{([^}]+)\}" |
  ForEach-Object {
    if ($_.Line -match "\\label\{([^}]+)\}") {
      [PSCustomObject]@{ Label = $Matches[1]; LineNumber = $_.LineNumber; Line = $_.Line.Trim() }
    }
  } |
  Group-Object Label |
  Where-Object Count -gt 1 |
  Format-Table -AutoSize

Select-String -LiteralPath $tex `
  -Pattern "\\(DefRef|AssumpRef|ConstRef|ExRef|RemRef|NoteRef|SecRef)\{" `
  -Context 0,0

Select-String -LiteralPath $tex `
  -Pattern "committment|committments|substrate level|substrate-level" `
  -Context 2,2

Select-String -LiteralPath $tex `
  -Pattern "contribution|biconditional|constraint|checkable" `
  -Context 3,3

@(
  "provenance-bearing assertions",
  "object-level causal or normative",
  "substrate-layer commitment",
  "\Asserts(x,\varphi)",
  "\Asserts(\Framework",
  "neutral by design",
  "referential common ground",
  "attributional basis"
) | ForEach-Object {
  $count = (Select-String -LiteralPath $tex -SimpleMatch $_).Count
  [PSCustomObject]@{ Phrase = $_; Count = $count }
} | Format-Table -AutoSize
