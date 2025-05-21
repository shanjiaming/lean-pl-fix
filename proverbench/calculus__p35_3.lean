theorem local_max_at_2 : IsLocalMax f 2 := by
  have h_main : ∃ (δ : ℝ) (hδ : 0 < δ), ∀ x, |x - 2| < δ → f x ≤ f 2 := by
    use 1
    use by norm_num
    intro x hx
    have h₁ : f x = x ^ 3 - 9 * x ^ 2 + 24 * x := rfl
    have h₂ : f 2 = 20 := by
      norm_num [f]
    rw [h₁, h₂]
    have h₃ : |x - 2| < 1 := hx
    have h₄ : -1 < x - 2 := by linarith [abs_lt.mp h₃]
    have h₅ : x - 2 < 1 := by linarith [abs_lt.mp h₃]
    have h₆ : 1 < x := by linarith
    have h₇ : x < 3 := by linarith
    have h₈ : x < 5 := by linarith
    have h₉ : (x - 2) ^ 2 * (x - 5) ≤ 0 := by
      have h₁₀ : 0 ≤ (x - 2) ^ 2 := by nlinarith
      have h₁₁ : x - 5 < 0 := by linarith
      have h₁₂ : (x - 2) ^ 2 * (x - 5) ≤ 0 := by nlinarith
      exact h₁₂
    have h₁₀ : x ^ 3 - 9 * x ^ 2 + 24 * x - 20 ≤ 0 := by
      have h₁₁ : x ^ 3 - 9 * x ^ 2 + 24 * x - 20 = (x - 2) ^ 2 * (x - 5) := by
        ring
      rw [h₁₁]
      exact h₉
    linarith
  
  have h_final : IsLocalMax f 2 := by
    rw [IsLocalMax]
    obtain ⟨δ, hδ, hδ'⟩ := h_main
    -- We have the required δ and the proof that it works, now we need to relate it to the filter definition.
    filter_upwards [Metric.ball_mem_nhds 2 hδ] with y hy
    -- For all y in the δ-ball around 2, we have |y - 2| < δ.
    have h₁ : |y - 2| < δ := by
      rw [Metric.mem_ball] at hy
      simpa [Real.dist_eq] using hy
    -- Since |y - 2| < δ, we have f y ≤ f 2 by the given property of δ.
    have h₂ : f y ≤ f 2 := hδ' y h₁
    exact h₂
  
  exact h_final