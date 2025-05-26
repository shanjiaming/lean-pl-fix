theorem max_integral_value  : IsMaxOn (fun f => ∫ (x : ℕ) in Set.Icc 0 1, x ^ 2 * f x - x * f x ^ 2) {f | Continuous f} sorry →
    ∫ (x : ℕ) in Set.Icc 0 1, x ^ 2 * sorry - x * sorry ^ 2 = 1 / 16 :=
  by
  --  intro h_max
  have h1 : ∫ x in Set.Icc 0 1, (x ^ 2 * f x - x * f x ^ 2) ≤ 1 / 16 := by sorry
  have h2 : ∫ x in Set.Icc 0 1, (x ^ 2 * f x - x * f x ^ 2) ≥ 1 / 16 := by sorry
  have h3 : ∫ x in Set.Icc 0 1, (x ^ 2 * f x - x * f x ^ 2) = 1 / 16 := by sorry
  --  apply h3
  hole