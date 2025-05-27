import Mathlib

/-
For vectors $\mathbf{x}, \mathbf{y} \in \mathbb{R}^k$, the equality $\|\mathbf{x} + \mathbf{y}\| = \|\mathbf{x}\| + \|\mathbf{y}\|$
does not hold in general, where $\|\cdot\|$ denotes the Euclidean norm.
-/

open InnerProductSpace

variable {k : ℕ} (x y : EuclideanSpace ℝ (Fin k))

-- Counterexample to show that the equality does not always hold