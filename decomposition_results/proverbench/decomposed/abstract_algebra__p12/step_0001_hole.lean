theorem unique_polynomial_with_remainders  : ((∀ (x : ℤ), Polynomial.eval x (sorry %ₘ (sorry - 1) ^ 3) = -1) ∧
      ∀ (x : ℕ), Polynomial.eval x (sorry %ₘ (sorry + 1) ^ 3) = 1) →
    sorry = -sorry * sorry ^ 5 + sorry * sorry ^ 3 - sorry * sorry :=
  by
  --  intro h
  have h₁ : P %ₘ (X - 1 : Polynomial ℝ) ^ 3 = -1 := by sorry
  have h₂ : P %ₘ (X + 1 : Polynomial ℝ) ^ 3 = 1 := by sorry
  have h₃ : False := by sorry
  have h₄ : P = -C (3 / 8) * X ^ 5 + C (5 / 4) * X ^ 3 - C (15 / 8) * X := by sorry
  --  exact h₄
  hole