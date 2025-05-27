theorem derivative_of_f (x : ℝ) : HasDerivAt f (2 * (1 / cos x) ^ 2 * tan x) x:=
  by
  have h_main : HasDerivAt f (2 * (1 / cos x) ^ 2 * tan x) x:=
    by
    have h₀ : f = fun x ↦ (1 / Real.cos x) ^ 2 := rfl
    --  rw [h₀]
    have h₁ : HasDerivAt (fun x : ℝ => (1 / Real.cos x) ^ 2) (2 * (1 / Real.cos x) ^ 2 * Real.tan x) x:=
      by
      --  by_cases h : Real.cos x = 0
      ·
        have h₂ : HasDerivAt (fun x : ℝ => (1 / Real.cos x) ^ 2) 0 x:=
          by
          have h₃ : (fun x : ℝ => (1 / Real.cos x) ^ 2) =ᶠ[𝓝 x] fun _ => 0:=
            by
            --  filter_upwards [isOpen_ne.preimage (continuous_cos).continuousAt] with y hy
            have h₄ : Real.cos y ≠ 0 := by
              intro h₅
              apply hy
              simp_all [h]
            have h₅ : Real.cos y ≠ 0 := h₄
            simp_all [h, pow_two] <;> field_simp [h₅] <;> ring_nf <;> simp_all [h] <;> field_simp [h₅] <;> ring_nf <;>
              simp_all [h]
            hole
          have h₄ : HasDerivAt (fun x : ℝ => (1 / Real.cos x) ^ 2) 0 x:=
            by
            have h₅ : HasDerivAt (fun x : ℝ => (1 / Real.cos x) ^ 2) 0 x:=
              by
              --  apply HasDerivAt.congr_of_eventuallyEq (hasDerivAt_const x 0)
              --  filter_upwards [h₃] with y hy
              simp_all
              hole
            --  exact h₅
            norm_cast
          --  exact h₄
          hole
        have h₃ : (2 * (1 / Real.cos x) ^ 2 * Real.tan x : ℝ) = 0:=
          by
          have h₄ : Real.cos x = 0 := h
          have h₅ : Real.tan x = 0:= by
            --  rw [Real.tan_eq_sin_div_cos]
            --  simp [h₄]
            hole
          --  rw [h₅]
          --  simp [h₄, pow_two] <;> ring_nf <;> simp_all [h] <;> field_simp [h] <;> ring_nf <;> simp_all [h]
          nlinarith
        have h₄ : HasDerivAt (fun x : ℝ => (1 / Real.cos x) ^ 2) (2 * (1 / Real.cos x) ^ 2 * Real.tan x) x:= by
          --  convert h₂ using 1 <;> simp_all
          hole
      --    exact h₄
      ·
        have h₂ : HasDerivAt (fun x : ℝ => 1 / Real.cos x) (Real.sin x / (Real.cos x) ^ 2) x := by sorry
        have h₃ : HasDerivAt (fun x : ℝ => (1 / Real.cos x) ^ 2) (2 * (1 / Real.cos x) ^ 2 * Real.tan x) x := by sorry
      --    exact h₃
      hole
    --  exact h₁
    norm_cast
  --  exact h_main
  norm_cast