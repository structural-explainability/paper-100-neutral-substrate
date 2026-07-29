# Neutral Substrates

<!-- CUSTOM: arXiv badge is static by design to avoid Shields/arXiv API lag and cache failures -->

[![License: CC BY 4.0](https://img.shields.io/badge/License-CC_BY_4.0-blue.svg)](https://creativecommons.org/licenses/by/4.0/)
[![arXiv](https://img.shields.io/badge/arXiv-2601.14271-b31b1b.svg)](https://arxiv.org/abs/2601.14271)

[![Build PDF](https://github.com/structural-explainability/paper-100-neutral-substrate/actions/workflows/build-latex.yml/badge.svg?branch=main)](https://github.com/structural-explainability/paper-100-neutral-substrate/actions/workflows/build-latex.yml)
[![Check Links](https://github.com/structural-explainability/paper-100-neutral-substrate/actions/workflows/links.yml/badge.svg?branch=main)](https://github.com/structural-explainability/paper-100-neutral-substrate/actions/workflows/links.yml)

[![ArXiv Prep](https://github.com/structural-explainability/paper-100-neutral-substrate/actions/workflows/arxiv-prep.yml/badge.svg?branch=main)](https://github.com/structural-explainability/paper-100-neutral-substrate/actions/workflows/arxiv-prep.yml)
[![DOI](https://img.shields.io/badge/DOI-10.48550/arXiv.2601.14271-blue)](https://doi.org/10.48550/arXiv.2601.14271)

> Defines neutral substrates that preserve shared reference
> without adopting contested interpretations.

## Paper Overview

- [arXiv](https://arxiv.org/abs/2601.14271)
- [SciX](https://scixplorer.org/abs/2026arXiv260114271C/abstract)

## Main Contribution

This project defines a design constraint for shared accountability records.
When causal and normative propositions are contestable across admissible frameworks,
and the substrate's referential commitments are common ground among those frameworks,
**neutrality by design** requires the foundational layer
to be restricted to those referential commitments and attribution propositions.
Causal and normative content may be represented,
but only as attributed, provenance-bearing assertions,
not as object-level substrate-layer commitments.

## Building Locally

- On Windows, install Strawberry Perl and MiKTeX.

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
latexmk -pdf se100-neutral-substrates-v1.tex

texcount -inc -sum -total se100-neutral-substrates-v1.tex
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

Validate with:

```shell
uvx se-manifest-schema validate-manifest --path SE_MANIFEST.toml --strict
```

## References

1. Carroll, J. J., Bizer, C., Hayes, P., and Stickler, P. (2005).
   "Named graphs, provenance and trust."
   In _Proceedings of the 14th International Conference on World Wide Web
   (WWW 2005)_, pages 613–622. ACM.
   <https://lists.w3.org/Archives/Public/www-archive/2004Apr/att-0081/PID-FAFPGYHS-1081860211.pdf>

1. de Kleer, J. (1986).
   "An assumption-based TMS."
   _Artificial Intelligence_, 28(2):127–162.
   <https://www.semanticscholar.org/paper/An-Assumption-Based-TMS-Kleer/ed3f9263e936a879092ad7a2bf27e0f94089ccd8>

1. Dung, P. M. (1995).
   "On the acceptability of arguments and its fundamental role in nonmonotonic
   reasoning, logic programming and _n_-person games."
   _Artificial Intelligence_, 77(2):321–357.
   <https://www.ijcai.org/Proceedings/93-2/Papers/003.pdf>

1. Floridi, L. (2008).
   "The method of levels of abstraction."
   _Minds and Machines_, 18(3):303–329.
   <https://doi.org/10.1007/s11023-008-9113-7>

1. Gangemi, A., and Mika, P. (2003).
   "Understanding the Semantic Web through descriptions and situations."
   In R. Meersman, Z. Tari, and D. C. Schmidt (Eds.),
   _On the Move to Meaningful Internet Systems 2003:
   CoopIS, DOA, and ODBASE_,
   Lecture Notes in Computer Science, vol. 2888.
   Springer.
   <https://doi.org/10.1007/978-3-540-39964-3_44>

1. Guarino, N. (1998).
   "Formal ontology and information systems."
   In _Formal Ontology in Information Systems (FOIS ’98)_, pages 3–15.
   IOS Press.
   <https://www.loa-cnr.it/Papers/FOIS98.pdf>

1. Hayes, P. (2004).
   _RDF Semantics_.
   W3C Recommendation, World Wide Web Consortium.
   <https://www.w3.org/2001/sw/RDFCore/TR/WD-rdf-mt-20030117/>

1. Lebo, T., Sahoo, S., and McGuinness, D. L., editors (2013).
   _PROV-O: The PROV Ontology_.
   W3C Recommendation, World Wide Web Consortium.
   <https://www.w3.org/TR/prov-o/>

1. McCarthy, J. (1993).
   "Notes on formalizing context."
   In _Proceedings of the 13th International Joint Conference on Artificial
   Intelligence (IJCAI-93)_, pages 555–560.
   <https://www.ijcai.org/Proceedings/93-1/Papers/078.pdf>

1. Searle, J. R. (1969).
   _Speech Acts: An Essay in the Philosophy of Language_.
   Cambridge University Press.
   <https://doi.org/10.1017/CBO9781139173438>

## Related and Adjacent Work

Selected papers from the
[Harvard SciX similar-papers search](https://ui.adsabs.harvard.edu/abs/2026arXiv260114271C/similar)
for _Neutral Substrates_.

### Identity and Equivalence

- [Representing Identity and Equivalence for Scientific Data](https://ui.adsabs.harvard.edu/abs/2012AGUFMIN22A..04W/abstract)

### Provenance

- [Provenance-Enhanced Statements in Knowledge Graphs](https://ui.adsabs.harvard.edu/abs/2026arXiv260615246V/abstract)
- [Responsible Agentic AI Requires Explicit Provenance](https://ui.adsabs.harvard.edu/abs/2026arXiv260517169H/abstract)
- [From Agent Traces to Trust: A Survey of Evidence Tracing and Execution Provenance in LLM Agents](https://ui.adsabs.harvard.edu/abs/2026arXiv260604990W/abstract)

### Responsibility Attribution

- [Mapping Responsibility Attribution in the Grenfell Tower Inquiry: A Network Analysis](https://ui.adsabs.harvard.edu/abs/2025arXiv251021681D/abstract)

### Contradiction, Disagreement, and Ambiguity

- [ECO/CPO-DAG: A Contradiction-Based Accountability Layer for Adversarial Supply Chains](https://ui.adsabs.harvard.edu/abs/2026arXiv260706804C/abstract)
- [Consensus is Strategically Insufficient: Reasoning-Trace Disagreement as a Knowledge-Representation Signal](https://ui.adsabs.harvard.edu/abs/2026arXiv260604223W/abstract)
- [Ambiguity Collapse by LLMs: A Taxonomy of Epistemic Risks](https://ui.adsabs.harvard.edu/abs/2026arXiv260305801G/abstract)

### Assertibility

- [No Certificate, No Categorical Speech Act: A Brouwerian Assertibility Constraint for Public Reason](https://ui.adsabs.harvard.edu/abs/2026arXiv260303971J/abstract)

### Operational Records and Auditable Agents

- [The Log is the Agent: Event-Sourced Reactive Graphs for Auditable, Forkable Agentic Systems](https://ui.adsabs.harvard.edu/abs/2026arXiv260521997N/abstract)
- [Auditable Agents](https://ui.adsabs.harvard.edu/abs/2026arXiv260405485N/abstract)
