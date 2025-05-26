theorem polynomial_parity_evaluation  : (sorry % 2 = 0 → sorry = 1) ∧ (sorry % 2 ≠ 0 → sorry = 0) :=
  by
  have h₁ : False := by sorry
  have h₂ : (n % 2 = 0 → P.eval ((n + 1) : ℤ) = 1) ∧ (n % 2 ≠ 0 → P.eval ((n + 1) : ℤ) = 0) := by sorry
  exact h₂