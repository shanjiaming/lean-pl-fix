theorem h₃ (x y : ℕ) (h₀ : 0 < x ∧ 0 < y) (h₁ : 5 * x = y) (h₂ : ↑x - 3 + (↑y - 3) = 30) : ↑x + ↑y = 36 :=
  by
  have h₃₁ : (x : ℤ) - (3 : ℤ) + ((y : ℤ) - (3 : ℤ)) = 30 := by sorry
  have h₃₂ : (x : ℤ) + (y : ℤ) - 6 = 30 := by sorry
  have h₃₃ : (x : ℤ) + (y : ℤ) = 36 := by sorry
  --  exact_mod_cast h₃₃
  hole