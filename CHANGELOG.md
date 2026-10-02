# Changelog

<!-- markdownlint-disable MD024 -->

All notable changes to this project will be documented in this file.

The format is based on **[Keep a Changelog](https://keepachangelog.com/en/1.1.0/)**
and this project adheres to **[Semantic Versioning](https://semver.org/spec/v2.0.0.html)**.

---

## [Unreleased]

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

- `se100.def.FrameworkInvariant`: "no admissible framework refutes `p`" is now
  stated as a consequence of the definition, with a reference to the new remark,
  not as an equivalent restatement.
- `CITATION.cff` now describes the repository; the paper is cited through
  `preferred-citation`.
- README: added a paper overview section.
- Rebuilt `se100-neutral-substrates-v1.pdf`.

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
  - **MAJOR** - breaking changes to formal surface or validation semantics
  - **MINOR** - backward-compatible additions to theory vocabulary or artifacts
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

# Validate.
uvx cffconvert --validate
uvx se-manifest-schema validate-manifest --strict

# Format Markdown.
npx markdownlint-cli2 --fix

# Build and inspect
latexmk -pdf se100-neutral-substrates-v1.tex
.\tools\build\build.ps1

texcount -inc -sum -total se100-neutral-substrates-v1.tex
.\basis.ps1
```

Update the basis on `README.md`.
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
4. Summarize the change in the arXiv Comments field.

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

[Unreleased]: https://github.com/structural-explainability/se-theory-transformation/compare/v1.1.0...HEAD
[1.1.0]: https://github.com/structural-explainability/se-theory-transformation/releases/tag/v1.1.0
[1.0.0]: https://github.com/structural-explainability/se-theory-transformation/releases/tag/v1.0.0
[0.1.0]: https://github.com/structural-explainability/se-theory-transformation/releases/tag/v0.1.0
