# Formal Verification in Lean 4 vs. Python Testing

## Overview

This repository contains two tasks introducing the fundamentals of **formal verification** using **Lean 4** and comparing it with traditional software testing in **Python**.

Traditional testing increases confidence by checking selected test cases, while formal verification provides mathematical proofs that a program satisfies its specification for **all valid inputs**.

---

## Repository Structure

```text
├── README.md
├── task-1-logic-proofs/
│   └── Logic.lean
└── task-2-case-study/
    ├── python_impl.py
    ├── LeanImpl.lean
    ├── CASE_STUDY.md
    └── test_logic_python.py
```

---

## Task 1 – Propositional Logic Proofs

The `task-1-logic-proofs` folder contains solutions to ten propositional logic theorems written in Lean 4.

The objective of this task is to become familiar with:

* Logical propositions
* Implication (`→`)
* Conjunction (`∧`)
* Disjunction (`∨`)
* Negation (`¬`)
* Constructing machine-checked mathematical proofs using Lean

All proofs compile successfully without using any `sorry` placeholders.

---

## Task 2 – Formal Verification Case Study

The `task-2-case-study` folder demonstrates a practical scenario where formal verification offers stronger correctness guarantees than traditional testing.

The case study includes:

* A Python implementation with automated tests.
* An equivalent implementation in Lean 4.
* A mathematical proof showing that the Lean implementation satisfies its specification for every valid input.
* A short discussion explaining why formal verification eliminates classes of bugs that testing alone cannot guarantee to detect.
* A pytest testing python file to test the implementation file
---

## Testing vs. Formal Verification

| Traditional Testing (Python)         | Formal Verification (Lean 4)             |
| ------------------------------------ | ---------------------------------------- |
| Checks selected test cases           | Proves correctness for all valid inputs  |
| May miss edge cases                  | Covers every possible valid case         |
| Bugs may remain undiscovered         | Correctness is mathematically guaranteed |
| Confidence increases with more tests | Confidence comes from formal proof       |

---

## Technologies Used

* Lean 4
* Python 3

---

## Learning Outcomes

Through this project I learned how to:

* Construct formal proofs in Lean 4.
* Translate logical reasoning into machine-checked proofs.
* Compare software testing with formal verification.
* Understand why mathematical proofs provide stronger correctness guarantees than runtime testing alone.

---
