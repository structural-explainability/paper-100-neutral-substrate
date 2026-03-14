# System Design Types

Ontology and representation systems may be designed under different assumptions about
how interpretation is shared across participants.
These assumptions determine where
structural constraints must operate.

The following types are organized by **increasing constraint on the representation
infrastructure**.

## Comparison

| Design Type             | Interpretive Assumption                    | Ontology Structure               | Constraint Location              | Design Objective                              |
| ----------------------- | ------------------------------------------ | -------------------------------- | -------------------------------- | --------------------------------------------- |
| Shared Interpretation   | Participants share a common ontology       | One ontology                     | Ontology structure               | Consistent conceptualization                  |
| Semantic Heterogeneity  | Multiple ontologies but alignment possible | Multiple ontologies              | Alignment / mediation mechanisms | Interoperability across heterogeneous systems |
| Persistent Disagreement | Ontologies cannot be reconciled            | Multiple incompatible ontologies | Representation substrate         | Interoperability without conceptual agreement |

## 1. Design for Shared Interpretation

### 1.1 Interpretive Assumption

All participants operate under a **common ontology or compatible conceptual model**.

### 1.2 Ontology Structure

One ontology (or strongly aligned ontologies).

### 1.3 Design Objective

Establish consistent conceptualization across systems or domains.

### 1.4 Constraint Location

Constraints operate on **ontology structure**.

### 1.5 Typical Constraints

- category hierarchy correctness
- logical consistency
- identity and persistence rules
- valid relations between categories

### 1.6 Examples

Upper ontology approaches (e.g., BFO, DOLCE).

## 2. Design for Semantic Heterogeneity

### 2.1 Interpretive Assumption

Participants use **different ontologies**, but these can be **aligned or translated**.

### 2.2 Ontology Structure

Multiple ontologies.

### 2.3 Design Objective

Enable interoperability across heterogeneous conceptual models.

### 2.4 Constraint Location

Constraints operate on **alignment and mediation mechanisms** between ontologies.

### 2.5 Typical Mechanisms

- ontology alignment
- schema mapping
- mediation layers
- shared vocabularies

### 2.6 Example Domains

Semantic web integration, data federation, enterprise data integration.

## 3. Design for Persistent Disagreement

### 3.1 Interpretive Assumption

Multiple interpretive frameworks remain **incompatible and cannot be reconciled**.

### 3.2 Ontology Structure

Multiple ontologies with **no reliable alignment**.

### 3.3 Design Objective

Enable interoperability **without requiring conceptual agreement**.

### 3.4 Constraint Location

Constraints operate at the **representation substrate**, prior to ontology design.

### 3.5 Constraint Type

Restrictions on **what the substrate may encode or assume**.

### 3.6 Structural Consequence

Interpretive commitments must be externalized to frameworks built on top of the substrate.

## Structural Comparison

Shared interpretation: representations / shared ontology / interpretation

Semantic heterogeneity: representations / multiple ontologies / alignment/mediation

Persistent disagreement: representations / neutral substrate / multiple interpretive frameworks

## Key Distinction

Traditional ontology frameworks regulate how agreement is structured.

Neutral substrate frameworks regulate how disagreement can coexist without structural collapse.
