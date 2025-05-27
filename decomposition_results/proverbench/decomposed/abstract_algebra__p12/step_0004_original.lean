theorem h₃ (P : ℝ[X]) (hDegree : P.degree ≤ 5) (h : (∀ (x : ℝ), eval x (P %ₘ (X - 1) ^ 3) = -1) ∧ ∀ (x : ℝ), eval x (P %ₘ (X + 1) ^ 3) = 1) (h₂ : ∀ (x : ℝ), eval x (P %ₘ (X - 1) ^ 3) = -1) : P %ₘ (X - 1) ^ 3 = -1 :=
  by
  apply Polynomial.funext
  intro x
  rw [h₂ x] <;> simp