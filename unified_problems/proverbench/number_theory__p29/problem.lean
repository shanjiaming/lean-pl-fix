theorem rational_solution_equivalence (h : x ≠ 1) :
  (x^2 - d * y^2 = 1) ↔ ∃ t : ℚ, x = (d * t^2 + 1) / (d * t^2 - 1) ∧ y = 2 * t / (d * t^2 - 1) := by
  have h_main : (x^2 - d * y^2 = 1) → ∃ t : ℚ, x = (d * t^2 + 1) / (d * t^2 - 1) ∧ y = 2 * t / (d * t^2 - 1) := by
    intro h₁
    have h₂ : x ≠ 1 := h
    -- Define t = y / (x - 1)
    have h₃ : y = 0 → x ^ 2 - ↑d * y ^ 2 = 1 → ∃ t : ℚ, x = (↑d * t ^ 2 + 1) / (↑d * t ^ 2 - 1) ∧ y = 2 * t / (↑d * t ^ 2 - 1) := by
      intro h₄ h₅
      have h₆ : x ^ 2 = 1 := by
        simp [h₄] at h₅ ⊢
        <;> norm_num at h₅ ⊢ <;>
        (try simp_all) <;>
        (try nlinarith) <;>
        (try linarith) <;>
        (try nlinarith)
      have h₇ : x = 1 ∨ x = -1 := by
        have h₈ : x ^ 2 = 1 := h₆
        have h₉ : x = 1 ∨ x = -1 := by
          apply or_iff_not_imp_left.mpr
          intro h₁₀
          apply eq_of_sub_eq_zero
          apply mul_left_cancel₀ (sub_ne_zero.mpr h₁₀)
          nlinarith
        exact h₉
      cases h₇ with
      | inl h₇ =>
        exfalso
        exact h₂ (by simp [h₇])
      | inr h₇ =>
        use 0
        constructor
        · simp [h₄, h₇]
          <;> field_simp [h₂, sub_eq_zero, add_eq_zero_iff_eq_neg] at h₁ ⊢ <;>
            ring_nf at h₁ ⊢ <;>
            nlinarith
        · simp [h₄, h₇]
          <;> field_simp [h₂, sub_eq_zero, add_eq_zero_iff_eq_neg] at h₁ ⊢ <;>
            ring_nf at h₁ ⊢ <;>
            nlinarith
    by_cases h₄ : y = 0
    · exact h₃ h₄ h₁
    · -- Case when y ≠ 0
      have h₅ : x - 1 ≠ 0 := by
        intro h₅
        apply h₂
        linarith
      -- Define t = y / (x - 1)
      use y / (x - 1)
      have h₆ : x = (↑d * (y / (x - 1)) ^ 2 + 1) / (↑d * (y / (x - 1)) ^ 2 - 1) := by
        have h₇ : x ^ 2 - ↑d * y ^ 2 = 1 := h₁
        have h₈ : x ≠ 1 := h₂
        have h₉ : y ≠ 0 := h₄
        have h₁₀ : x - 1 ≠ 0 := h₅
        have h₁₁ : ↑d * (y / (x - 1)) ^ 2 - 1 ≠ 0 := by
          by_contra h₁₁
          have h₁₂ : ↑d * (y / (x - 1)) ^ 2 = 1 := by
            linarith
          have h₁₃ : x ^ 2 - ↑d * y ^ 2 = 1 := h₁
          have h₁₄ : x = 1 := by
            field_simp [h₅, sub_eq_zero, add_eq_zero_iff_eq_neg] at h₁₂ h₁₃ ⊢
            <;> ring_nf at h₁₂ h₁₃ ⊢
            <;> nlinarith [sq_pos_of_ne_zero (sub_ne_zero.mpr h₂), sq_pos_of_ne_zero h₉]
          contradiction
        have h₁₂ : x = (↑d * (y / (x - 1)) ^ 2 + 1) / (↑d * (y / (x - 1)) ^ 2 - 1) := by
          field_simp [h₁₁, h₅, sub_eq_zero, add_eq_zero_iff_eq_neg] at h₁ ⊢
          <;> ring_nf at h₁ ⊢
          <;> nlinarith [sq_pos_of_ne_zero (sub_ne_zero.mpr h₂), sq_pos_of_ne_zero h₉]
        exact h₁₂
      have h₇ : y = 2 * (y / (x - 1)) / (↑d * (y / (x - 1)) ^ 2 - 1) := by
        have h₈ : x ^ 2 - ↑d * y ^ 2 = 1 := h₁
        have h₉ : x ≠ 1 := h₂
        have h₁₀ : y ≠ 0 := h₄
        have h₁₁ : x - 1 ≠ 0 := h₅
        have h₁₂ : ↑d * (y / (x - 1)) ^ 2 - 1 ≠ 0 := by
          by_contra h₁₂
          have h₁₃ : ↑d * (y / (x - 1)) ^ 2 = 1 := by
            linarith
          have h₁₄ : x ^ 2 - ↑d * y ^ 2 = 1 := h₁
          have h₁₅ : x = 1 := by
            field_simp [h₅, sub_eq_zero, add_eq_zero_iff_eq_neg] at h₁₃ h₁₄ ⊢
            <;> ring_nf at h₁₃ h₁₄ ⊢
            <;> nlinarith [sq_pos_of_ne_zero (sub_ne_zero.mpr h₂), sq_pos_of_ne_zero h₁₀]
          contradiction
        have h₁₃ : y = 2 * (y / (x - 1)) / (↑d * (y / (x - 1)) ^ 2 - 1) := by
          field_simp [h₁₂, h₅, sub_eq_zero, add_eq_zero_iff_eq_neg] at h₁ ⊢
          <;> ring_nf at h₁ ⊢
          <;> nlinarith [sq_pos_of_ne_zero (sub_ne_zero.mpr h₂), sq_pos_of_ne_zero h₁₀]
        exact h₁₃
      exact ⟨h₆, h₇⟩
  
  have h_main' : (∃ t : ℚ, x = (d * t^2 + 1) / (d * t^2 - 1) ∧ y = 2 * t / (d * t^2 - 1)) → (x^2 - d * y^2 = 1) := by
    rintro ⟨t, ht1, ht2⟩
    have h₁ : x = (d * t ^ 2 + 1) / (d * t ^ 2 - 1) := ht1
    have h₂ : y = 2 * t / (d * t ^ 2 - 1) := ht2
    rw [h₁, h₂]
    by_cases h₃ : (d : ℚ) * t ^ 2 - 1 = 0
    · -- Case: d * t ^ 2 - 1 = 0
      have h₄ : (d : ℚ) * t ^ 2 - 1 = 0 := h₃
      have h₅ : (d : ℚ) * t ^ 2 = 1 := by linarith
      have h₆ : ((d : ℚ) * t ^ 2 + 1 : ℚ) / ((d : ℚ) * t ^ 2 - 1 : ℚ) = 0 := by
        rw [h₄]
        <;> simp [div_eq_mul_inv] <;> ring_nf <;> norm_num
      have h₇ : (2 : ℚ) * t / ((d : ℚ) * t ^ 2 - 1 : ℚ) = 0 := by
        rw [h₄]
        <;> simp [div_eq_mul_inv] <;> ring_nf <;> norm_num
      rw [h₆, h₇]
      <;> simp_all [sub_eq_add_neg]
      <;> ring_nf at *
      <;> norm_num at *
      <;> simp_all [sub_eq_add_neg]
      <;> nlinarith
    · -- Case: d * t ^ 2 - 1 ≠ 0
      have h₄ : (d : ℚ) * t ^ 2 - 1 ≠ 0 := h₃
      have h₅ : (d : ℚ) * t ^ 2 - 1 ≠ 0 := h₄
      field_simp [h₄, h₅, sub_eq_zero, add_eq_zero_iff_eq_neg] at *
      <;> ring_nf at *
      <;> nlinarith [sq_nonneg (t : ℚ), sq_nonneg (t ^ 2 : ℚ), sq_nonneg (d * t ^ 2 : ℚ)]
  
  refine' ⟨h_main, h_main'⟩