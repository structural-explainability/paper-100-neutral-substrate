# The Ontological Neutrality Theorem: Structural Constraints for Neutral Substrates Under Persistent Interpretive Disagreement

**Denise M. Case**  
Department of Computer Science and Information Systems  
Northwest Missouri State University, Maryville, MO, USA

---

## Abstract

Modern data systems must support stable shared reference across persistent interpretive disagreement. This requirement imposes structural constraints on any ontology intended to function as a neutral substrate. This paper establishes a necessary and sufficient condition for ontological neutrality under an explicitly stated contestability assumption and scope condition. The central result is a biconditional: a substrate ontology satisfies neutrality if and only if its foundational layer is restricted to framework-invariant referential structure and does not assert causal or normative conclusions as substrate-layer facts. Neutrality is the conjunction of two requirements: interpretive non-commitment and extension stability. The result holds under a contestability assumption for causal and normative propositions, and under the scope condition that the substrate's framework-invariant referential structure — including its referential regime — is fixed at the substrate layer and is not itself contested across the admissible frameworks under consideration. A referential regime consists of the individuation, co-reference, and persistence conditions by which entities, occurrences, and institutional artifacts are fixed and tracked. The paper does not propose a specific ontology or protocol. It identifies the structural constraints any ontology must satisfy to function as a neutral substrate across admissible interpretive frameworks under persistent disagreement.

**Keywords:** formal ontology; ontological neutrality; neutral substrates; accountable records; referential regimes; interpretive non-commitment; extension stability; persistent interpretive disagreement; reification; provenance; pre-causal; pre-normative

---

## 1. Introduction

Modern data systems must support stable shared reference across persistent legal, political, analytic, causal, and normative disagreement. Legal interpretations diverge across jurisdictions and over time (Dworkin 1986; Hart 1961); political actors contest responsibility and intent (Bovens 2007; Hood 2011); analytic frameworks disagree about causation and attribution (Woodward 2003). These disagreements are not anomalies to be resolved prior to data representation. They are structural features of institutional environments that data systems must accommodate while maintaining stable reference to shared entities, occurrences, and institutional artifacts.

Accountability is one motivating setting where this requirement is especially visible. Accountability requires the ability to refer stably to entities, occurrences, and institutional artifacts (Gruber 1993; Smith and Ceusters 2010) while allowing competing explanations, evaluations, and judgments to coexist. A system that embeds a single causal or normative interpretation into its foundational representation restricts accountability under persistent interpretive disagreement, because it forecloses contestation and framework-relative evaluation (Bowker and Star 1999).

Ontology design has traditionally addressed two related problems. Under *shared interpretation*, participants agree on a common ontology providing unified interpretation. Under *semantic heterogeneity*, multiple ontologies exist and disagreement is treated as a translation problem addressed through alignment or mediation. The problem considered here is different: *persistent interpretive disagreement*, in which multiple admissible frameworks reach incompatible conclusions about the same referents while continuing to operate over a shared representational base.

| Setting | Ontology Structure | Mechanism |
|---|---|---|
| Shared interpretation | Shared ontology | Unified interpretation |
| Semantic heterogeneity | Multiple ontologies | Alignment / Mediation |
| Persistent disagreement | Neutral substrate | Multiple frameworks |

The goal is to identify the structural constraints under which an ontology can function as a **neutral substrate**: a shared representational base that maintains stable reference across incompatible interpretive frameworks without requiring revision of the substrate itself.

The contribution of this paper is not the observation that interpretive frameworks disagree about causal or normative conclusions. That fact is widely recognized. The contribution is to show that, in settings where substrate revision is treated as an impermissible mechanism for resolving interpretive conflict, this disagreement imposes formal structural constraints on ontology design, and to establish those constraints as a biconditional.

The central result: under the stated contestability assumption and referential-invariance scope condition, a substrate ontology satisfies neutrality if and only if its foundational layer is restricted to framework-invariant referential structure and does not assert causal or normative conclusions as substrate-layer facts. Neutrality is therefore possible if and only if the substrate is *pre-causal* and *pre-normative* at the level of assertion — meaning it makes no causal or normative commitments, while remaining free to represent such claims as reified, attributed, provenance-bearing content.

The remainder proceeds as follows. Section 2 situates the contribution relative to prior work. Section 3 defines the formal requirements. Section 4 establishes the central result. Section 5 discusses implications for ontology design.

---

## 2. Related Work

The constraints developed here intersect with upper ontologies, legal and institutional ontologies, causal modeling, and the philosophy of information. This section states debts and departures briefly.

**Upper ontologies.** The Basic Formal Ontology (BFO) (ISO/IEC 2021; Arp et al. 2015) and the Descriptive Ontology for Linguistic and Cognitive Engineering (DOLCE) (Borgo et al. 2022a) provide domain-independent upper-level categories. Both have been widely adopted in biomedical, engineering, and information systems contexts. The present work does not propose an alternative to these frameworks. It identifies the assertion-level boundary that any foundational ontology must respect to function as a neutral substrate. BFO and DOLCE may serve as categorical scaffolding for a neutral substrate, provided causal and normative commitments are externalized to interpretive layers. Recent work on formal alignment between BFO and DOLCE (Masolo et al. 2025) reinforces the feasibility of neutral substrates that support multiple interpretive frameworks. Guarino's analysis of ontological commitment (Guarino et al. 2009) clarifies what it means for an ontology to assert something; the present contribution identifies which such assertions are incompatible with neutrality.

**Legal ontologies.** The Legal Knowledge Interchange Format (LKIF) (Hoekstra et al. 2007) and related frameworks embed deontic categories — obligation, permission, prohibition — as core primitives. Such frameworks are appropriate as interpretive layers atop a neutral substrate, but cannot themselves serve as the substrate when neutrality across incompatible legal or normative interpretations is required, because embedding deontic conclusions as substrate-layer facts commits the ontology to a particular normative stance.

**Causal modeling.** Pearl's structural causal modeling framework (Pearl 2009) and related interventionist semantics (Woodward 2003; Spirtes et al. 2000) make explicit causal commitments that are inherently model-dependent. Different causal models, each internally consistent, may disagree about which relations are causal. The present work observes that causal conclusions are framework-dependent in the same structural sense as normative conclusions. Causal reasoning belongs to interpretive layers where model assumptions are explicit and contestable.

**Philosophy of information.** Floridi's Method of Levels of Abstraction (Floridi 2008, 2011) provides a methodological precursor: the distinction between the observables made available for representation and the architectural hierarchy of layers within a system. The present work instantiates this distinction for the specific purpose of ontological neutrality, proving that the assertion vocabulary of a neutral substrate must be restricted to referential predicates.

**Reasonable pluralism.** The premise that disagreement is structural rather than resolvable draws on Rawls' concept of reasonable pluralism (Rawls 1993): under conditions of free inquiry, reasonable agents arrive at incompatible comprehensive doctrines. The central result formalizes structural accommodation of this pluralism as a constraint on substrate-layer assertion.

---

## 3. Formal Requirements for Ontological Neutrality

This section defines the formal requirements governing a neutral substrate. All entailment (⊢) is with respect to classical first-order logic with equality. All requirements are analytic consequences of the role-relative definition of neutrality, not general design prescriptions.

**Conceptual architecture.** A neutral substrate provides shared referents and framework-invariant referential structure. Interpretive frameworks reason over that structure using their own rules, assumptions, methods, or norms. The conclusions produced by those frameworks may disagree without requiring revision of the substrate.

```
Interpretive Frameworks
(Causal and normative reasoning; competing conclusions)
         ↕  extends, does not revise
     Neutral Substrate
(Framework-invariant referential structure:
 individuation, co-reference, persistence)
```

Neutrality, as used here, is not moral neutrality, political impartiality, or epistemic skepticism. It is a role-relative structural property: a substrate is neutral if it satisfies two requirements — **interpretive non-commitment** and **extension stability** — defined below.

### 3.1 Substrate-Layer Commitment

**Definition 3.1 (Substrate-Layer Commitment).** A substrate S *commits to* a proposition p when S ⊢ p — that is, when p is asserted by the substrate independently of any particular interpretive framework. A *causal or normative commitment* is a substrate-layer commitment whose content is a causal relation or normative proposition. Such commitments do not include the representation of causal or normative propositions as attributed, provenance-bearing, reified assertions.

A proposition is *substrate-asserted* if it is a causal or normative commitment in the sense of Definition 3.1. The neutrality constraints throughout this paper concern substrate-asserted propositions. Causal and normative vocabulary may appear as the opaque content of reified assertions without producing a substrate-asserted proposition.

### 3.2 Referential Regimes

A neutral substrate is not empty. It must provide stable reference to the entities, occurrences, and institutional artifacts about which interpretive frameworks reason.

**Definition 3.2 (Referential Regime).** A *referential regime* is the set of conditions under which a substrate (i) individuates an entity or occurrence, (ii) determines when two references co-refer to the same entity or occurrence, and (iii) tracks that entity or occurrence across time, records, jurisdictions, or interpretive contexts. A referential regime therefore comprises three components: *individuation*, *co-reference*, and *persistence*.

The substrate may fix a referential regime for an occurrence without asserting why the occurrence happened, whether it caused another occurrence, whether an actor was responsible, or whether it constituted a violation. Those latter claims belong to interpretive frameworks.

Neutrality presupposes referential invariance: the relevant referential regimes must be fixable at the substrate layer and must not themselves be contested across the admissible frameworks under consideration. Where individuation, co-reference, or persistence is itself contested, neutrality in the sense defined here is unavailable until that contestation is resolved or scoped out.

### 3.3 Admissible Frameworks

**Definition 3.3 (Admissible Framework).** A framework F is *admissible* if it is internally consistent (F ⊬ ⊥) and represents a legitimate interpretive stance within the domain of application. The set of all admissible frameworks is denoted **F**. Admissible frameworks need not be mutually compatible.

Admissibility is a domain-governance parameter, not a property determined by the substrate. The substrate does not adjudicate among admissible frameworks; it provides a shared referential base over which they may reason, including when they reach incompatible conclusions.

### 3.4 Framework-Variant Propositions

**Definition 3.4 (Framework-Variant Proposition).** A proposition p is *framework-variant* if there exist admissible frameworks F₁, F₂ ∈ **F** such that S ∪ F₁ ⊢ p and S ∪ F₂ ⊢ ¬p.

Framework-variant propositions include, in the domains considered here, causal and normative conclusions whose truth conditions depend on legal standards, causal models, institutional rules, or other interpretive commitments.

**Assumption 3.5 (Contestability of Causal and Normative Propositions).** In the domains to which the neutrality requirements are applied, causal and normative propositions are contestable across admissible frameworks. In particular, if a substrate S asserts a causal or normative proposition p as a substrate-layer commitment, then there exists an admissible framework F ∈ **F** such that S ∪ F ⊢ ¬p.

This assumption does not claim that causation is unreal or that normative judgment is arbitrary. It states that, in the class of domains addressed here, causal and normative conclusions are not guaranteed to remain invariant across admissible interpretive frameworks.

### 3.5 Interpretive Non-Commitment

**Definition 3.6 (Interpretive Non-Commitment).** A substrate ontology S satisfies *interpretive non-commitment* if it does not assert any framework-variant proposition: there is no proposition p such that S ⊢ p and p is framework-variant with respect to **F**.

If a substrate asserts that an action was obligatory, forbidden, permitted, compliant, or violative, it commits to a particular normative framework. If it asserts that one event caused another, it commits to a particular causal model. In both cases, asserting such conclusions as substrate-layer commitments violates interpretive non-commitment. Causal and normative claims may be represented as attributed, provenance-bearing claims, but their truth is evaluated only within interpretive frameworks layered above the substrate.

### 3.6 Extension Stability

**Definition 3.7 (Extension Stability).** A substrate ontology S satisfies *extension stability* if for all admissible frameworks F ∈ **F**, S ∪ F ⊬ ⊥.

Extension stability is pairwise: each admissible framework must be separately consistent with the substrate. It does not require all admissible frameworks to be mutually consistent with one another. A violation occurs when accommodating an admissible framework requires modification of the substrate itself.

---

## 4. The Ontological Neutrality Theorem

### 4.1 Framework-Contestability Lemma

The central arguments share a common logical structure.

**Lemma 4.1 (Framework-Contestability Lemma).** Let S be a substrate ontology intended to satisfy the neutrality requirements, and let p be a framework-variant proposition with respect to **F**. If S commits to p, then S violates both interpretive non-commitment and extension stability.

*Proof.* Since p is framework-variant, there exist admissible frameworks F₁, F₂ ∈ **F** such that S ∪ F₁ ⊢ p and S ∪ F₂ ⊢ ¬p.

Since S commits to p, Definition 3.1 gives S ⊢ p. Thus S asserts a framework-variant proposition, violating interpretive non-commitment (Definition 3.6).

Moreover, because S ⊢ p, every extension of S preserves p. In particular, S ∪ F₂ ⊢ p. But by framework-variance, S ∪ F₂ ⊢ ¬p. Hence S ∪ F₂ ⊢ ⊥, violating extension stability (Definition 3.7). □

### 4.2 Normative Commitments

Normative conclusions are framework-dependent in the sense of Lemma 4.1. Their truth conditions depend on legal regimes, institutional authorities, temporal scope, and interpretive stance. By Assumption 3.5, if S commits to a normative proposition n, there exists F ∈ **F** such that S ∪ F ⊢ ¬n. Since S ⊢ n, the proposition is framework-variant. By Lemma 4.1, S violates both neutrality requirements.

Normative judgment belongs to interpretive frameworks. A substrate that asserts an action was permitted, prohibited, obligatory, compliant, noncompliant, or violative embeds a framework-dependent conclusion as a substrate-layer fact. Any admissible framework that rejects that conclusion cannot be layered atop the substrate without contradiction or substrate revision.

### 4.3 Causal Commitments

Causal attributions are likewise framework-dependent. Claims such as Caused(e₁, e₂) depend on background assumptions about causal mechanisms, variable selection, counterfactual reasoning, temporal scope, and model boundaries. By Assumption 3.5, if S commits to a causal proposition c, there exists F ∈ **F** such that S ∪ F ⊢ ¬c. By Lemma 4.1, S violates both neutrality requirements.

Pre-causal does not mean acausal. The substrate does not deny that causation exists or that causal reasoning is necessary. It refrains from embedding causal conclusions as foundational commitments. Causation is externalized to interpretive layers where model assumptions are explicit, attributed, and contestable.

### 4.4 Example: Incident Investigation

The following example illustrates the distinction between substrate-layer referential structure, framework-level conclusions, and reified assertions about claims.

**Example 4.2 (Interpretive Disagreement in Incident Investigation).** Consider a substrate S representing a workplace incident. The substrate asserts only framework-invariant referential structure:

- Agent(a): a is an agent
- Occurrence(e₁), Occurrence(e₂): e₁ and e₂ are occurrences
- Participant(a, e₁): a participated in e₁
- Before(e₁, e₂): e₁ preceded e₂
- Referential-regime assertions fixing individuation, co-reference, and persistence for a, e₁, and e₂

The substrate does not assert Caused(e₁, e₂), Responsible(a, e₂), or any normative conclusion about whether a violated an obligation.

Two admissible frameworks extend S:

- F₁ (engineering analysis): applies a mechanistic causal model and derives Caused(e₁, e₂) and Responsible(a, e₂).
- F₂ (legal framework): applies jurisdiction-specific standards and derives ¬Responsible(a, e₂).

F₁ and F₂ are mutually inconsistent: F₁ ∪ F₂ ⊢ ⊥. However, each is separately consistent with the substrate: S ∪ F₁ ⊬ ⊥ and S ∪ F₂ ⊬ ⊥. The substrate remains neutral because it provides a stable referential base without asserting either framework's conclusion as a substrate-layer fact.

**Violation case.** If S asserts Responsible(a, e₂) as a substrate-layer fact, then S ∪ F₂ entails both Responsible(a, e₂) and ¬Responsible(a, e₂), so S ∪ F₂ ⊢ ⊥. The substrate violates extension stability. The failure is not that responsibility is irrelevant; it is that the substrate asserted a framework-level conclusion as a substrate-layer fact.

**Reification case.** If S neither asserts nor denies Caused(e₁, e₂) or Responsible(a, e₂), but instead represents the engineering framework's conclusions as reified assertions:

- Asserts(F₁, Caused(e₁, e₂))
- Asserts(F₁, Responsible(a, e₂))

these are substrate-layer facts about the *existence, source, and attribution* of claims, not substrate-layer commitments to the *truth* of those claims. Both F₁ and F₂ can be layered atop S without contradiction. The substrate records discourse about the world without asserting contested conclusions about the world.

**Reification constraint.** Reification preserves interpretive non-commitment only if the substrate refrains from simultaneously asserting the reified content as a substrate-layer truth. If a causal or normative relation is asserted as a substrate-layer fact and also represented as a reified claim, neutrality is already lost. The reified representation does not cure the substrate-layer assertion.

### 4.5 The Ontological Neutrality Theorem

**Theorem 4.3 (Ontological Neutrality Theorem).** Let S be a substrate ontology intended to function as a neutral substrate across admissible interpretive frameworks, and let **F** be the set of all admissible frameworks. Suppose the domain satisfies the contestability assumption for causal and normative propositions (Assumption 3.5) and the referential-invariance scope condition that the substrate's framework-invariant referential structure, including its referential regime, is not contested across the admissible frameworks under consideration. Then S satisfies the neutrality requirements of interpretive non-commitment and extension stability if and only if its foundational layer is restricted to framework-invariant referential structure and does not assert causal or normative conclusions as substrate-layer facts.

*Proof.*

**Necessity.** Suppose S satisfies the neutrality requirements. Assume for contradiction that S commits to a causal or normative proposition p, so S ⊢ p. By Assumption 3.5, there exists F ∈ **F** such that S ∪ F ⊢ ¬p. Since S ⊢ p, it follows that S ∪ F ⊢ p. Therefore S ∪ F ⊢ p ∧ ¬p, so S ∪ F ⊢ ⊥, contradicting extension stability. Moreover, because p is rejected by an admissible framework while asserted by the substrate, p is framework-variant, so asserting it also violates interpretive non-commitment. Therefore no neutral substrate may make causal or normative commitments.

It remains to identify what may remain in the foundational layer. By the referential-invariance scope condition, the substrate may assert framework-invariant referential structure: the referential regimes by which entities, occurrences, and institutional artifacts are individuated, co-referred, and tracked across time, together with structural relations that assert neither causal efficacy nor normative force. Under the stated scope condition, a neutral substrate's foundational layer must be restricted to this framework-invariant referential structure.

**Sufficiency.** Suppose S is restricted at the foundational layer to framework-invariant referential structure and makes no causal or normative commitments. Let F ∈ **F** be any admissible framework. Because the assertions of S are, by hypothesis, framework-invariant referential assertions, and because the framework-invariant referential structure S asserts — including its referential regime — is, by the scope condition, not contested across admissible frameworks, no assertion of S is contradicted by F. Therefore S ∪ F ⊬ ⊥. Since F was arbitrary, S satisfies extension stability.

It remains to show interpretive non-commitment. Since S asserts only framework-invariant referential structure, there is no proposition p such that S ⊢ p and p is framework-variant with respect to **F**. Causal and normative propositions may appear only as reified, attributed, provenance-bearing content: the substrate may assert that a framework made a claim; it does not assert the claim's truth. Thus S satisfies interpretive non-commitment. □

**Scope note.** The sufficiency direction depends on the referential-invariance scope condition. If admissible frameworks disagree about individuation, co-reference, or persistence — whether two records denote the same entity, whether an occurrence is one event or many, whether an institutional artifact persists across legal change — then the substrate cannot be neutral with respect to those frameworks until the referential contestation is resolved or scoped out. The theorem applies to domains in which the substrate's framework-invariant referential structure, including its referential regime, can be fixed prior to interpretive extension. It does not claim that all domains admit neutral substrates.

---

## 5. Implications for Ontology Design

The theorem constrains the design space of any ontology intended to function as a neutral substrate. This section states those constraints in terms of what the substrate must exclude, what it must provide, and how interpretation is accommodated without loss of accountability.

### 5.1 Substrate Exclusions

A neutral substrate must exclude, at the foundational layer, all substrate-asserted causal and normative propositions.

*Normative exclusions* include substrate-layer assertions that an action, event, actor, institution, or artifact was permitted, prohibited, obligatory, compliant, noncompliant, justified, violative, blameworthy, liable, or responsible in a framework-dependent sense.

*Causal exclusions* include substrate-layer assertions that one event caused, produced, prevented, enabled, or explains another — wherever such assertions presuppose causal models, counterfactual assumptions, or evidentiary thresholds that may vary across admissible frameworks.

The exclusion applies to asserted conclusions, not to the referents about which such conclusions are made. Actors, occurrences, institutional artifacts, jurisdictions, records, and provenance metadata may all be represented without committing to how they are causally explained or normatively evaluated.

### 5.2 Substrate Requirements

A neutral substrate must make strong commitments in areas that are invariant across the admissible frameworks under consideration. It must provide:

- stable reference to entities, occurrences, and institutional artifacts participating in accountability relationships;
- explicit referential regimes specifying individuation, co-reference, and persistence conditions for those referents;
- provenance and attribution structures sufficient to record claims, reports, sources, documents, and interpretive contexts;
- structural relations — temporal ordering, participation, containment, jurisdictional association, document linkage, record membership — insofar as these assert neither causal efficacy nor normative force.

These commitments are not optional. Accountability depends on the ability to refer stably to who acted, what occurred, which institutional instruments existed, and within what jurisdictional scope. Such commitments do not vary with interpretive stance in the way causal or normative conclusions do.

### 5.3 Permitted and Excluded Relations

Permitted substrate-layer relations include temporal ordering, participation, containment, provenance, attribution, jurisdictional association, and co-reference relations belonging to the fixed referential regime.

Excluded as substrate-layer assertions: Caused(e₁, e₂), Responsible(a, e), Violated(a, r), Compliant(s, r), Obligated(a, α). Such predicates may appear as the opaque content of reified assertions — for example, Asserts(F, Caused(e₁, e₂)) — asserting that a framework made the causal claim without asserting the claim's truth.

The neutrality boundary is drawn not at the presence of structure, nor at the syntactic occurrence of causal or normative vocabulary, but at the embedding of framework-dependent conclusions as foundational ontological facts.

### 5.4 Externalizing Interpretation

Excluding causal and normative commitments from the substrate does not weaken accountability. It preserves accountability under disagreement by allowing competing explanations and evaluations to coexist over a stable shared referential base.

The system is organized into distinct layers. The foundational layer records the referential ground: entities, occurrences, institutional artifacts, referential regimes, records, claims, attribution, and provenance. Higher-order layers record interpretation: causal explanations, legal classifications, normative evaluations, responsibility assignments, compliance judgments. An interpretive framework layered above the substrate may expand the signature by defining causal, normative, legal, or evaluative predicates over the referents established by the foundational layer. This expansion constitutes a conservative extension: it must not mutate, retract, or contradict foundational assertions.

This directional dependence guarantees that changes or conflicts within higher-level interpretive logic do not propagate downward to destabilize the substrate. The substrate remains a stable point of reference; interpretive frameworks supply competing explanations and evaluations.

A neutral substrate does not function as a truth oracle. It guarantees something narrower and more durable: that claims, sources, provenance, and referents are faithfully recorded and stably available for evaluation by admissible frameworks. Truth-evaluation is externalized, not abandoned.

---

## 6. Conclusion

This paper has established a biconditional structural constraint on ontologies intended to function as neutral substrates under persistent interpretive disagreement. Under the neutrality requirements of interpretive non-commitment and extension stability, under the contestability assumption for causal and normative propositions, and under the referential-invariance scope condition, a substrate ontology satisfies neutrality if and only if its foundational layer is restricted to framework-invariant referential structure and does not assert causal or normative conclusions as substrate-layer facts.

A neutral substrate is not empty. It must assert enough structure to support accountability: entities, occurrences, institutional artifacts, referential regimes, provenance, attribution, and other framework-invariant structural relations. In particular, it must provide the referential regimes by which relevant referents are individuated, co-referred, and tracked across time, records, jurisdictions, or interpretive contexts.

At the same time, the substrate must not assert causal or normative conclusions as foundational facts. Such claims belong to interpretive frameworks and may be represented by the substrate only as reified, attributed, provenance-bearing assertions whose truth is evaluated within interpretive layers. The exclusion is at the level of assertion, not vocabulary.

Neutrality is not global. A substrate is not neutral with respect to the referential regimes it asserts; it must take substantive positions on individuation, co-reference, and persistence where those positions are required for stable accountability. If admissible frameworks disagree about those referential conditions, neutrality in the sense defined here is unavailable until the referential contestation is resolved or scoped out.

The practical implication is that neutral substrates should be designed as pre-causal and pre-normative foundations. Pre-causal does not mean acausal; pre-normative does not mean normatively irrelevant. Both terms mean prior to attribution: the substrate represents entities, occurrences, provenance, and framework-invariant structure without asserting causal or normative conclusions as true. Such conclusions are externalized to interpretive layers where their assumptions are explicit, attributed, contestable, and revisable.

The contribution is a structural constraint on any ontology intended to function as a neutral substrate in accountability contexts. Where persistent interpretive disagreement is expected and the substrate must remain stable across admissible frameworks, causal and normative conclusions cannot be asserted as substrate-layer facts. They must be externalized as framework-level conclusions or represented as reified claims with provenance. Ontological neutrality is not a lack of commitments. It is a disciplined allocation of commitments across layers: the substrate commits to stable reference; frameworks commit to interpretation; accountability is preserved by giving disagreement a stable shared object over which it can be expressed, evaluated, and contested.

---

## Acknowledgements

Portions of this work were developed using computer-assisted tools during manuscript preparation. Generative language models were used to assist with editing, formatting, and consistency checking. All conceptual framing, formal development, results, interpretations, and conclusions are the author's own. The author reviewed all suggestions and takes full responsibility for the content of this work.

---

## Statements and Declarations

**Author Contributions.** The author was solely responsible for the conception, analysis, and writing of this manuscript.

**Declaration of Conflicting Interest.** The author declares no potential conflicts of interest with respect to the research, authorship, and/or publication of this article.

---

## References

Arp, R., Smith, B., and Spear, A. D. (2015). *Building Ontologies with Basic Formal Ontology*. MIT Press.

Borgo, S., Ferrario, R., Gangemi, A., Guarino, N., Masolo, C., Porello, D., Sanfilippo, E. M., and Vieu, L. (2022a). DOLCE: A descriptive ontology for linguistic and cognitive engineering. *Applied Ontology*, 17(1), 45–69.

Borgo, S., Galton, A., and Kutz, O. (2022b). Foundational ontologies in action. *Applied Ontology*, 17(1), 1–16.

Bovens, M. (2007). Analysing and assessing accountability: A conceptual framework. *European Law Journal*, 13(4), 447–468.

Bowker, G. C. and Star, S. L. (1999). *Sorting Things Out: Classification and Its Consequences*. MIT Press.

Dworkin, R. (1986). *Law's Empire*. Harvard University Press.

Floridi, L. (2008). The method of levels of abstraction. *Minds and Machines*, 18(3), 303–329.

Floridi, L. (2011). *The Philosophy of Information*. Oxford University Press.

Gruber, T. R. (1993). A translation approach to portable ontology specifications. *Knowledge Acquisition*, 5(2), 199–220.

Guarino, N., Oberle, D., and Staab, S. (2009). What is an ontology? In *Handbook on Ontologies*, pp. 1–17. Springer.

Hart, H. L. A. (1961). *The Concept of Law*. Oxford University Press.

Hoekstra, R., Breuker, J., Di Bello, M., and Boer, A. (2007). The LKIF core ontology of basic legal concepts. In *Proceedings of the Workshop on Legal Ontologies and Artificial Intelligence Techniques*.

Hood, C. (2011). *The Blame Game: Spin, Bureaucracy, and Self-Preservation in Government*. Princeton University Press.

ISO/IEC (2021). *Information Technology — Top-Level Ontologies (TLO) — Part 2: Basic Formal Ontology (BFO)*.

Joachimiak, M. P. et al. (2025). The artificial intelligence ontology: LLM-assisted construction of AI concept hierarchies. *Applied Ontology*. First published online March 2, 2025.

Köhler, N. and Neuhaus, F. (2025). The mercurial top-level ontology of large language models. *Applied Ontology*, 20(1), 5–15.

Masolo, C., Compagno, F., and Borgo, S. (2025). On the formal alignment of foundational ontologies: Building mappings between BFO and DOLCE. *Applied Ontology*, 20.

Neuhaus, F. and Hastings, J. (2022). Ontology development is consensus creation, not (merely) representation. *Applied Ontology*. arXiv:2210.12026.

Pearl, J. (2009). *Causality: Models, Reasoning, and Inference* (2nd ed.). Cambridge University Press.

Rawls, J. (1993). *Political Liberalism*. Columbia University Press.

Smith, B. and Ceusters, W. (2010). Ontology as realist representation. *Applied Ontology*, 5(2), 139–188.

Spirtes, P., Glymour, C., and Scheines, R. (2000). *Causation, Prediction, and Search* (2nd ed.). MIT Press.

Woodward, J. (2003). *Making Things Happen: A Theory of Causal Explanation*. Oxford University Press.
