theorem h₂₄ (h₀ : sorry) (h₁ : sorry) (h₂₁ : sorry) (h₂₂ : sorry) : ∀ᶠ (x : ℝ) in 𝓝 3, (cos (2 * x - 6) - 1) / (x ^ 3 - 6 * x ^ 2 + 9 * x) = (cos (2 * x - 6) - 1) / (x - 3) ^ 2 * (1 / x) :=
  by
  --  filter_upwards [isOpen_ne.mem_nhds (by norm_num : (3 : ℝ) ≠ 0)] with x hx
  have h₂₅ : x ≠ 0 := by sorry
  have h₂₆ :
    x ≠ 3 →
      (Real.cos (2 * x - 6) - 1) / (x ^ 3 - 6 * x ^ 2 + 9 * x) =
        ((Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) * ((1 : ℝ) / x) := by sorry
  --  by_cases h₂₇ : x = 3
  --  --  · simp_all <;> norm_num
  ·
    have h₂₈ : x ≠ 3 := h₂₇
    have h₂₉ : x ≠ 0 := by sorry
    have h₃₀ :
      (Real.cos (2 * x - 6) - 1) / (x ^ 3 - 6 * x ^ 2 + 9 * x) =
        ((Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) * ((1 : ℝ) / x) := by sorry
  --    exact h₃₀
  hole