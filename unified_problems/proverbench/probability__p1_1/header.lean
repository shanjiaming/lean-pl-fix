import Mathlib
/-
Let X be a random variable following a Poisson distribution with parameter λ. If P{X>0} = 1-e^(-1), then:
  (a) λ = 1
  (b) P{X ≤ 1} = 2e^(-1)
  (c) cov(X, X^2) = 3
-/
open Real MeasureTheory ProbabilityTheory

variable (lambda : NNReal)

noncomputable def poisson_pmf : ℕ → ℝ :=
 poissonPMFReal lambda