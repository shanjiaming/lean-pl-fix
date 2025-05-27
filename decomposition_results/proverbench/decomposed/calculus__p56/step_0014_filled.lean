theorem h₁₀ (f : ℝ → ℝ) (hf : Continuous f) (h_max : IsMaxOn (fun f => ∫ (x : ℝ) in Set.Icc 0 1, x ^ 2 * f x - x * f x ^ 2) {f | Continuous f} f) (h1₁ :  ∫ (x : ℝ) in Set.Icc 0 1, x ^ 2 * f x - x * f x ^ 2 =    (∫ (x : ℝ) in Set.Icc 0 1, x ^ 3 / 4) - ∫ (x : ℝ) in Set.Icc 0 1, x * (f x - x / 2) ^ 2) (x : ℝ) (h1₇ : (f x - x / 2) ^ 2 ≥ 0) (h1₈ : x ≥ 0 → x * (f x - x / 2) ^ 2 ≥ 0) (h1₉ : x ≤ 1 → x ≥ 0 → x * (f x - x / 2) ^ 2 ≥ 0) (hx : ¬x ≥ 0) (hx' : x ≤ 0) : x ∈ Set.Icc 0 1 → x * (f x - x / 2) ^ 2 ≥ 0 :=
  by
  --  intro h
  --  simp only [Set.mem_Icc] at h
  have h₁₁ : 0 ≤ x := by sorry
  have h₁₂ : x ≤ 1 := by sorry
  --  nlinarith
  linarith