theorem limit_of_function : Tendsto (fun x => (Real.exp (8 * x) - 1) / x) (𝓝[Set.Ioi 0] 0) (𝓝 8) := by
  have h₁ : Tendsto (fun y : ℝ => (Real.exp y - 1) / y) (𝓝 0) (𝓝 1) := by
    have h₂ : Tendsto (fun y : ℝ => (Real.exp y - 1) / y) (𝓝 0) (𝓝 1) := by
      simpa using Real.tendsto_exp_sub_one_div_at_zero
    exact h₂
  
  have h₂ : Tendsto (fun x : ℝ => 8 * x) (𝓝[Set.Ioi 0] 0) (𝓝 0) := by
    have h₃ : Continuous (fun x : ℝ => 8 * x) := by continuity
    have h₄ : Tendsto (fun x : ℝ => 8 * x) (𝓝[Set.Ioi 0] 0) (𝓝 (8 * 0)) := by
      apply Tendsto.mono_left _ nhdsWithin_le_nhds
      exact h₃.continuousAt
    simpa [mul_zero] using h₄
  
  have h₃ : Tendsto (fun x : ℝ => (Real.exp (8 * x) - 1) / (8 * x)) (𝓝[Set.Ioi 0] 0) (𝓝 1) := by
    have h₄ : Tendsto (fun x : ℝ => (Real.exp (8 * x) - 1) / (8 * x)) (𝓝[Set.Ioi 0] 0) (𝓝 1) := by
      have h₅ : (fun x : ℝ => (Real.exp (8 * x) - 1) / (8 * x)) = (fun y : ℝ => (Real.exp y - 1) / y) ∘ (fun x : ℝ => 8 * x) := by
        funext x
        <;> ring_nf
        <;> field_simp
        <;> ring_nf
      rw [h₅]
      have h₆ : Tendsto (fun y : ℝ => (Real.exp y - 1) / y) (𝓝 0) (𝓝 1) := h₁
      have h₇ : Tendsto (fun x : ℝ => 8 * x) (𝓝[Set.Ioi 0] 0) (𝓝 0) := h₂
      have h₈ : Tendsto ((fun y : ℝ => (Real.exp y - 1) / y) ∘ fun x : ℝ => 8 * x) (𝓝[Set.Ioi 0] 0) (𝓝 1) := by
        -- Use the fact that the composition of the two functions tends to 1
        have h₉ : Tendsto (fun y : ℝ => (Real.exp y - 1) / y) (𝓝 0) (𝓝 1) := h₁
        have h₁₀ : Tendsto (fun x : ℝ => 8 * x) (𝓝[Set.Ioi 0] 0) (𝓝 0) := h₂
        exact Tendsto.comp h₉ h₁₀
      exact h₈
    exact h₄
  
  have h₄ : Tendsto (fun x : ℝ => 8 * ((Real.exp (8 * x) - 1) / (8 * x))) (𝓝[Set.Ioi 0] 0) (𝓝 8) := by
    have h₅ : Tendsto (fun x : ℝ => (8 : ℝ) * ((Real.exp (8 * x) - 1) / (8 * x))) (𝓝[Set.Ioi 0] 0) (𝓝 (8 * 1)) := by
      -- Use the fact that the limit of a product is the product of the limits
      have h₅₁ : Tendsto (fun x : ℝ => (Real.exp (8 * x) - 1) / (8 * x)) (𝓝[Set.Ioi 0] 0) (𝓝 1) := h₃
      have h₅₂ : Tendsto (fun x : ℝ => (8 : ℝ) * ((Real.exp (8 * x) - 1) / (8 * x))) (𝓝[Set.Ioi 0] 0) (𝓝 (8 * 1)) := by
        -- Use the fact that the limit of a product is the product of the limits
        have h₅₃ : Continuous fun x : ℝ => (8 : ℝ) * x := by continuity
        have h₅₄ : Tendsto (fun x : ℝ => (8 : ℝ) * ((Real.exp (8 * x) - 1) / (8 * x))) (𝓝[Set.Ioi 0] 0) (𝓝 (8 * 1)) := by
          -- Use the fact that the limit of a product is the product of the limits
          convert h₅₃.continuousAt.tendsto.comp h₅₁ using 1 <;> simp [mul_assoc]
          <;> ring_nf
          <;> field_simp
          <;> simp_all [mul_comm]
          <;> ring_nf
          <;> norm_num
        exact h₅₄
      exact h₅₂
    -- Simplify the final result
    simpa using h₅
  
  have h₅ : (fun x : ℝ => (Real.exp (8 * x) - 1) / x) =ᶠ[𝓝[Set.Ioi 0] 0] (fun x : ℝ => 8 * ((Real.exp (8 * x) - 1) / (8 * x))) := by
    filter_upwards [self_mem_nhdsWithin] with x hx
    have h₅₁ : 0 < x := by simpa using hx
    have h₅₂ : x ≠ 0 := by linarith
    have h₅₃ : 8 * x ≠ 0 := by positivity
    field_simp [h₅₂, h₅₃]
    <;> ring_nf
    <;> field_simp [h₅₂, h₅₃]
    <;> ring_nf
    <;> linarith
  
  have h₆ : Tendsto (fun x : ℝ => (Real.exp (8 * x) - 1) / x) (𝓝[Set.Ioi 0] 0) (𝓝 8) := by
    -- Use the fact that the two functions are equal in the filter to conclude the limit
    have h₇ : Tendsto (fun x : ℝ => (Real.exp (8 * x) - 1) / x) (𝓝[Set.Ioi 0] 0) (𝓝 8) := by
      apply Tendsto.congr' h₅ h₄
    exact h₇
  
  exact h₆