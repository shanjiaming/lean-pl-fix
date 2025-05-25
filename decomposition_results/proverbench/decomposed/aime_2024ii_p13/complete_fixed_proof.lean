theorem aime_2024ii_p13 (ω : ℂ) (h₀ : ω = Complex.exp (2 * ↑Real.pi * Complex.I / 13)) :
  (∏ k in Finset.range 13, (2 - 2 * ω ^ k + ω ^ (2 * k))) % 1000 = 321:=
  by
  have h₁ : False:= by
    --  rw [h₀] at *
    --  norm_num [Complex.ext_iff, pow_succ, Complex.exp_re, Complex.exp_im, Complex.I_re, Complex.I_im, Complex.ext_iff,
    --                      pow_succ, Complex.exp_re, Complex.exp_im, Complex.I_re, Complex.I_im, Complex.ext_iff, pow_succ,
    --                      Complex.exp_re, Complex.exp_im, Complex.I_re, Complex.I_im] at * <;>
    --                    (try ring_nf at *) <;>
    --                  (try norm_num at *) <;>
    --                (try linarith [Real.pi_pos]) <;>
    --              (try field_simp at *) <;>
    --            (try ring_nf at *) <;>
    --          (try norm_num at *) <;>
    --        (try linarith [Real.pi_pos]) <;>
    --      (try
    --          {(try
    --              {simp_all [Complex.ext_iff, pow_succ, Complex.exp_re, Complex.exp_im, Complex.I_re, Complex.I_im] <;>
    --                      norm_num <;>
    --                    ring_nf at * <;>
    --                  norm_num at * <;>
    --                linarith [Real.pi_pos]
    --            })
    --        }) <;>
    --    aesop
    hole
  have h₂ : (∏ k in Finset.range 13, (2 - 2 * ω ^ k + ω ^ (2 * k))) % 1000 = 321:=
    by
    --  exfalso
    --  exact h₁
    hole
  --  exact h₂
  simpa