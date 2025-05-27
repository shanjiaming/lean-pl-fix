theorem aime_2025i_p9 (x y x' y' : ℝ) (hx : 0 < x) (hy : y < 0)
    (hx' : x' = x * Real.cos (Real.pi / 3) + y * Real.sin (Real.pi / 3))
    (hy' : y' = - x * Real.sin (Real.pi / 3) + y * Real.cos (Real.pi / 3))
    (h₀ : y = (x ^ 2) - 4) (h₁ : y' = (x' ^ 2) - 4) :
    ∃ (a b c d : ℕ), 0 < a ∧ 0 < b ∧ 0 < c ∧ Nat.Coprime a c ∧
    y = (a - Real.sqrt b) / c ∧ a + b + c = 62 := by
  have h₂ : False := by
    have h₃ : Real.cos (Real.pi / 3) = 1 / 2 := by norm_num [Real.cos_pi_div_three]
    have h₄ : Real.sin (Real.pi / 3) = Real.sqrt 3 / 2 := by norm_num [Real.sin_pi_div_three]
    rw [h₃, h₄] at hx' hy'
    have h₅ : x' = x * (1 / 2 : ℝ) + y * (Real.sqrt 3 / 2) := by
      rw [hx']
      <;> ring
    have h₆ : y' = -x * (Real.sqrt 3 / 2) + y * (1 / 2 : ℝ) := by
      rw [hy']
      <;> ring
    rw [h₅, h₆] at h₁
    have h₇ : y = (x ^ 2 - 4 : ℝ) := by
      linarith
    have h₈ : -x * (Real.sqrt 3 / 2) + y * (1 / 2 : ℝ) = (x * (1 / 2 : ℝ) + y * (Real.sqrt 3 / 2)) ^ 2 - 4 := by
      linarith
    have h₉ : x = Real.sqrt 3 := by
      have h₉₁ : x = Real.sqrt 3 := by
        rw [h₇] at h₈
        have h₉₂ : -x * (Real.sqrt 3 / 2) + (x ^ 2 - 4 : ℝ) * (1 / 2 : ℝ) = (x * (1 / 2 : ℝ) + (x ^ 2 - 4 : ℝ) * (Real.sqrt 3 / 2)) ^ 2 - 4 := by
          linarith
        have h₉₃ : (x * (1 / 2 : ℝ) + (x ^ 2 - 4 : ℝ) * (Real.sqrt 3 / 2)) ^ 2 - 4 = -x * (Real.sqrt 3 / 2) + (x ^ 2 - 4 : ℝ) * (1 / 2 : ℝ) := by linarith
        have h₉₄ : (x : ℝ) > 0 := by positivity
        -- Use the fact that the square root of 3 is irrational to deduce x = sqrt 3
        have h₉₅ : x = Real.sqrt 3 := by
          have h₉₅₁ : (x : ℝ) ^ 2 = 3 := by
            nlinarith [Real.sq_sqrt (show (0 : ℝ) ≤ 3 from by norm_num),
              Real.sqrt_nonneg 3,
              sq_nonneg (x - Real.sqrt 3),
              sq_nonneg (x + Real.sqrt 3),
              sq_nonneg (x - 2),
              sq_nonneg (x + 2),
              sq_nonneg (x ^ 2 - 2)]
          have h₉₅₂ : x > 0 := by positivity
          nlinarith [Real.sqrt_nonneg 3, Real.sq_sqrt (show (0 : ℝ) ≤ 3 from by norm_num)]
        exact h₉₅
      exact h₉₁
    have h₁₀ : y = -1 := by
      rw [h₉] at h₇
      have h₁₀₁ : y = -1 := by
        have h₁₀₂ : (Real.sqrt 3 : ℝ) ^ 2 = 3 := by norm_num [Real.sqrt_eq_iff_sq_eq]
        nlinarith [Real.sqrt_nonneg 3, Real.sq_sqrt (show (0 : ℝ) ≤ 3 from by norm_num)]
      exact h₁₀₁
    have h₁₁ : x' = 0 := by
      rw [h₅, h₉, h₁₀]
      <;> ring_nf
      <;> nlinarith [Real.sqrt_nonneg 3, Real.sq_sqrt (show (0 : ℝ) ≤ 3 from by norm_num)]
    have h₁₂ : y' = -2 := by
      rw [h₆, h₉, h₁₀]
      <;> ring_nf
      <;> nlinarith [Real.sqrt_nonneg 3, Real.sq_sqrt (show (0 : ℝ) ≤ 3 from by norm_num)]
    have h₁₃ : y' = (x' ^ 2 - 4 : ℝ) := by linarith
    rw [h₁₁, h₁₂] at h₁₃
    norm_num at h₁₃
    <;> linarith
  
  have h₃ : ∃ (a b c d : ℕ), 0 < a ∧ 0 < b ∧ 0 < c ∧ Nat.Coprime a c ∧ y = (a - Real.sqrt b) / c ∧ a + b + c = 62 := by
    exfalso
    exact h₂
  
  exact h₃