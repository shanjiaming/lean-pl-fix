theorem h₁ (h :  (∀ (x : ℤ), Polynomial.eval x (sorry %ₘ (sorry - 1) ^ 3) = -1) ∧    ∀ (x : ℕ), Polynomial.eval x (sorry %ₘ (sorry + 1) ^ 3) = 1) : sorry %ₘ (sorry - 1) ^ 3 = -1 :=
  by
  have h₂ : ∀ x : ℝ, (P %ₘ (X - 1 : Polynomial ℝ) ^ 3).eval x = -1 := by sorry
  have h₃ : P %ₘ (X - 1 : Polynomial ℝ) ^ 3 = -1 := by sorry
  --  exact h₃
  hole