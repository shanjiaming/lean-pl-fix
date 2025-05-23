theorem putnam_1965_b3
: {(a, b, c) : ℤ × ℤ × ℤ | a > 0 ∧ a ≤ b ∧ c > 0 ∧ a^2 + b^2 = c^2 ∧ (a*b : ℚ) / 2 = 2*(a + b + c)}.ncard = 3 := by
  have h_main : {(a, b, c) : ℤ × ℤ × ℤ | a > 0 ∧ a ≤ b ∧ c > 0 ∧ a^2 + b^2 = c^2 ∧ (a*b : ℚ) / 2 = 2*(a + b + c)} = {(9, 40, 41), (10, 24, 26), (12, 16, 20)} := by
    apply Set.Subset.antisymm
    · -- Prove that the left-hand side is a subset of the right-hand side.
      intro ⟨a, b, c⟩ h
      simp only [Set.mem_setOf_eq, Set.mem_insert_iff, Set.mem_singleton_iff] at h ⊢
      have h₁ : a > 0 := h.1
      have h₂ : a ≤ b := h.2.1
      have h₃ : c > 0 := h.2.2.1
      have h₄ : a^2 + b^2 = c^2 := h.2.2.2.1
      have h₅ : (a * b : ℚ) / 2 = 2 * (a + b + c) := h.2.2.2.2
      have h₆ : (a : ℤ) * b = 4 * (a + b + c) := by
        have h₅₁ : (a * b : ℚ) / 2 = 2 * (a + b + c) := h₅
        have h₅₂ : (a * b : ℚ) = 4 * (a + b + c : ℚ) := by
          ring_nf at h₅₁ ⊢
          <;> linarith
        have h₅₃ : (a : ℤ) * b = 4 * (a + b + c) := by
          norm_cast at h₅₂ ⊢
          <;>
          (try norm_num) <;>
          (try ring_nf at h₅₂ ⊢) <;>
          (try field_simp at h₅₂ ⊢) <;>
          (try norm_cast at h₅₂ ⊢) <;>
          (try ring_nf at h₅₂ ⊢) <;>
          (try norm_num at h₅₂ ⊢) <;>
          (try nlinarith)
          <;>
          linarith
        exact h₅₃
      have h₇ : a ≤ 16 := by
        by_contra h₇
        have h₈ : a ≥ 17 := by linarith
        have h₉ : b ≥ a := by linarith
        have h₁₀ : b ≥ 17 := by linarith
        have h₁₁ : (a : ℤ) * b ≥ 17 * a := by nlinarith
        have h₁₂ : (a : ℤ) * b ≥ 17 * a := by nlinarith
        have h₁₃ : (a : ℤ) * b ≥ 17 * a := by nlinarith
        have h₁₄ : 4 * (a + b + c) ≥ 17 * a := by nlinarith
        have h₁₅ : c ≥ b := by
          nlinarith [sq_nonneg (a - b), sq_nonneg (a + b), sq_nonneg (c - a), sq_nonneg (c - b)]
        nlinarith [sq_nonneg (a - b), sq_nonneg (a + b), sq_nonneg (c - a), sq_nonneg (c - b)]
      -- We have established that `a ≤ 16`. Now, we need to check possible values of `a` and `b`.
      have h₈ : a ≤ 16 := by linarith
      have h₉ : b ≥ a := by linarith
      have h₁₀ : (a : ℤ) * b = 4 * (a + b + c) := by assumption
      have h₁₁ : a > 0 := by assumption
      have h₁₂ : a ≤ b := by assumption
      have h₁₃ : c > 0 := by assumption
      have h₁₄ : a^2 + b^2 = c^2 := by assumption
      -- We now check the possible values of `a` and `b` to find the valid triples.
      interval_cases a <;> norm_num at h₆ h₄ h₁₀ ⊢ <;>
        (try omega) <;>
        (try
          {
            rcases b with (_ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | b) <;>
            norm_num at h₆ h₄ h₁₀ ⊢ <;>
            (try omega) <;>
            (try
              {
                rcases c with (_ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | c) <;>
                norm_num at h₆ h₄ h₁₀ ⊢ <;>
                (try omega) <;>
                (try
                  {
                    ring_nf at h₆ h₄ ⊢
                    <;> norm_cast at h₆ h₄ ⊢
                    <;> omega
                  })
              })
          }) <;>
        (try
          {
            rcases b with (_ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | b) <;>
            norm_num at h₆ h₄ h₁₀ ⊢ <;>
            (try omega) <;>
            (try
              {
                rcases c with (_ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | c) <;>
                norm_num at h₆ h₄ h₁₀ ⊢ <;>
                (try omega) <;>
                (try
                  {
                    ring_nf at h₆ h₄ ⊢
                    <;> norm_cast at h₆ h₄ ⊢
                    <;> omega
                  })
              })
          }) <;>
        (try
          {
            simp_all [Prod.ext_iff]
            <;> norm_num <;>
            (try omega) <;>
            (try nlinarith)
          })
    · -- Prove that the right-hand side is a subset of the left-hand side.
      intro ⟨a, b, c⟩ h
      simp only [Set.mem_setOf_eq, Set.mem_insert_iff, Set.mem_singleton_iff] at h ⊢
      rcases h with (⟨rfl, rfl, rfl⟩ | ⟨rfl, rfl, rfl⟩ | ⟨rfl, rfl, rfl⟩) <;>
      norm_num <;>
      (try ring_nf) <;>
      (try norm_num) <;>
      (try nlinarith)
  have h_final : {(a, b, c) : ℤ × ℤ × ℤ | a > 0 ∧ a ≤ b ∧ c > 0 ∧ a^2 + b^2 = c^2 ∧ (a*b : ℚ) / 2 = 2*(a + b + c)}.ncard = 3 := by
    rw [h_main]
    norm_num
  exact h_final