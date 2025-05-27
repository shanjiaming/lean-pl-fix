theorem general_solution_quadratic_equation (x y : ℤ) (u : ℤ) (n : ℕ) :
  x ^ 2 + y ^ 2 - 1 = 4 * x * y → x + u * Real.sqrt 3 = (2 + Real.sqrt 3) ^ n:=
  by
  --  intro h₀
  have h₁ : False:=
    by
    have h₂ : x = 0 ∧ y = 1 ∧ u = 0 ∧ n = 0 → False:= by
      --  intro h
      have h₃ : x = 0 := h.1
      have h₄ : y = 1 := h.2.1
      have h₅ : u = 0 := h.2.2.1
      have h₆ : n = 0 := h.2.2.2
      have h₇ : (x + u * Real.sqrt 3 : ℝ) = (2 + Real.sqrt 3 : ℝ) ^ n:= by
        --  --  --  simp [h₃, h₄, h₅, h₆, pow_zero, add_assoc] <;> ring_nf at h₀ ⊢ <;> norm_num at h₀ ⊢ <;>
        --    nlinarith [Real.sqrt_nonneg 3, Real.sq_sqrt (show (0 : ℝ) ≤ 3 by norm_num)]
        hole
      --  norm_num [h₃, h₄, h₅, h₆, pow_zero, add_assoc] at h₇ <;> (try norm_num) <;> (try ring_nf at h₀ ⊢) <;>
            (try norm_num at h₀ ⊢) <;>
          (try nlinarith [Real.sqrt_nonneg 3, Real.sq_sqrt (show (0 : ℝ) ≤ 3 by norm_num)]) <;>
        (try linarith)
      hole
    --  by_cases h₈ : x = 0 ∧ y = 1 ∧ u = 0 ∧ n = 0
    --  · exact h₂ h₈
    ·
      have h₉ : x = 0:= by
        have h₁₀ := h₀
        --  ring_nf at h₁₀ ⊢
        have h₁₁ : (x : ℤ) ^ 2 + (y : ℤ) ^ 2 - 1 = 4 * x * y:= by -- exact_mod_cast h₁₀
          linarith
        have h₁₂ : x ≤ y * 2:= by -- nlinarith [sq_nonneg (x - y * 2), sq_nonneg (y - x * 2)]
          hole
        have h₁₃ : x ≥ y * 2:= by -- nlinarith [sq_nonneg (x - y * 2), sq_nonneg (y - x * 2)]
          hole
        have h₁₄ : x = y * 2:= by -- linarith
          linarith
        --  omega
        nlinarith
      have h₁₀ : y = 1:= by
        have h₁₁ := h₀
        --  ring_nf at h₁₁ ⊢
        have h₁₂ : (x : ℤ) ^ 2 + (y : ℤ) ^ 2 - 1 = 4 * x * y:= by -- exact_mod_cast h₁₁
          linarith
        have h₁₃ : x ≤ y * 2:= by -- nlinarith [sq_nonneg (x - y * 2), sq_nonneg (y - x * 2)]
          hole
        have h₁₄ : x ≥ y * 2:= by -- nlinarith [sq_nonneg (x - y * 2), sq_nonneg (y - x * 2)]
          hole
        have h₁₅ : x = y * 2:= by -- linarith
          linarith
        --  omega
        nlinarith
      have h₁₁ : u = 0:=
        by
        have h₁₂ : (x : ℝ) + u * Real.sqrt 3 = (2 + Real.sqrt 3 : ℝ) ^ n:= by
          --  --  --  norm_num [h₉, h₁₀] at h₀ ⊢ <;> ring_nf at h₀ ⊢ <;> norm_num at h₀ ⊢ <;>
          --    nlinarith [Real.sqrt_nonneg 3, Real.sq_sqrt (show (0 : ℝ) ≤ 3 by norm_num)]
          hole
        have h₁₃ : (x : ℝ) + u * Real.sqrt 3 = (2 + Real.sqrt 3 : ℝ) ^ n:= by -- exact h₁₂
          linarith
        have h₁₄ : x = 0:= by -- exact_mod_cast h₉
          linarith
        have h₁₅ : y = 1:= by -- exact_mod_cast h₁₀
          linarith
        --  --  --  norm_num [h₁₄, h₁₅] at h₁₃ <;> (try ring_nf at h₁₃) <;> (try norm_num at h₁₃) <;>
        --    (try nlinarith [Real.sqrt_nonneg 3, Real.sq_sqrt (show (0 : ℝ) ≤ 3 by norm_num)])
        hole
      have h₁₂ : n = 0:=
        by
        have h₁₃ : (x : ℝ) + u * Real.sqrt 3 = (2 + Real.sqrt 3 : ℝ) ^ n:= by
          --  --  --  norm_num [h₉, h₁₀, h₁₁] at h₀ ⊢ <;> ring_nf at h₀ ⊢ <;> norm_num at h₀ ⊢ <;>
          --    nlinarith [Real.sqrt_nonneg 3, Real.sq_sqrt (show (0 : ℝ) ≤ 3 by norm_num)]
          hole
        have h₁₄ : (x : ℝ) + u * Real.sqrt 3 = (2 + Real.sqrt 3 : ℝ) ^ n:= by -- exact h₁₃
          linarith
        have h₁₅ : x = 0:= by -- exact_mod_cast h₉
          linarith
        have h₁₆ : y = 1:= by -- exact_mod_cast h₁₀
          linarith
        have h₁₇ : u = 0:= by -- exact_mod_cast h₁₁
          linarith
        --  --  --  norm_num [h₁₅, h₁₆, h₁₇] at h₁₄ <;> (try ring_nf at h₁₄) <;> (try norm_num at h₁₄) <;>
        --        (try nlinarith [Real.sqrt_nonneg 3, Real.sq_sqrt (show (0 : ℝ) ≤ 3 by norm_num)]) <;>
        --      (try {
        --          by_contra h
        --          have h₁₈ : n ≠ 0 := h
        --          have h₁₉ : n > 0 := Nat.pos_of_ne_zero h₁₈
        --          have h₂₀ : (2 + Real.sqrt 3 : ℝ) ^ n > 1 :=
        --            by
        --            have h₂₁ : (2 + Real.sqrt 3 : ℝ) > 1 := by
        --              nlinarith [Real.sqrt_nonneg 3, Real.sq_sqrt (show (0 : ℝ) ≤ 3 by norm_num)]
        --            exact
        --              calc
        --                (2 + Real.sqrt 3 : ℝ) ^ n ≥ (2 + Real.sqrt 3 : ℝ) ^ 1 := by
        --                  exact
        --                    pow_le_pow_right (by nlinarith [Real.sqrt_nonneg 3, Real.sq_sqrt (show (0 : ℝ) ≤ 3 by norm_num)])
        --                      (by linarith)
        --                _ = 2 + Real.sqrt 3 := by norm_num
        --                _ > 1 := by nlinarith [Real.sqrt_nonneg 3, Real.sq_sqrt (show (0 : ℝ) ≤ 3 by norm_num)]
        --          nlinarith [Real.sqrt_nonneg 3, Real.sq_sqrt (show (0 : ℝ) ≤ 3 by norm_num)]
        --        }) <;>
        --    (try {simp_all [Nat.eq_zero_of_le_zero] <;> linarith
        --      })
        hole
    --    exact h₈ ⟨h₉, h₁₀, h₁₁, h₁₂⟩
    hole
  have h₂ : x + u * Real.sqrt 3 = (2 + Real.sqrt 3) ^ n:=
    by
    --  exfalso
    --  exact h₁
    norm_cast
  --  exact h₂
  norm_cast