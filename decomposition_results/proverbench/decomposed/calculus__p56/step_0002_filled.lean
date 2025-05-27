theorem h1 (f : ℝ → ℝ) (hf : Continuous f) (h_max : IsMaxOn (fun f => ∫ (x : ℝ) in Set.Icc 0 1, x ^ 2 * f x - x * f x ^ 2) {f | Continuous f} f) : ∫ (x : ℝ) in Set.Icc 0 1, x ^ 2 * f x - x * f x ^ 2 ≤ 1 / 16 :=
  by
  have h1₁ :
    (∫ x in Set.Icc 0 1, (x ^ 2 * f x - x * f x ^ 2)) =
      (∫ x in Set.Icc 0 1, (x ^ 3 / 4 : ℝ)) - ∫ x in Set.Icc 0 1, (x * (f x - x / 2 : ℝ) ^ 2 : ℝ) := by sorry
  --  rw [h1₁]
  have h1₄ : (∫ x in Set.Icc 0 1, (x * (f x - x / 2 : ℝ) ^ 2 : ℝ)) ≥ 0 := by sorry
  have h1₅ : (∫ x in Set.Icc 0 1, (x ^ 3 / 4 : ℝ)) = 1 / 16 := by sorry
  have h1₆ : (∫ x in Set.Icc 0 1, (x ^ 3 / 4 : ℝ)) - ∫ x in Set.Icc 0 1, (x * (f x - x / 2 : ℝ) ^ 2 : ℝ) ≤ 1 / 16 := by sorry
  --  linarith
  linarith