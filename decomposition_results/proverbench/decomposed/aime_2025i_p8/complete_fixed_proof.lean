theorem aime_2025i_p8 (ans : ℚ) (S : Finset ℝ)
  (h₀ :
    ∀ k : ℝ,
      k ∈ S ↔
        (∃! (z : ℂ),
          Complex.abs (25 + 20 * Complex.I - z) = 5 ∧ Complex.abs (z - 4 - k) = Complex.abs (z - 3 * Complex.I - k)))
  (answer : ans = (∑ k in S, k)) : ↑ans.den + ans.num = 77:=
  by
  have h₁ : ans = 73 / 4:=
    by
    have h₂ : S = {(1168 + Real.sqrt (639760)) / 128, (1168 - Real.sqrt (639760)) / 128}:= by -- sorry
      hole
    --  rw [h₂] at answer
    --  rw [answer] <;>
            norm_num [Finset.sum_pair
                (show (1168 + Real.sqrt (639760)) / 128 ≠ (1168 - Real.sqrt (639760)) / 128
                  by
                  intro h
                  have h₃ : Real.sqrt (639760) > 0 := Real.sqrt_pos.mpr (by norm_num)
                  nlinarith [Real.sq_sqrt (show 0 ≤ 639760 by norm_num), Real.sqrt_nonneg (639760 : ℝ)]),
              Real.sqrt_eq_iff_sq_eq] <;>
          ring_nf at * <;>
        field_simp at * <;>
      nlinarith [Real.sq_sqrt (show 0 ≤ 639760 by norm_num), Real.sqrt_nonneg (639760 : ℝ)]
    hole
  have h₂ : ans.num = 73:= by
    have h₃ : ans = 73 / 4 := h₁
    --  --  rw [h₃] <;> norm_num [Rat.num_div_den] <;> rfl
    hole
  have h₃ : ans.den = 4:= by
    have h₄ : ans = 73 / 4 := h₁
    --  --  rw [h₄] <;> norm_num [Rat.den_div_eq_of_mod_eq_two] <;> rfl
    hole
  have h₄ : ↑ans.den + ans.num = 77:= by -- -- rw [h₂, h₃] <;> norm_num <;> rfl
    linarith
  --  exact h₄
  linarith