theorem simplify_expression  : sorry ^ 3 * sorry ^ 2 * sorry / (2 * sorry ^ 3) = 2 * sorry * sorry ^ 7 * sorry ^ 8 :=
  by
  have h₀ : (q ^ 3 * r ^ 2 * square_expression p q r) / (2 * p ^ 3) = (4 * p ^ 4 * q ^ 7 * r ^ 8) / (2 * p ^ 3) := by sorry
  have h₁ : (4 * p ^ 4 * q ^ 7 * r ^ 8) / (2 * p ^ 3) = 2 * p * q ^ 7 * r ^ 8 := by sorry
  have h₂ : (q ^ 3 * r ^ 2 * square_expression p q r) / (2 * p ^ 3) = 2 * p * q ^ 7 * r ^ 8 := by sorry
  --  exact h₂
  hole