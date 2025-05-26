theorem h1₁ (h_max : IsMaxOn (fun f => ∫ (x : ℕ) in Set.Icc 0 1, x ^ 2 * f x - x * f x ^ 2) {f | Continuous f} sorry) : ∫ (x : ℝ) in Set.Icc 0 1, x ^ 2 * sorry - x * sorry ^ 2 =
    (∫ (x : ℝ) in Set.Icc 0 1, x ^ 3 / 4) - ∫ (x : ℝ) in Set.Icc 0 1, x * (sorry - x / 2) ^ 2 :=
  by
  have h1₂ :
    (fun x : ℝ => (x ^ 2 * f x - x * f x ^ 2 : ℝ)) = (fun x : ℝ => (x ^ 3 / 4 : ℝ) - x * (f x - x / 2 : ℝ) ^ 2) := by sorry
  --  rw [h1₂]
  have h1₃ :
    (∫ x in Set.Icc 0 1, (x ^ 3 / 4 : ℝ) - x * (f x - x / 2 : ℝ) ^ 2) =
      (∫ x in Set.Icc 0 1, (x ^ 3 / 4 : ℝ)) - ∫ x in Set.Icc 0 1, (x * (f x - x / 2 : ℝ) ^ 2 : ℝ) := by sorry
  rw [h1₃] <;>
      (try {
          apply Continuous.integrableOn_Icc
          continuity
        }) <;>
    (try {
        apply Continuous.integrableOn_Icc
        continuity
      })
  hole