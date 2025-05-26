import Mathlib

/-
Let $\{b_n\}$ be a sequence of positive real numbers converging to $\frac{1}{2}$. Then the series $\sum_{n=1}^{\infty} \frac{b_n^n \cos n \pi}{n}$ is absolutely convergent.
-/

open Real BigOperators Filter Topology

variable (b : ℕ → ℝ)

-- Use standard Mathlib definition for sequence convergence
def sequence_converges (a : ℕ → ℝ) (L : ℝ) : Prop :=
  Tendsto a atTop (nhds L)

/-- The series Σ(b_n^n * cos(nπ))/n is absolutely convergent when b_n converges to 1/2. -/
axiom series_convergence' {b : ℕ → ℝ} (h_pos : ∀ n, b n > 0)
  (h_lim : Tendsto b atTop (𝓝 (1/2))): Summable (fun n => |b n^n * cos (n * π) / n|)

-- Explicit statement about the series sum