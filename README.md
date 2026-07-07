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

1. \bibitem[Carroll et~al.(2005)]{carroll2005named}
   Carroll, J.~J., Bizer, C., Hayes, P., and Stickler, P. (2005).
   Named graphs, provenance and trust.
   In \emph{Proceedings of the 14th International Conference on World Wide Web
   (WWW 2005)}, pages 613--622. ACM.
   <https://lists.w3.org/Archives/Public/www-archive/2004Apr/att-0081/PID-FAFPGYHS-1081860211.pdf>

1. \bibitem[de~Kleer(1986)]{dekleer1986atms}
   de~Kleer, J. (1986).
   An assumption-based TMS.
   \emph{Artificial Intelligence}, 28(2):127--162.
   <https://www.semanticscholar.org/paper/An-Assumption-Based-TMS-Kleer/ed3f9263e936a879092ad7a2bf27e0f94089ccd8>

1. \bibitem[Dung(1995)]{dung1995}
   Dung, P.~M. (1995).
   On the acceptability of arguments and its fundamental role in nonmonotonic
   reasoning, logic programming and $n$-person games.
   \emph{Artificial Intelligence}, 77(2):321--357.
   <https://www.ijcai.org/Proceedings/93-2/Papers/003.pdf>

1. \bibitem[Floridi(2008)]{floridi2008loa}
  Floridi, L. (2008).
  The method of levels of abstraction.
  \emph{Minds and Machines}, 18(3), 303--329.
  doi:10.1007/s11023-008-9113-7.
  <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3182086>

1. \bibitem[Guarino(1998)]{guarino1998}
   Guarino, N. (1998).
   Formal ontology and information systems.
   In \emph{Formal Ontology in Information Systems (FOIS~'98)}, pages 3--15.
   IOS Press.
   <https://www.loa-cnr.it/Papers/FOIS98.pdf>

1. \bibitem[Gangemi and Mika(2003)]{gangemi2003descriptions}
  Gangemi, A., and Mika, P. (2003).
  Understanding the Semantic Web through descriptions and situations.
  In R. Meersman, Z. Tari, and D. C. Schmidt (Eds.),
  \emph{On the Move to Meaningful Internet Systems 2003:
    CoopIS, DOA, and ODBASE},
  Lecture Notes in Computer Science, vol. 2888.
  Springer.
  doi:10.1007/978-3-540-39964-3\_44.
  <https://www.loa-cnr.it/Papers/ODBASE-CONTEXT.pdf>

1. \bibitem[Hayes(2004)]{hayes2004rdf}
   Hayes, P. (2004).
   \emph{RDF Semantics}.
   W3C Recommendation, World Wide Web Consortium.
   <https://www.w3.org/2001/sw/RDFCore/TR/WD-rdf-mt-20030117/>

1. \bibitem[Lebo et~al.(2013)]{lebo2013prov}
   Lebo, T., Sahoo, S., and McGuinness, D.~L., editors (2013).
   \emph{PROV-O: The PROV Ontology}.
   W3C Recommendation, World Wide Web Consortium.
   <https://www.w3.org/TR/prov-o/>

1. \bibitem[McCarthy(1993)]{mccarthy1993}
   McCarthy, J. (1993).
   Notes on formalizing context.
   In \emph{Proceedings of the 13th International Joint Conference on Artificial
   Intelligence (IJCAI-93)}, pages 555--560.
   <https://www.ijcai.org/Proceedings/93-1/Papers/078.pdf>

1. \bibitem[Searle(1969)]{searle1969}
   Searle, J.~R. (1969).
   \emph{Speech Acts: An Essay in the Philosophy of Language}.
   Cambridge University Press.
   <https://doi.org/10.1017/CBO9781139173438>
