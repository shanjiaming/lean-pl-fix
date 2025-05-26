theorem h1₂ (h_max : IsMaxOn (fun f => ∫ (x : ℕ) in Set.Icc 0 1, x ^ 2 * f x - x * f x ^ 2) {f | Continuous f} sorry) : (fun x => x ^ 2 * sorry - x * sorry ^ 2) = fun x => x ^ 3 / 4 - x * (sorry - x / 2) ^ 2 :=
  by
  funext x
  have h1₃ : x ^ 2 * f x - x * f x ^ 2 = x ^ 3 / 4 - x * (f x - x / 2) ^ 2 := by sorry
  rw [h1₃]