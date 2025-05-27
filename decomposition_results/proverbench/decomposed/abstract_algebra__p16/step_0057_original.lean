theorem h₃ (P : ℝ[X]) (h : ∀ (x : ℝ), eval x P ^ 2 - 1 = 4 * eval (x ^ 2 - 4 * x + 1) P) (h_constant h₁ : P.degree ≤ 0) (c : ℝ) (hc : P = C c) : ∀ (x : ℝ), eval x P = c := by
  intro x
  rw [hc]
  simp [Polynomial.eval_C]