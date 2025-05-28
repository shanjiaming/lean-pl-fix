theorem putnam_1978_a3 (p : Polynomial ℝ) (hp : p = 2 * (X ^ 6 + 1) + 4 * (X ^ 5 + X) + 3 * (X ^ 4 + X ^ 2) + 5 * X ^ 3)
  (I : ℕ → ℝ) (hI : I = fun k ↦ ∫ x in Ioi 0, (x : ℝ) ^ k / p.eval x) :
  IsLeast {y | ∃ k ∈ Ioo 0 5, I k = y} ((2) : ℝ):=
  by
  have h₁ : False:= by
    have h₂ := hI
    --  rw [h₂] at *
    have h₃ := hp
    have h₄ :
      p =
        2 * (X ^ 6 + 1 : Polynomial ℝ) + 4 * (X ^ 5 + X : Polynomial ℝ) + 3 * (X ^ 4 + X ^ 2 : Polynomial ℝ) + 5 * X ^ 3 := by sorry
    have h₅ : ∀ (x : ℝ), x > 0 → p.eval x ≥ 2:= by
      --  intro x hx
      --  rw [h₄]
      --  simp [Polynomial.eval_add, Polynomial.eval_mul, Polynomial.eval_pow, Polynomial.eval_C, Polynomial.eval_X,
      --      Polynomial.eval_bit0, Polynomial.eval_bit1, Polynomial.eval_one] <;>
      --    nlinarith [sq_nonneg (x ^ 3 - 1), sq_nonneg (x ^ 2 - 1), sq_nonneg (x - 1), sq_nonneg (x ^ 3 - x),
      --      sq_nonneg (x ^ 2 - x), sq_nonneg (x - x ^ 2), sq_nonneg (x ^ 3 - x ^ 2), mul_pos hx (pow_pos hx 2),
      --      mul_pos hx (pow_pos hx 3), mul_pos hx (pow_pos hx 4), mul_pos hx (pow_pos hx 5),
      --      mul_pos (pow_pos hx 2) (pow_pos hx 3), mul_pos (pow_pos hx 2) (pow_pos hx 4),
      --      mul_pos (pow_pos hx 2) (pow_pos hx 5), mul_pos (pow_pos hx 3) (pow_pos hx 4),
      --      mul_pos (pow_pos hx 3) (pow_pos hx 5), mul_pos (pow_pos hx 4) (pow_pos hx 5)]
      hole
    have h₆ : (fun k : ℕ ↦ ∫ x in Ioi 0, (x : ℝ) ^ k / p.eval x) 1 < (2 : ℝ):=
      by
      have h₇ : (fun k : ℕ ↦ ∫ x in Ioi 0, (x : ℝ) ^ k / p.eval x) 1 = ∫ x in Ioi 0, (x : ℝ) ^ 1 / p.eval x:= by -- rfl
        norm_num
      --  rw [h₇]
      have h₈ : ∫ x in Ioi 0, (x : ℝ) ^ 1 / p.eval x < (2 : ℝ):=
        by
        have h₉ : ∫ x in Ioi 0, (x : ℝ) ^ 1 / p.eval x ≤ 3 / 8:=
          by
          have h₁₀ : ∀ (x : ℝ), x > 0 → (x : ℝ) ^ 1 / p.eval x ≤ (x : ℝ) ^ 1 / 2:=
            by
            --  intro x hx
            have h₁₁ : p.eval x ≥ 2 := h₅ x hx
            have h₁₂ : (x : ℝ) ^ 1 > 0:= by -- positivity
              linarith
            have h₁₃ : (x : ℝ) ^ 1 / p.eval x ≤ (x : ℝ) ^ 1 / 2:=
              by
              --  apply div_le_div_of_le_left (by positivity) (by positivity)
              --  linarith
              hole
            --  exact h₁₃
            hole
          have h₁₄ : ∫ x in Ioi 0, (x : ℝ) ^ 1 / p.eval x ≤ ∫ x in Ioi 0, (x : ℝ) ^ 1 / 2:= by -- apply?
            hole
          have h₁₅ : ∫ x in Ioi 0, (x : ℝ) ^ 1 / 2 = 3 / 8 := by
            norm_num [integral_Ioi_of_hasDerivAt_iff_tendsto'] <;> simp_all [div_eq_mul_inv] <;> norm_num <;> ring_nf <;>
                norm_num <;>
              linarith
          --  linarith
          hole
        have h₁₆ : ∫ x in Ioi 0, (x : ℝ) ^ 1 / p.eval x < (2 : ℝ) := by linarith
        --  exact h₁₆
        linarith
      --  exact h₈
      linarith
    have h₇ : (2 : ℝ) ≤ (2 : ℝ) := by norm_num
    have h₈ : ∃ (k : ℕ), k ∈ Ioo 0 5 ∧ (fun k : ℕ ↦ ∫ x in Ioi 0, (x : ℝ) ^ k / p.eval x) k = (2 : ℝ) :=
      by
      exfalso
      linarith
    --  --  simp_all [IsLeast] <;> aesop
    hole
  have h₂ : IsLeast {y | ∃ k ∈ Ioo 0 5, I k = y} ((2) : ℝ) :=
    by
    exfalso
    exact h₁
  --  exact h₂
  simpa