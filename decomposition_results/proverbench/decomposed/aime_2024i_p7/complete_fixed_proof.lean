theorem aime_2024i_p7 (f : ℂ → ℂ) (h₀ : ∀ (z : ℂ), f z = (75 + 117 * Complex.I) * z + (96 + 144 * Complex.I) / z) :
  IsGreatest {x : ℝ | ∃ (z : ℂ), Complex.abs z = 4 ∧ (f z).re = x} 540:=
  by
  have h_main : IsGreatest {x : ℝ | ∃ (z : ℂ), Complex.abs z = 4 ∧ (f z).re = x} 540:=
    by
    --  constructor
    --  · use (12 / 5 : ℂ) - (16 / 5 : ℂ) * Complex.I
      have h₁ : Complex.abs ((12 / 5 : ℂ) - (16 / 5 : ℂ) * Complex.I) = 4:= by
        --  --  --  simp [Complex.abs, Complex.normSq, div_pow, pow_two, pow_three, mul_assoc] <;> ring_nf <;> norm_num <;>
        --        rw [Real.sqrt_eq_iff_sq_eq] <;>
            ring_nf <;>
          norm_num
        hole
      have h₂ : (f ((12 / 5 : ℂ) - (16 / 5 : ℂ) * Complex.I)).re = (540 : ℝ):=
        by
        --  rw [h₀]
        --  --  simp [Complex.ext_iff, Complex.div_re, Complex.div_im, Complex.normSq, pow_two] <;> norm_num <;>
                    field_simp [Complex.ext_iff, Complex.div_re, Complex.div_im, Complex.normSq, pow_two] <;>
                  ring_nf <;>
                norm_num <;>
              simp_all [Complex.ext_iff, Complex.div_re, Complex.div_im, Complex.normSq, pow_two] <;>
            norm_num <;>
          linarith
        hole
    --    exact ⟨h₁, h₂⟩
    --  · rintro x ⟨z, hz, hx⟩
      have h₁ : Complex.abs z = 4 := hz
      have h₂ : (f z).re = x := hx
      have h₃ : (f z).re ≤ 540:= by
        --  rw [h₀] at *
        have h₄ : z ≠ 0:= by
          --  by_contra h
          --  rw [h] at h₁
          --  norm_num [Complex.abs, Complex.normSq] at h₁ <;>
                simp_all [Complex.ext_iff, Complex.div_re, Complex.div_im, Complex.normSq, pow_two] <;>
              norm_num <;>
            linarith
          hole
        have h₅ : (((75 + 117 * Complex.I) * z + (96 + 144 * Complex.I) / z) : ℂ).re ≤ 540:=
          by
          have h₅₁ : (((75 + 117 * Complex.I) * z + (96 + 144 * Complex.I) / z) : ℂ).re = 81 * z.re - 108 * z.im:= by
            --  field_simp [Complex.ext_iff, Complex.div_re, Complex.div_im, Complex.normSq, pow_two, Complex.ext_iff, Complex.mul_re,
            --                Complex.mul_im, Complex.add_re, Complex.add_im] <;>
            --              ring_nf at * <;>
            --            norm_num at * <;>
            --          simp_all [Complex.ext_iff, Complex.div_re, Complex.div_im, Complex.normSq, pow_two] <;>
            --        ring_nf at * <;>
            --      norm_num at * <;>
            --    linarith
            hole
          --  rw [h₅₁]
          have h₅₂ : z.re * z.re + z.im * z.im = 16:=
            by
            have h₅₂₁ : Complex.abs z = 4 := hz
            have h₅₂₂ : Complex.abs z = Real.sqrt (z.re * z.re + z.im * z.im):= by
              --  --  simp [Complex.abs, Complex.normSq, Real.sqrt_eq_iff_sq_eq, sq, add_nonneg, mul_self_nonneg] <;> ring_nf <;>
              --          simp_all [Complex.ext_iff, Complex.div_re, Complex.div_im, Complex.normSq, pow_two] <;>
              --        ring_nf at * <;>
              --      norm_num at * <;>
              --    linarith
              hole
            --  rw [h₅₂₂] at h₅₂₁
            have h₅₂₃ : Real.sqrt (z.re * z.re + z.im * z.im) = 4:= by -- linarith
              linarith
            have h₅₂₄ : z.re * z.re + z.im * z.im = 16:=
              by
              have h₅₂₅ : Real.sqrt (z.re * z.re + z.im * z.im) = 4:= by -- linarith
                linarith
              have h₅₂₆ : z.re * z.re + z.im * z.im ≥ 0:= by -- nlinarith
                nlinarith
              have h₅₂₇ : Real.sqrt (z.re * z.re + z.im * z.im) ^ 2 = z.re * z.re + z.im * z.im := by
                rw [Real.sq_sqrt] <;> nlinarith
              have h₅₂₇ : Real.sqrt (z.re * z.re + z.im * z.im) ^ 2 = z.re * z.re + z.im * z.im:= by -- -- rw [Real.sq_sqrt] <;> nlinarith
                field_simp
            have h₅₂₄ : z.re * z.re + z.im * z.im = 16 :=
              by
              have h₅₂₅ : Real.sqrt (z.re * z.re + z.im * z.im) = 4 := by sorry
              have h₅₂₆ : z.re * z.re + z.im * z.im ≥ 0 := by sorry
              have h₅₂₇ : Real.sqrt (z.re * z.re + z.im * z.im) ^ 2 = z.re * z.re + z.im * z.im := by
                rw [Real.sq_sqrt] <;> nlinarith
              nlinarith
              hole
            --  exact h₅₂₄
            linarith
          --  nlinarith [sq_nonneg (z.re - 12 / 5), sq_nonneg (z.im + 16 / 5), sq_nonneg (z.re + 12 / 5), sq_nonneg (z.im - 16 / 5)]
          hole
        --  simpa [Complex.ext_iff, Complex.div_re, Complex.div_im, Complex.normSq, pow_two] using h₅
        hole
    --    linarith
    hole
  --  exact h_main
  simpa