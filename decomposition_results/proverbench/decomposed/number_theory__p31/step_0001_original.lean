theorem formal_statement (x y : ℤ) (hx : 2 < x) (hy : 2 < y) : ¬∃ z, x ^ 2 + 1 = z * (y ^ 2 - 5) :=
  by
  intro h
  rcases h with ⟨z, hz⟩
  have h₁ : y = 3 → False := by sorry
  have h₂ : y = 4 → False := by sorry
  have h₃ : y ≥ 5 → False := by sorry
  have h₄ : False := by sorry
  exact h₄