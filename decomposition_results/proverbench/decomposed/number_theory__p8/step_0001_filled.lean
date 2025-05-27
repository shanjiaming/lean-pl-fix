theorem sum_of_squares_representation (x y z : ℕ) (h : x * y = z ^ 2 + 1) : ∃ a b c d, ↑x = a ^ 2 + b ^ 2 ∧ ↑y = c ^ 2 + d ^ 2 ∧ ↑z = a * c + b * d :=
  by
  have h₁ : x = 1 ∧ y = z ^ 2 + 1 ∨ x = z ^ 2 + 1 ∧ y = 1 ∨ ∃ (a b : ℤ), x = a ^ 2 + b ^ 2 ∧ y = 1 := by sorry
  have h₂ : ∃ (a b c d : ℤ), x = a ^ 2 + b ^ 2 ∧ y = c ^ 2 + d ^ 2 ∧ z = a * c + b * d := by sorry
  --  exact h₂
  hole