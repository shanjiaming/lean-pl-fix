import Mathlib

/-
Let $F$ be a field and $f(x) \in F[x]$ be a non-constant polynomial. Then there exists an extension field $E$ of $F$ and an element $\alpha \in E$ such that $f(\alpha) = 0$.
-/

open Polynomial

variable {F : Type*} [Field F]