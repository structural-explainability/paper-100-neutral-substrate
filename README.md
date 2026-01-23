# The Ontological Neutrality Theorem

<!-- CUSTOM: arXiv badge is static by design to avoid Shields/arXiv API lag and cache failures -->

[![License: CC BY 4.0](https://img.shields.io/badge/License-CC_BY_4.0-blue.svg)](https://creativecommons.org/licenses/by/4.0/)
[![arXiv](https://img.shields.io/badge/arXiv-2601.16152-b31b1b.svg)](https://arxiv.org/abs/2601.16152)
[![Build PDF](https://github.com/structural-explainability/paper-100-neutral-substrate/actions/workflows/build-latex.yml/badge.svg?branch=main)](https://github.com/structural-explainability/paper-100-neutral-substrate/actions/workflows/build-latex.yml)
[![Check Links](https://github.com/structural-explainability/paper-100-neutral-substrate/actions/workflows/links.yml/badge.svg?branch=main)](https://github.com/structural-explainability/paper-100-neutral-substrate/actions/workflows/links.yml)
[![ArXiv Prep](https://github.com/structural-explainability/paper-100-neutral-substrate/actions/workflows/arxiv-prep.yml/badge.svg?branch=main)](https://github.com/structural-explainability/paper-100-neutral-substrate/actions/workflows/arxiv-prep.yml)
[![DOI](https://img.shields.io/badge/DOI-10.48550/arXiv.2601.14271-blue)](https://doi.org/10.48550/arXiv.2601.14271)

> This paper derives necessary design constraints for ontological substrates
> intended to support stable reference under persistent disagreement,
> showing that causal and normative commitments must be externalized
> to preserve substrate neutrality.

## Paper

- [PDF](./se100_the_ontological_neutrality_theorem.pdf)
- Status: Submitted to journal; under review.

## Repository Structure

```
.github/         # CI workflows
.vscode/         # Editor settings
bibliography/    # BibTeX references
glossary/        # Term definitions
tools/           # Scripts
```

## Building Locally

<!--
On Windows (MiKTeX):

- Download from <https://miktex.org/download>.
- Suggested options during installation:
  - Install for current user only
  - Leave paper size at A4 (default is fine)
  - Install missing packages on the fly = Yes
  - Add MiKTeX to PATH = Yes
-->

Requires a LaTeX distribution with `latexmk` (MiKTeX, TeX Live, or MacTeX):

```bash
latexmk -pdf se100_the_ontological_neutrality_theorem.tex
```

Windows:

```pwsh
.\tools\build\build.ps1
```

## Annotations

[ANNOTATIONS.md](./ANNOTATIONS.md)

## Citation

See [CITATION.cff](./CITATION.cff).

## License

[CC BY 4.0](./LICENSE)

## SE Manifest

[SE_MANIFEST](./SE_MANIFEST.toml)
