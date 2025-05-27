theorem h₄ (P : ℝ[X]) (hDegree : P.degree ≤ 5) (h : (∀ (x : ℝ), eval x (P %ₘ (X - 1) ^ 3) = -1) ∧ ∀ (x : ℝ), eval x (P %ₘ (X + 1) ^ 3) = 1) (h₁ : P %ₘ (X - 1) ^ 3 = -1) (h₂ : P %ₘ (X + 1) ^ 3 = 1) (h₃ : False) : P = -C (3 / 8) * X ^ 5 + C (5 / 4) * X ^ 3 - C (15 / 8) * X :=
  by
  --  exfalso
  --  exact h₃
  norm_cast