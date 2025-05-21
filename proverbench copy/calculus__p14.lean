theorem integral_value_over_region (D : Set (Fin 3 → ℝ))
  (hD : D = {p : Fin 3 → ℝ | p 2 ≥ 0 ∧ p 3 ≥ 0 ∧ p 2 ≤ p 1 ∧ p 3 ≤ 4 - p 1^2 - p 2^2}) :
  let integrand := fun p : Fin 3 → ℝ => Real.exp (p 1^2 + p 2^2)
  ∫ p in D, integrand p = (Real.exp 4 - 5) * π / 8 :=