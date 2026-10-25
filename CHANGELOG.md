# Changelog

<!-- markdownlint-disable MD024 -->

All notable changes to this project will be documented in this file.

The format is based on **[Keep a Changelog](https://keepachangelog.com/en/1.1.0/)**
and this project adheres to **[Semantic Versioning](https://semver.org/spec/v2.0.0.html)**.

---

## [Unreleased]

---

## [2.0.0] - 2026-10-25

### Summary

Revised neutrality result as conditional sufficiency;
distinguished semantic neutrality from design-time guarantees;
clarified assumptions and limits; aligned with Lean 4 formalization.

### Added

- `se100.note.ConsequenceSystem`: explicitly identifies the structural
  consequence properties used in the arguments, without requiring
  explosion, excluded middle, completeness, or other stronger logical laws.
- `se100.remark.CharacterizationHypothesis`: records the proposed
  characterization of neutrality by design as an explicit hypothesis
  on realizations rather than an established theorem.
- A conditional sufficiency argument establishing semantic neutrality
  from the foundational-layer restriction and Referential Common Ground.
- An explicit distinction between semantic neutrality and neutrality
  established through a permitted design-time guarantee.
- A formalized discriminating example with admissible frameworks that
  disagree about a contested proposition, a neutral substrate, and a
  non-neutral substrate.
- Expanded discussion of the assumptions, justification requirements,
  and limits of the neutrality result.

### Changed

- **Breaking:** `se100.constraint.Neutrality` now states conditional
  sufficiency for semantic neutrality, not an unconditional equivalence
  or a complete characterization of neutrality by design.
- Revised `se100.def.NeutralityByDesign` to distinguish satisfaction
  of the semantic neutrality properties from possession of a permitted
  design-time basis establishing those properties.
- Clarified that Referential Common Ground concerns joint consistency
  of the complete referential commitment theory with each admissible
  framework, not merely compatibility of individual propositions.
- Clarified that extension stability requires compatibility with each
  admissible framework separately, not collective consistency among
  mutually incompatible frameworks.
- Updated the paper's definitions, explanations, and justification
  to align with the corresponding Lean 4 formalization.
- Updated the extracted Lean formalization basis to 28 labeled
  mathematical environments.

### Clarified

- The sufficiency result does not, by itself, establish neutrality
  by design.
- The necessity of the foundational-layer restriction is not proved
  from Contestability and Referential Common Ground alone.
- A permitted design-time guarantee requires independent justification
  of its permitted basis and the guarantee it establishes.
- Referential Common Ground is an assumption whose adequacy must be
  established for concrete referential realizations.
- The formal results do not independently establish semantic or
  empirical grounding for referents, referential commitments, or
  attributed assertion records.
- The framework class is defined by intrinsic admissibility and does
  not depend on enumeration or design-time knowledge of frameworks.
- The boundary-condition section is retitled "Boundary Condition: When
  Neutrality Is Not Certified".
  Failure of Referential Common Ground means the construction
  does not certify neutrality, not that neutrality is impossible.
- The worked example fixes the source and its assertion occurrences
  as the attributional basis of its attribution propositions.

---

## [1.1.0] - 2026-10-02

### Added

- `CHANGELOG.md`.
- `se100.remark.FrameworkInvariantRefutation`: framework invariance implies that
  no admissible framework refutes a proposition; the converse requires negation
  introduction, which the paper does not assume.
- `basis.ps1` and `se100-lean-basis.md`: the labeled definitions, assumptions,
  remarks, notes, constraint, and example extracted verbatim as the basis for the
  Lean formalization.
- Acknowledgments subsection in Statements and Declarations.

### Changed

- `se100.def.FrameworkInvariant`: removed the clause presenting "no admissible
  framework refutes `p`" as equivalent to the definition; the relationship is
  stated in `se100.remark.FrameworkInvariantRefutation`.
- `CITATION.cff` describes the repository; the paper is cited through
  `preferred-citation`.
- README: added a paper overview section.
- Rebuilt the pdf.

---

## [1.0.0] - 2026-07-07

Released before this changelog existed. See the
[release](https://github.com/structural-explainability/paper-100-neutral-substrate/releases/tag/v1.0.0).

---

## [0.1.0] - 2025-12-27

Released before this changelog existed. See the
[release](https://github.com/structural-explainability/paper-100-neutral-substrate/releases/tag/v0.1.0).

---

## Notes on versioning and releases

- We use **SemVer**:
  - **MAJOR** - breaking changes to the meaning, assumptions, or conclusions
    of existing paper items, or removal or renaming of their identifiers
  - **MINOR** - backward-compatible additions
  - **PATCH** - fixes, documentation, tooling
- Versions are driven by git tags. Tag `vX.Y.Z` to release.

## Release Procedure (Required)

Follow these steps exactly when creating a new release.

### Task 1. Update release metadata (manual edits)

1.1. CITATION.cff: update version and date-released
1.2. CHANGELOG.md: add section, move unreleased entries, update links

### Task 2. Set up and Validate

```shell
# Update GitHub Actions and pin all action references to immutable SHAs.
uvx gha-tools autoupdate --pin=all --write .github/workflows

# Audit the resulting GitHub configuration for security findings.
uvx zizmor@latest .github/
# some suppressed is still okay

# Validate.
uvx cffconvert --validate
uvx se-manifest-schema validate-manifest --strict

# Format Markdown.
npx markdownlint-cli2 --fix

# Build and inspect
latexmk -pdf se100-neutral-substrates.tex
.\tools\build\build.ps1

texcount -inc -sum -total se100-neutral-substrates.tex
.\basis.ps1
```

Review all generated and modified files before committing.

### Task 3. Commit and Push

```shell
git add -A
git commit -m "Prep X.Y.Z"
git push -u origin main
```

Verify that all required GitHub Actions complete successfully.

### Task 4. Prepare and submit to arXiv

1. Run the **Prepare arXiv Source** workflow manually.
2. Download `arxiv-source.zip` and the compiled PDF artifact; check the PDF.
3. Replace the existing arXiv submission (2601.14271) with the new source.
4. Update the arXiv abstract field to match the paper's abstract.
5. Summarize the change in the arXiv Comments field.

Verify the updated arxiv step
BEFORE tagging.

### Task 5. Tag and Push the Release

After the required GitHub Actions succeed:

```shell
git tag vX.Y.Z -m "X.Y.Z"
git push origin vX.Y.Z
```

## Only As Needed (delete a tag)

```shell
git tag -d vX.Z.Y
git push origin :refs/tags/vX.Z.Y
```

## Links

[Unreleased]: https://github.com/structural-explainability/paper-100-neutral-substrate/compare/v2.0.0...HEAD
[2.0.0]: https://github.com/structural-explainability/paper-100-neutral-substrate/releases/tag/v2.0.0
[1.1.0]: https://github.com/structural-explainability/paper-100-neutral-substrate/releases/tag/v1.1.0
[1.0.0]: https://github.com/structural-explainability/paper-100-neutral-substrate/releases/tag/v1.0.0
[0.1.0]: https://github.com/structural-explainability/paper-100-neutral-substrate/releases/tag/v0.1.0
