theorem formal_statement (x y : ℤ) (hx : 2 < x) (hy : 2 < y) : ¬(∃ z : ℤ, (x ^ 2 + 1) = z * (y ^ 2 - 5)):=
  by
  --  intro h
  --  rcases h with ⟨z, hz⟩
  have h₁ : y = 3 → False:= by
    --  intro h_y_eq_3
    have h2 : y = 3 := h_y_eq_3
    --  rw [h2] at hz
    have h3 : (x ^ 2 + 1 : ℤ) = z * (3 ^ 2 - 5):= by -- -- ring_nf at hz ⊢; linarith
      linarith
    have h4 : (x ^ 2 + 1 : ℤ) = z * 4:= by -- -- ring_nf at h3 ⊢ <;> linarith
      linarith
    have h5 : (x ^ 2 + 1 : ℤ) % 4 = 0:= by -- omega
      omega
    have h6 : (x : ℤ) % 4 = 0 ∨ (x : ℤ) % 4 = 1 ∨ (x : ℤ) % 4 = 2 ∨ (x : ℤ) % 4 = 3:= by -- omega
      omega
    --  rcases h6 with (h6 | h6 | h6 | h6)
    ·
      have h7 : (x ^ 2 + 1 : ℤ) % 4 = 1:= by
        have h8 : (x : ℤ) % 4 = 0 := h6
        have h9 : (x ^ 2 : ℤ) % 4 = 0:= by
          have h10 : (x : ℤ) % 4 = 0 := h8
          have h11 : (x ^ 2 : ℤ) % 4 = 0:= by -- norm_num [pow_two, Int.mul_emod, h10]
            hole
          --  exact h11
          linarith
        have h12 : (x ^ 2 + 1 : ℤ) % 4 = 1:= by -- omega
          omega
        --  exact h12
        linarith
    --    omega
    ·
      have h7 : (x ^ 2 + 1 : ℤ) % 4 = 2 := by sorry
    --    omega
    ·
      have h7 : (x ^ 2 + 1 : ℤ) % 4 = 1 := by sorry
    --    omega
    ·
      have h7 : (x ^ 2 + 1 : ℤ) % 4 = 2 := by sorry
    --    omega
    hole
  have h₂ : y = 4 → False:= by
    --  intro h₁
    have h₂ : y = 4 := h₁
    --  rw [h₂] at hz
    have h₃ : (x ^ 2 + 1 : ℤ) = z * (4 ^ 2 - 5):= by ring_nf at hz ⊢ <;> linarith
      hole
    have h₄ : (x ^ 2 + 1 : ℤ) = z * 11:= by ring_nf at h₃ ⊢ <;> linarith
      hole
    have h₅ :
      (x : ℤ) % 11 = 0 ∨
        (x : ℤ) % 11 = 1 ∨
          (x : ℤ) % 11 = 2 ∨
            (x : ℤ) % 11 = 3 ∨
              (x : ℤ) % 11 = 4 ∨
                (x : ℤ) % 11 = 5 ∨
                  (x : ℤ) % 11 = 6 ∨ (x : ℤ) % 11 = 7 ∨ (x : ℤ) % 11 = 8 ∨ (x : ℤ) % 11 = 9 ∨ (x : ℤ) % 11 = 10 := by sorry
    --  rcases h₅ with (h₅ | h₅ | h₅ | h₅ | h₅ | h₅ | h₅ | h₅ | h₅ | h₅ | h₅)
    ·
      have h₆ : (x : ℤ) % 11 = 0 := h₅
      have h₇ : (x ^ 2 + 1 : ℤ) % 11 = 1:= by
        have h₈ : (x : ℤ) % 11 = 0 := h₆
        have h₉ : (x ^ 2 : ℤ) % 11 = 0:= by norm_num [pow_two, Int.mul_emod, h₈]
          hole
        omega
        hole
    --    omega
    ·
      have h₆ : (x : ℤ) % 11 = 1 := h₅
      have h₇ : (x ^ 2 + 1 : ℤ) % 11 = 2 := by sorry
    --    omega
    ·
      have h₆ : (x : ℤ) % 11 = 2 := h₅
      have h₇ : (x ^ 2 + 1 : ℤ) % 11 = 5 := by sorry
    --    omega
    ·
      have h₆ : (x : ℤ) % 11 = 3 := h₅
      have h₇ : (x ^ 2 + 1 : ℤ) % 11 = 10 := by sorry
    --    omega
    ·
      have h₆ : (x : ℤ) % 11 = 4 := h₅
      have h₇ : (x ^ 2 + 1 : ℤ) % 11 = 6 := by sorry
    --    omega
    ·
      have h₆ : (x : ℤ) % 11 = 5 := h₅
      have h₇ : (x ^ 2 + 1 : ℤ) % 11 = 4 := by sorry
    --    omega
    ·
      have h₆ : (x : ℤ) % 11 = 6 := h₅
      have h₇ : (x ^ 2 + 1 : ℤ) % 11 = 4 := by sorry
    --    omega
    ·
      have h₆ : (x : ℤ) % 11 = 7 := h₅
      have h₇ : (x ^ 2 + 1 : ℤ) % 11 = 6 := by sorry
    --    omega
    ·
      have h₆ : (x : ℤ) % 11 = 8 := h₅
      have h₇ : (x ^ 2 + 1 : ℤ) % 11 = 10 := by sorry
    --    omega
    ·
      have h₆ : (x : ℤ) % 11 = 9 := h₅
      have h₇ : (x ^ 2 + 1 : ℤ) % 11 = 5 := by sorry
    --    omega
    ·
      have h₆ : (x : ℤ) % 11 = 10 := h₅
      have h₇ : (x ^ 2 + 1 : ℤ) % 11 = 2 := by sorry
    --    omega
    hole
  have h₃ : y ≥ 5 → False:= by
    --  intro h_y
    have h₄ : y ≥ 5 := h_y
    have h₅ : (y : ℤ) ≥ 5:= by -- exact_mod_cast h₄
      linarith
    have h₆ : y ^ 2 - 5 > 0:= by -- nlinarith
      nlinarith
    have h₇ : (x : ℤ) ≥ 3:= by -- linarith
      linarith
    have h₈ : (y : ℤ) ≥ 5:= by -- linarith
      linarith
    have h₉ : (y : ℤ) ^ 2 - 5 > 0:= by -- nlinarith
      linarith
    have h₁₀ : (x : ℤ) ^ 2 + 1 > 0:= by -- nlinarith
      nlinarith
    have h₁₁ : z > 0:= by
      --  by_contra h₀
      have h₁ : z ≤ 0:= by -- linarith
        linarith
      have h₂ : (x : ℤ) ^ 2 + 1 ≤ 0:= by nlinarith [sq_nonneg (y : ℤ), sq_nonneg (x : ℤ)]
        hole
      --  nlinarith [sq_nonneg (y : ℤ), sq_nonneg (x : ℤ)]
      linarith
    have h₁₂ : (y : ℤ) ^ 2 - 5 ≥ 20:= by -- nlinarith
      nlinarith
    have h₁₃ : z ≥ 1:= by -- linarith
      linarith
    have h₁₄ : z * ((y : ℤ) ^ 2 - 5) ≥ z * 20:= by -- nlinarith
      nlinarith
    have h₁₅ : (x : ℤ) ^ 2 + 1 < z * ((y : ℤ) ^ 2 - 5) ∨ (x : ℤ) ^ 2 + 1 = z * ((y : ℤ) ^ 2 - 5):=
      by
      --  by_cases h₁₅ : (x : ℤ) ^ 2 + 1 < z * ((y : ℤ) ^ 2 - 5)
      --  · exact Or.inl h₁₅
      ·
        have h₁₅' : (x : ℤ) ^ 2 + 1 ≥ z * ((y : ℤ) ^ 2 - 5):= by -- linarith
          linarith
        have h₁₅'' : (x : ℤ) ^ 2 + 1 = z * ((y : ℤ) ^ 2 - 5):= by -- nlinarith
          linarith
      --    exact Or.inr h₁₅''
      hole
    --  cases h₁₅ with
    --  | inl h₁₅ =>
    --    have h₁₆ : (x : ℤ) ^ 2 + 1 < z * ((y : ℤ) ^ 2 - 5) := h₁₅
    --    nlinarith
    --  | inr h₁₅ =>
    --    have h₁₆ : (x : ℤ) ^ 2 + 1 = z * ((y : ℤ) ^ 2 - 5) := h₁₅
    --    have h₁₇ : (x : ℤ) ^ 2 + 1 ≥ z * 20 := by nlinarith
    --    have h₁₈ : z ≤ (x : ℤ) ^ 2 / 20 := by
    --      have h₁₈₁ : z ≤ (x : ℤ) ^ 2 / 20 := by omega
    --      exact h₁₈₁
    --    have h₁₉ : (x : ℤ) < z * 5 := by
    --      by_contra h₁₉
    --      have h₂₀ : (x : ℤ) ≥ z * 5 := by linarith
    --      have h₂₁ : (x : ℤ) ^ 2 ≥ (z * 5 : ℤ) ^ 2 := by nlinarith
    --      have h₂₂ : (x : ℤ) ^ 2 + 1 ≥ (z * 5 : ℤ) ^ 2 + 1 := by nlinarith
    --      have h₂₃ : (z * 5 : ℤ) ^ 2 + 1 > z * ((y : ℤ) ^ 2 - 5) :=
    --        by
    --        have h₂₄ : (z : ℤ) ≥ 1 := by linarith
    --        nlinarith [sq_nonneg (y : ℤ), sq_nonneg (x : ℤ)]
    --      nlinarith
    --    have h₂₀ : (x : ℤ) < z * 5 := h₁₉
    --    have h₂₁ : z ≤ (x : ℤ) := by
    --      by_contra h₂₁
    --      have h₂₂ : z > (x : ℤ) := by linarith
    --      have h₂₃ : z ≥ (x : ℤ) + 1 := by linarith
    --      have h₂₄ : z * ((y : ℤ) ^ 2 - 5) ≥ ((x : ℤ) + 1) * ((y : ℤ) ^ 2 - 5) := by nlinarith
    --      have h₂₅ : (x : ℤ) ^ 2 + 1 = z * ((y : ℤ) ^ 2 - 5) := by linarith
    --      have h₂₆ : (x : ℤ) ^ 2 + 1 ≥ ((x : ℤ) + 1) * ((y : ℤ) ^ 2 - 5) := by linarith
    --      have h₂₇ : (x : ℤ) ^ 2 + 1 ≥ ((x : ℤ) + 1) * ((y : ℤ) ^ 2 - 5) := by linarith
    --      have h₂₈ : (x : ℤ) ^ 2 + 1 ≥ ((x : ℤ) + 1) * ((y : ℤ) ^ 2 - 5) := by linarith
    --      nlinarith [sq_nonneg (y : ℤ), sq_nonneg (x : ℤ)]
    --    have h₂₂ : z ≤ (x : ℤ) := h₂₁
    --    have h₂₃ : (x : ℤ) < z * 5 := h₂₀
    --    have h₂₄ : z ≤ (x : ℤ) := h₂₁
    --    have h₂₅ : z ≥ 1 := by linarith
    --    have h₂₆ : (x : ℤ) ≥ 3 := by linarith
    --    have h₂₇ : z ≤ (x : ℤ) := h₂₁
    --    have h₂₈ : (x : ℤ) < z * 5 := h₂₀
    --    have h₂₉ : z ≤ (x : ℤ) := h₂₁
    --    have h₃₀ : (x : ℤ) ^ 2 + 1 = z * ((y : ℤ) ^ 2 - 5) := by linarith
    --    have h₃₁ : z ≥ 1 := by linarith
    --    have h₃₂ : (x : ℤ) ≥ 3 := by linarith
    --    have h₃₃ : z ≤ (x : ℤ) := h₂₁
    --    have h₃₄ : (x : ℤ) < z * 5 := h₂₀
    --    have h₃₅ : z ≤ (x : ℤ) ^ 2 / 20 := by omega
    --    have h₃₆ : z ≤ (x : ℤ) := h₂₁
    --    have h₃₇ : (x : ℤ) < z * 5 := h₂₀
    --    have h₃₈ : z ≤ (x : ℤ) := h₂₁
    --    have h₃₉ : z ≤ (x : ℤ) ^ 2 / 20 := by omega
    --    omega
    hole
  have h₄ : False:= by
    --  by_cases h₅ : y = 3
    ·
      have h₆ : y = 3 := h₅
      have h₇ : False := h₁ h₆
    --    exact h₇
    --  · by_cases h₈ : y = 4
      ·
        have h₉ : y = 4 := h₈
        have h₁₀ : False := h₂ h₉
    --      exact h₁₀
      ·
        have h₁₁ : y ≥ 5:= by
          have h₁₂ : y > 2 := hy
          have h₁₃ : y ≠ 3 := h₅
          have h₁₄ : y ≠ 4 := h₈
          have h₁₅ : y ≥ 5:= by
            --  by_contra h₁₅
            have h₁₆ : y ≤ 4:= by -- linarith
              hole
            have h₁₇ : y < 5:= by -- linarith
              linarith
            have h₁₈ : y > 2 := hy
            --  --  interval_cases y <;> norm_num at h₁₃ h₁₄ ⊢ <;> omega
            omega
          --  exact h₁₅
          linarith
        have h₁₆ : False := h₃ h₁₁
    --      exact h₁₆
    hole
  --  exact h₄
  hole