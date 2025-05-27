theorem h2 (f : ℝ → ℝ) (hf : Continuous f) (h_max : IsMaxOn (fun f => ∫ (x : ℝ) in Set.Icc 0 1, x ^ 2 * f x - x * f x ^ 2) {f | Continuous f} f) (h1 : ∫ (x : ℝ) in Set.Icc 0 1, x ^ 2 * f x - x * f x ^ 2 ≤ 1 / 16) : ∫ (x : ℝ) in Set.Icc 0 1, x ^ 2 * f x - x * f x ^ 2 ≥ 1 / 16 :=
  by
  have h₂ : Continuous (fun x : ℝ => x / 2 : ℝ → ℝ) := by sorry
  have h₃ : (fun f : ℝ → ℝ => ∫ x in Set.Icc 0 1, (x ^ 2 * f x - x * f x ^ 2)) (fun x : ℝ => x / 2) = 1 / 16 := by sorry
  have h₄ : (∫ x in Set.Icc 0 1, (x ^ 2 * f x - x * f x ^ 2)) ≥ 1 / 16 := by sorry
  --  exact h₄
  linarith