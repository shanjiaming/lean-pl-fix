theorem h1₆ (f : ℝ → ℝ) (hf : Continuous f) (h_max : IsMaxOn (fun f => ∫ (x : ℝ) in Set.Icc 0 1, x ^ 2 * f x - x * f x ^ 2) {f | Continuous f} f) (h1₁ :  ∫ (x : ℝ) in Set.Icc 0 1, x ^ 2 * f x - x * f x ^ 2 =    (∫ (x : ℝ) in Set.Icc 0 1, x ^ 3 / 4) - ∫ (x : ℝ) in Set.Icc 0 1, x * (f x - x / 2) ^ 2) (x : ℝ) : x * (f x - x / 2) ^ 2 ≥ 0 :=
  by
  have h1₇ : (f x - x / 2 : ℝ) ^ 2 ≥ 0 := by sorry
  have h1₈ : x ≥ 0 → x * (f x - x / 2 : ℝ) ^ 2 ≥ 0 := by sorry
  have h1₉ : x ≤ 1 → x ≥ 0 → x * (f x - x / 2 : ℝ) ^ 2 ≥ 0 := by sorry
  --  by_cases hx : x ≥ 0
  --  · exact h1₈ hx
  ·
    have hx' : x ≤ 0 := by sorry
    have h₁₀ : x ∈ Set.Icc 0 1 → x * (f x - x / 2 : ℝ) ^ 2 ≥ 0 := by sorry
  --    by_cases h₁₁ : x ∈ Set.Icc 0 1
  --    · exact h₁₀ h₁₁
    ·
      have h₁₂ : x < 0 ∨ x > 1 := by sorry
  --      cases h₁₂ with
  --      | inl h₁₂ =>
  --        have h₁₃ : x < 0 := h₁₂
  --        have h₁₄ : x ∉ Set.Icc 0 1 := by
  --          intro h₁₅
  --          simp only [Set.mem_Icc] at h₁₅
  --          linarith
  --        simp_all <;> norm_num <;> linarith
  --      | inr h₁₂ =>
  --        have h₁₃ : x > 1 := h₁₂
  --        have h₁₄ : x ∉ Set.Icc 0 1 := by
  --          intro h₁₅
  --          simp only [Set.mem_Icc] at h₁₅
  --          linarith
  --        simp_all <;> norm_num <;> linarith <;> norm_num at * <;> linarith
  hole