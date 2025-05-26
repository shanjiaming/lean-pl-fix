import Mathlib

/-
Let $f: D \to \mathbb{R}$ be a function and $X \subseteq D$. If there exists a constant $M > 0$ such that $|f(x)| \leq M$ for all $x \in X$, then $f$ is bounded on $X$.
-/

variable {D : Type*} {f : D → ℝ} {X : Set D}

def BoundedOn (f : D → ℝ) (X : Set D) : Prop :=
  BddAbove (f '' X) ∧ BddBelow (f '' X)