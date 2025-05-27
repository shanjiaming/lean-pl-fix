theorem h1₄ (f : ℝ → ℝ) (hf : Continuous f) (h_max : IsMaxOn (fun f => ∫ (x : ℝ) in Set.Icc 0 1, x ^ 2 * f x - x * f x ^ 2) {f | Continuous f} f) (h1₁ :  ∫ (x : ℝ) in Set.Icc 0 1, x ^ 2 * f x - x * f x ^ 2 =    (∫ (x : ℝ) in Set.Icc 0 1, x ^ 3 / 4) - ∫ (x : ℝ) in Set.Icc 0 1, x * (f x - x / 2) ^ 2) : ∫ (x : ℝ) in Set.Icc 0 1, x * (f x - x / 2) ^ 2 ≥ 0 :=
  by
  have h1₅ : (fun x : ℝ => (x * (f x - x / 2 : ℝ) ^ 2 : ℝ)) ≥ 0 := by sorry
  have h1₆ : (∫ x in Set.Icc 0 1, (x * (f x - x / 2 : ℝ) ^ 2 : ℝ)) ≥ 0 := by sorry
  --  exact h1₆
  hole