theorem limit_of_function : Tendsto (fun x => (Real.exp (8 * x) - 1) / x) (𝓝[Set.Ioi 0] 0) (𝓝 8):=
  by
  have h₁ : Tendsto (fun y : ℝ => (Real.exp y - 1) / y) (𝓝 0) (𝓝 1):=
    by
    have h₂ : Tendsto (fun y : ℝ => (Real.exp y - 1) / y) (𝓝 0) (𝓝 1) := by
      simpa using Real.tendsto_exp_sub_one_div_at_zero
    have h₂ : Tendsto (fun y : ℝ => (Real.exp y - 1) / y) (𝓝 0) (𝓝 1):= by -- simpa using Real.tendsto_exp_sub_one_div_at_zero
      hole
  have h₁ : Tendsto (fun y : ℝ => (Real.exp y - 1) / y) (𝓝 0) (𝓝 1) :=
    by
    have h₂ : Tendsto (fun y : ℝ => (Real.exp y - 1) / y) (𝓝 0) (𝓝 1) := by
      simpa using Real.tendsto_exp_sub_one_div_at_zero
    exact h₂
    hole
  have h₂ : Tendsto (fun x : ℝ => 8 * x) (𝓝[Set.Ioi 0] 0) (𝓝 0):=
    by
    have h₃ : Continuous (fun x : ℝ => 8 * x):= by -- continuity
      hole
    have h₄ : Tendsto (fun x : ℝ => 8 * x) (𝓝[Set.Ioi 0] 0) (𝓝 (8 * 0)):=
      by
      --  apply Tendsto.mono_left _ nhdsWithin_le_nhds
      --  exact h₃.continuousAt
      hole
    --  simpa [mul_zero] using h₄
    hole
  have h₃ : Tendsto (fun x : ℝ => (Real.exp (8 * x) - 1) / (8 * x)) (𝓝[Set.Ioi 0] 0) (𝓝 1):=
    by
    have h₄ : Tendsto (fun x : ℝ => (Real.exp (8 * x) - 1) / (8 * x)) (𝓝[Set.Ioi 0] 0) (𝓝 1):=
      by
      have h₅ :
        (fun x : ℝ => (Real.exp (8 * x) - 1) / (8 * x)) = (fun y : ℝ => (Real.exp y - 1) / y) ∘ (fun x : ℝ => 8 * x) := by sorry
      --  rw [h₅]
      have h₆ : Tendsto (fun y : ℝ => (Real.exp y - 1) / y) (𝓝 0) (𝓝 1) := h₁
      have h₇ : Tendsto (fun x : ℝ => 8 * x) (𝓝[Set.Ioi 0] 0) (𝓝 0) := h₂
      have h₈ : Tendsto ((fun y : ℝ => (Real.exp y - 1) / y) ∘ fun x : ℝ => 8 * x) (𝓝[Set.Ioi 0] 0) (𝓝 1):=
        by
        have h₉ : Tendsto (fun y : ℝ => (Real.exp y - 1) / y) (𝓝 0) (𝓝 1) := h₁
        have h₁₀ : Tendsto (fun x : ℝ => 8 * x) (𝓝[Set.Ioi 0] 0) (𝓝 0) := h₂
        --  exact Tendsto.comp h₉ h₁₀
        hole
      --  exact h₈
      hole
    --  exact h₄
    simpa
  have h₄ : Tendsto (fun x : ℝ => 8 * ((Real.exp (8 * x) - 1) / (8 * x))) (𝓝[Set.Ioi 0] 0) (𝓝 8):=
    by
    have h₅ : Tendsto (fun x : ℝ => (8 : ℝ) * ((Real.exp (8 * x) - 1) / (8 * x))) (𝓝[Set.Ioi 0] 0) (𝓝 (8 * 1)):=
      by
      have h₅₁ : Tendsto (fun x : ℝ => (Real.exp (8 * x) - 1) / (8 * x)) (𝓝[Set.Ioi 0] 0) (𝓝 1) := h₃
      have h₅₂ : Tendsto (fun x : ℝ => (8 : ℝ) * ((Real.exp (8 * x) - 1) / (8 * x))) (𝓝[Set.Ioi 0] 0) (𝓝 (8 * 1)):=
        by
        have h₅₃ : Continuous fun x : ℝ => (8 : ℝ) * x:= by -- continuity
          hole
        have h₅₄ : Tendsto (fun x : ℝ => (8 : ℝ) * ((Real.exp (8 * x) - 1) / (8 * x))) (𝓝[Set.Ioi 0] 0) (𝓝 (8 * 1)):= by
          --  convert h₅₃.continuousAt.tendsto.comp h₅₁ using 1 <;> simp [mul_assoc] <;> ring_nf <;> field_simp <;>
                simp_all [mul_comm] <;>
              ring_nf <;>
            norm_num
          hole
        --  exact h₅₄
        hole
      --  exact h₅₂
      hole
    --  simpa using h₅
    hole
  have h₅ :
    (fun x : ℝ => (Real.exp (8 * x) - 1) / x) =ᶠ[𝓝[Set.Ioi 0] 0] (fun x : ℝ => 8 * ((Real.exp (8 * x) - 1) / (8 * x))) := by sorry
  have h₆ : Tendsto (fun x : ℝ => (Real.exp (8 * x) - 1) / x) (𝓝[Set.Ioi 0] 0) (𝓝 8):=
    by
    have h₇ : Tendsto (fun x : ℝ => (Real.exp (8 * x) - 1) / x) (𝓝[Set.Ioi 0] 0) (𝓝 8):= by -- apply Tendsto.congr' h₅ h₄
      hole
    --  exact h₇
    simpa
  --  exact h₆
  simpa