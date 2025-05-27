theorem h1₆ (f : ℝ → ℝ) (hf : Continuous f) (h_max : IsMaxOn (fun f => ∫ (x : ℝ) in Set.Icc 0 1, x ^ 2 * f x - x * f x ^ 2) {f | Continuous f} f) (h1₁ :  ∫ (x : ℝ) in Set.Icc 0 1, x ^ 2 * f x - x * f x ^ 2 =    (∫ (x : ℝ) in Set.Icc 0 1, x ^ 3 / 4) - ∫ (x : ℝ) in Set.Icc 0 1, x * (f x - x / 2) ^ 2) (h1₄ : ∫ (x : ℝ) in Set.Icc 0 1, x * (f x - x / 2) ^ 2 ≥ 0) (h1₅ : ∫ (x : ℝ) in Set.Icc 0 1, x ^ 3 / 4 = 1 / 16) : (∫ (x : ℝ) in Set.Icc 0 1, x ^ 3 / 4) - ∫ (x : ℝ) in Set.Icc 0 1, x * (f x - x / 2) ^ 2 ≤ 1 / 16 :=
  by
  --  rw [h1₅]
  --  linarith
  linarith