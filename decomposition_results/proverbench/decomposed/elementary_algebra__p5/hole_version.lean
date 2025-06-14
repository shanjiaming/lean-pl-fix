macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem coefficient_of_X4_in_polynomial_expansion :
  coeff ((∑ i in Finset.range 101, X ^ i) ^ 3) 4 = 15 := by
  have h₁ : (∑ i in Finset.range 101, (X : Polynomial ℕ) ^ i) = ∑ i in Finset.range 101, X ^ i := by hole_2
  have h₂ : coeff ((∑ i in Finset.range 101, (X : Polynomial ℕ) ^ i) ^ 3) 4 = 15 := by
    hole_3
  hole_1