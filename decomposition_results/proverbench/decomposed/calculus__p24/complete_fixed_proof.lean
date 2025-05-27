theorem limit_of_sin_fraction_as_x_approaches_infinity :
  Tendsto (fun x : ℝ => sin (2 * x + x ^ 3) / (x + 3 * x ^ 3)) atTop (𝓝 0):=
  by
  have h_main : Tendsto (fun x : ℝ => sin (2 * x + x ^ 3) / (x + 3 * x ^ 3)) atTop (𝓝 0):=
    by
    have h₁ : Tendsto (fun x : ℝ => x + 3 * x ^ 3 : ℝ → ℝ) atTop atTop:=
      by
      have h₂ : Tendsto (fun x : ℝ => x ^ 3 : ℝ → ℝ) atTop atTop:=
        by
        apply tendsto_atTop_mono _ tendsto_id
        intro x
        have h₃ : x ≤ x ^ 3:= by -- nlinarith [sq_nonneg (x - 1), sq_nonneg (x + 1)]
          hole
        linarith
        hole
      have h₃ : Tendsto (fun x : ℝ => 3 * x ^ 3 : ℝ → ℝ) atTop atTop:= by
        simpa using Tendsto.const_mul_atTop (by norm_num) h₂
        hole
      have h₄ : Tendsto (fun x : ℝ => x + 3 * x ^ 3 : ℝ → ℝ) atTop atTop:=
        by
        refine' Tendsto.atTop_of_add_const_right _ _
        simpa using h₃
        hole
      --  simpa using h₄
      hole
    have h₂ : Tendsto (fun x : ℝ => sin (2 * x + x ^ 3) / (x + 3 * x ^ 3)) atTop (𝓝 0):=
      by
      have h₃ : ∀ x : ℝ, sin (2 * x + x ^ 3) / (x + 3 * x ^ 3) = (sin (2 * x + x ^ 3)) * (1 / (x + 3 * x ^ 3)):=
        by
        --  intro x
        --  by_cases h : x + 3 * x ^ 3 = 0
        ·
          have h₄ : x + 3 * x ^ 3 = 0 := h
          have h₅ : sin (2 * x + x ^ 3) / (x + 3 * x ^ 3) = 0 :=
            by
            rw [h₄]
            simp
          have h₆ : (sin (2 * x + x ^ 3)) * (1 / (x + 3 * x ^ 3)) = 0:=
            by
            --  rw [h₄]
            --  simp
            hole
        --    linarith
        ·
          have h₄ : x + 3 * x ^ 3 ≠ 0 := h
          have h₅ : sin (2 * x + x ^ 3) / (x + 3 * x ^ 3) = 0:= by
            --  rw [h₄]
            --  simp
            hole
      have h₃ : ∀ x : ℝ, sin (2 * x + x ^ 3) / (x + 3 * x ^ 3) = (sin (2 * x + x ^ 3)) * (1 / (x + 3 * x ^ 3)) :=
        by
        intro x
        by_cases h : x + 3 * x ^ 3 = 0
        ·
          have h₄ : x + 3 * x ^ 3 = 0 := h
          have h₅ : sin (2 * x + x ^ 3) / (x + 3 * x ^ 3) = 0 :=
            by
            rw [h₄]
            simp
          have h₆ : (sin (2 * x + x ^ 3)) * (1 / (x + 3 * x ^ 3)) = 0 :=
            by
            rw [h₄]
            simp
          linarith
        ·
          have h₄ : x + 3 * x ^ 3 ≠ 0 := h
          field_simp [h₄] <;> ring_nf <;> field_simp [h₄] <;> ring_nf
        hole
      --  rw [show
      --      (fun x : ℝ => sin (2 * x + x ^ 3) / (x + 3 * x ^ 3)) =
      --        (fun x : ℝ => (sin (2 * x + x ^ 3)) * (1 / (x + 3 * x ^ 3)))
      --      by
      --      funext x
      --      rw [h₃ x]]
      have h₄ : Tendsto (fun x : ℝ => 1 / (x + 3 * x ^ 3)) atTop (𝓝 0):=
        by
        have h₅ : Tendsto (fun x : ℝ => x + 3 * x ^ 3 : ℝ → ℝ) atTop atTop := h₁
        have h₆ : Tendsto (fun x : ℝ => 1 / (x + 3 * x ^ 3)) atTop (𝓝 0):= by -- apply tendsto_inv_atTop_zero.comp h₁
          hole
        --  exact h₆
        hole
      have h₅ : Tendsto (fun x : ℝ => sin (2 * x + x ^ 3) * (1 / (x + 3 * x ^ 3))) atTop (𝓝 0):=
        by
        have h₆ : ∀ x : ℝ, |sin (2 * x + x ^ 3)| ≤ 1:= by
          --  intro x
          --  exact abs_sin_le_one (2 * x + x ^ 3)
          hole
        have h₇ : Tendsto (fun x : ℝ => sin (2 * x + x ^ 3) * (1 / (x + 3 * x ^ 3))) atTop (𝓝 0):=
          by
          have h₈ : Tendsto (fun x : ℝ => (1 : ℝ) / (x + 3 * x ^ 3)) atTop (𝓝 0) := h₄
          have h₉ :
            Tendsto (fun x : ℝ => sin (2 * x + x ^ 3) * (1 / (x + 3 * x ^ 3))) atTop (𝓝 (sin (2 * (0 : ℝ) + (0 : ℝ) ^ 3) * 0)) := by sorry
          have h₁₀ : sin (2 * (0 : ℝ) + (0 : ℝ) ^ 3) * 0 = 0:= by -- norm_num
            norm_num
          --  rw [h₁₀] at h₉
          --  simpa using h₉
          hole
        --  simpa using h₉
        norm_cast
      --  exact h₅
      hole
    --  exact h₂
    simpa
  --  exact h_main
  simpa