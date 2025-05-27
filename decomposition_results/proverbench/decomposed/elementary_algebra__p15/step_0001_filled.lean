theorem consecutive_cubes_difference_implies_square (n : ℕ) : (n + 1) ^ 3 - n ^ 3 = n ^ 2 → ∃ k, k ^ 2 = 2 * n - 1 :=
  by
  --  intro h
  have h₁ : n = 0 := by sorry
  have h₂ : False := by sorry
  have h₃ : ∃ k : ℕ, k ^ 2 = 2 * n - 1 := by sorry
  --  exact h₃
  norm_cast