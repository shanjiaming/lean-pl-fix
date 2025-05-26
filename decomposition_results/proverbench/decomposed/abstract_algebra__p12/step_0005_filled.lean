theorem h₂ (h :  (∀ (x : ℤ), Polynomial.eval x (sorry %ₘ (sorry - 1) ^ 3) = -1) ∧    ∀ (x : ℕ), Polynomial.eval x (sorry %ₘ (sorry + 1) ^ 3) = 1) (h₁ : sorry %ₘ (sorry - 1) ^ 3 = -1) : sorry %ₘ (sorry + 1) ^ 3 = 1 :=
  by
  have h₃ : ∀ x : ℝ, (P %ₘ (X + 1 : Polynomial ℝ) ^ 3).eval x = 1 := by sorry
  have h₄ : P %ₘ (X + 1 : Polynomial ℝ) ^ 3 = 1 := by sorry
  --  exact h₄
  hole