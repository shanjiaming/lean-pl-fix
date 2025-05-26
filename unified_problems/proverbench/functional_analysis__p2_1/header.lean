import Mathlib

/-
Let $\{b_n\}$ be a sequence of positive real numbers converging to $\frac{1}{2}$. Then the series $\sum_{n=1}^{\infty} \frac{b_n^n \cos n \pi}{n}$ is absolutely convergent.
-/

open Real BigOperators Filter Topology

variable (b : ℕ → ℝ)

-- Use standard Mathlib definition for sequence convergence
def sequence_converges (a : ℕ → ℝ) (L : ℝ) : Prop :=
  Tendsto a atTop (nhds L)