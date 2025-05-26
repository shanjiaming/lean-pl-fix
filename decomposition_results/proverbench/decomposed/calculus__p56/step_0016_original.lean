theorem h3 (h_max : IsMaxOn (fun f => ∫ (x : ℕ) in Set.Icc 0 1, x ^ 2 * f x - x * f x ^ 2) {f | Continuous f} sorry) : ∫ (x : ℕ) in Set.Icc 0 1, x ^ 2 * sorry - x * sorry ^ 2 = 1 / 16 :=
  by
  have h3 : ∫ x in Set.Icc 0 1, (x ^ 2 * f x - x * f x ^ 2) ≤ 1 / 16 := h1
  have h4 : ∫ x in Set.Icc 0 1, (x ^ 2 * f x - x * f x ^ 2) ≥ 1 / 16 := h2
  linarith