theorem general_solution_quadratic_equation (x y u : ℤ) (n : ℕ) : x ^ 2 + y ^ 2 - 1 = 4 * x * y → (↑x : ℝ) + (↑u : ℝ) * √3 = (2 + √3) ^ n :=
  by
  --  intro h₀
  have h₁ : False := by sorry
  have h₂ : x + u * Real.sqrt 3 = (2 + Real.sqrt 3) ^ n := by sorry
  --  exact h₂
  hole