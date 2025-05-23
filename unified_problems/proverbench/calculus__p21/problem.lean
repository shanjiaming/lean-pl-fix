theorem max_value_of_function_under_constraint :
  (x^2 + y^2 + z^2 = 1) → f (x, y, z) ≤ 1 ∧ (f (x, y, z) = 1 ↔ x = 1 / Real.sqrt 3 ∧ y = 1 / Real.sqrt 3 ∧ z = 1 / Real.sqrt 3) := by
  intro h
  have h₀ : f (x, y, z) ≤ 1 := by
    have h₁ : f (x, y, z) = x * y + y * z + z * x := rfl
    rw [h₁]
    have h₂ : 0 ≤ (x - y)^2 + (y - z)^2 + (z - x)^2 := by nlinarith
    nlinarith [sq_nonneg (x + y + z)]
  
  have h₁ : (f (x, y, z) = 1 ↔ x = 1 / Real.sqrt 3 ∧ y = 1 / Real.sqrt 3 ∧ z = 1 / Real.sqrt 3) := by
    constructor
    · -- Prove the forward direction: if f(x, y, z) = 1, then x = y = z = 1 / Real.sqrt 3
      intro h₂
      have h₃ : x * y + y * z + z * x = 1 := by simpa [f] using h₂
      have h₄ : (x - y) ^ 2 + (y - z) ^ 2 + (z - x) ^ 2 = 0 := by
        nlinarith [sq_nonneg (x + y + z)]
      have h₅ : x = y := by
        nlinarith [sq_nonneg (x - y), sq_nonneg (y - z), sq_nonneg (z - x)]
      have h₆ : y = z := by
        nlinarith [sq_nonneg (x - y), sq_nonneg (y - z), sq_nonneg (z - x)]
      have h₇ : z = x := by
        nlinarith [sq_nonneg (x - y), sq_nonneg (y - z), sq_nonneg (z - x)]
      have h₈ : x = 1 / Real.sqrt 3 := by
        have h₉ : x = y := h₅
        have h₁₀ : y = z := h₆
        have h₁₁ : z = x := h₇
        have h₁₂ : x ^ 2 + y ^ 2 + z ^ 2 = 1 := h
        rw [h₉, h₁₀] at h₁₂
        have h₁₃ : 3 * x ^ 2 = 1 := by nlinarith
        have h₁₄ : x ^ 2 = 1 / 3 := by nlinarith
        have h₁₅ : x = 1 / Real.sqrt 3 ∨ x = - (1 / Real.sqrt 3) := by
          apply or_iff_not_imp_left.mpr
          intro h₁₆
          apply eq_of_sub_eq_zero
          apply mul_left_cancel₀ (sub_ne_zero.mpr h₁₆)
          rw [← sub_eq_zero]
          ring_nf at h₁₄ ⊢
          nlinarith [Real.sq_sqrt (show 0 ≤ 3 by norm_num), Real.sqrt_nonneg 3]
        cases h₁₅ with
        | inl h₁₅ =>
          exact h₁₅
        | inr h₁₅ =>
          exfalso
          -- Use nlinarith to derive a contradiction assuming x = - (1 / Real.sqrt 3)
          have h₁₆ : x * y + y * z + z * x = 1 := by simpa [f] using h₂
          have h₁₇ : x = y := h₅
          have h₁₈ : y = z := h₆
          have h₁₉ : z = x := h₇
          rw [h₁₅] at h₁₆ h₁₇ h₁₈ h₁₉
          norm_num [Real.sqrt_eq_iff_sq_eq, mul_comm, mul_assoc, mul_left_comm] at h₁₆ h₁₇ h₁₈ h₁₉ ⊢
          <;>
          (try ring_nf at h₁₆ h₁₇ h₁₈ h₁₉ ⊢) <;>
          (try nlinarith [Real.sq_sqrt (show (0 : ℝ) ≤ 3 by norm_num), Real.sqrt_nonneg 3])
            <;>
          (try linarith)
      have h₉ : y = 1 / Real.sqrt 3 := by
        have h₁₀ : x = y := h₅
        have h₁₁ : x = 1 / Real.sqrt 3 := h₈
        linarith
      have h₁₀ : z = 1 / Real.sqrt 3 := by
        have h₁₁ : y = z := h₆
        have h₁₂ : y = 1 / Real.sqrt 3 := h₉
        linarith
      exact ⟨h₈, h₉, h₁₀⟩
    · -- Prove the reverse direction: if x = y = z = 1 / Real.sqrt 3, then f(x, y, z) = 1
      rintro ⟨h₂, h₃, h₄⟩
      have h₅ : f (x, y, z) = 1 := by
        rw [f]
        rw [h₂, h₃, h₄]
        <;> ring_nf
        <;> field_simp [Real.sqrt_eq_iff_sq_eq, mul_comm, mul_assoc, mul_left_comm]
        <;> nlinarith [Real.sq_sqrt (show (0 : ℝ) ≤ 3 by norm_num), Real.sqrt_nonneg 3]
      exact h₅
  
  exact ⟨h₀, h₁⟩