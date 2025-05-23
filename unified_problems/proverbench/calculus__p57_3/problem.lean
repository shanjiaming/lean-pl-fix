theorem critical_points : ∃ a b : ℝ, a < b ∧
  a = (21 - sqrt 497) / 4 ∧
  b = (21 + sqrt 497) / 4 ∧
  ∀ x, deriv (deriv f) x = 0 ↔ x = a ∨ x = b := by
  have h_main : ∃ (a b : ℝ), a < b ∧ a = (21 - Real.sqrt 497) / 4 ∧ b = (21 + Real.sqrt 497) / 4 ∧ ∀ (x : ℝ), deriv (deriv f) x = 0 ↔ x = a ∨ x = b := by
    use (21 - Real.sqrt 497) / 4, (21 + Real.sqrt 497) / 4
    constructor
    · -- Prove a < b
      have h₁ : Real.sqrt 497 > 0 := Real.sqrt_pos.mpr (by norm_num)
      nlinarith [Real.sq_sqrt (show 0 ≤ 497 by norm_num)]
    constructor
    · -- Prove a = (21 - Real.sqrt 497) / 4
      rfl
    constructor
    · -- Prove b = (21 + Real.sqrt 497) / 4
      rfl
    · -- Prove ∀ (x : ℝ), deriv (deriv f) x = 0 ↔ x = a ∨ x = b
      intro x
      have h₁ : deriv (deriv f) x = (50 * x ^ 2 - 525 * x - 175) / ((5 * x ^ 2 + 35) ^ (5 / 2)) := by
        rw [f_second_deriv]
        <;> ring_nf
        <;> field_simp
        <;> ring_nf
      rw [h₁]
      constructor
      · -- Prove the forward direction: if (50 * x ^ 2 - 525 * x - 175) / ((5 * x ^ 2 + 35) ^ (5 / 2)) = 0, then x = a ∨ x = b
        intro h
        have h₂ : (50 * x ^ 2 - 525 * x - 175 : ℝ) = 0 := by
          have h₃ : (5 * x ^ 2 + 35 : ℝ) > 0 := by nlinarith [sq_nonneg x]
          have h₄ : ((5 * x ^ 2 + 35 : ℝ) : ℝ) ^ (5 / 2 : ℕ) > 0 := by positivity
          have h₅ : (50 * x ^ 2 - 525 * x - 175 : ℝ) = 0 := by
            by_contra h₅
            have h₆ : (50 * x ^ 2 - 525 * x - 175 : ℝ) ≠ 0 := h₅
            have h₇ : (50 * x ^ 2 - 525 * x - 175 : ℝ) / ((5 * x ^ 2 + 35 : ℝ) ^ (5 / 2 : ℕ)) ≠ 0 := by
              positivity
            contradiction
          exact h₅
        have h₃ : x = (21 - Real.sqrt 497) / 4 ∨ x = (21 + Real.sqrt 497) / 4 := by
          have h₄ : 2 * x ^ 2 - 21 * x - 7 = 0 := by
            ring_nf at h₂ ⊢
            nlinarith [Real.sq_sqrt (show 0 ≤ 497 by norm_num)]
          have h₅ : x = (21 - Real.sqrt 497) / 4 ∨ x = (21 + Real.sqrt 497) / 4 := by
            have h₆ : x = (21 - Real.sqrt 497) / 4 ∨ x = (21 + Real.sqrt 497) / 4 := by
              apply or_iff_not_imp_left.mpr
              intro h₇
              apply mul_left_cancel₀ (sub_ne_zero.mpr h₇)
              nlinarith [Real.sq_sqrt (show 0 ≤ 497 by norm_num),
                Real.sqrt_nonneg 497, sq_nonneg (x - (21 - Real.sqrt 497) / 4)]
            exact h₆
          exact h₅
        cases h₃ with
        | inl h₃ =>
          simp_all [h₃]
          <;> ring_nf at * <;> norm_num
          <;> linarith [Real.sqrt_nonneg 497]
        | inr h₃ =>
          simp_all [h₃]
          <;> ring_nf at * <;> norm_num
          <;> linarith [Real.sqrt_nonneg 497]
      · -- Prove the reverse direction: if x = a ∨ x = b, then (50 * x ^ 2 - 525 * x - 175) / ((5 * x ^ 2 + 35) ^ (5 / 2)) = 0
        intro h
        cases h with
        | inl h =>
          rw [h]
          have h₂ : (50 * ((21 - Real.sqrt 497) / 4) ^ 2 - 525 * ((21 - Real.sqrt 497) / 4) - 175 : ℝ) = 0 := by
            nlinarith [Real.sq_sqrt (show 0 ≤ 497 by norm_num), Real.sqrt_nonneg 497]
          have h₃ : (5 * ((21 - Real.sqrt 497) / 4) ^ 2 + 35 : ℝ) > 0 := by
            nlinarith [Real.sq_sqrt (show 0 ≤ 497 by norm_num), Real.sqrt_nonneg 497]
          have h₄ : ((5 * ((21 - Real.sqrt 497) / 4) ^ 2 + 35 : ℝ) : ℝ) ^ (5 / 2 : ℕ) > 0 := by positivity
          rw [div_eq_iff (by positivity)]
          <;> nlinarith [Real.sq_sqrt (show 0 ≤ 497 by norm_num), Real.sqrt_nonneg 497]
        | inr h =>
          rw [h]
          have h₂ : (50 * ((21 + Real.sqrt 497) / 4) ^ 2 - 525 * ((21 + Real.sqrt 497) / 4) - 175 : ℝ) = 0 := by
            nlinarith [Real.sq_sqrt (show 0 ≤ 497 by norm_num), Real.sqrt_nonneg 497]
          have h₃ : (5 * ((21 + Real.sqrt 497) / 4) ^ 2 + 35 : ℝ) > 0 := by
            nlinarith [Real.sq_sqrt (show 0 ≤ 497 by norm_num), Real.sqrt_nonneg 497]
          have h₄ : ((5 * ((21 + Real.sqrt 497) / 4) ^ 2 + 35 : ℝ) : ℝ) ^ (5 / 2 : ℕ) > 0 := by positivity
          rw [div_eq_iff (by positivity)]
          <;> nlinarith [Real.sq_sqrt (show 0 ≤ 497 by norm_num), Real.sqrt_nonneg 497]
  exact h_main