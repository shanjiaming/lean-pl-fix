lemma log_le_zero_iff (x : ℝ) (hx : x > 0) : log x ≤ 0 ↔ x ≤ 1 := by
  have h₁ : log x ≤ 0 ↔ x ≤ 1 := by
    constructor
    · -- Prove the forward direction: if log x ≤ 0, then x ≤ 1
      intro h
      by_contra h₂
      -- If x > 1, then log x > 0, which contradicts h
      have h₃ : x > 1 := by linarith
      have h₄ : log x > 0 := log_pos h₃
      linarith
    · -- Prove the reverse direction: if x ≤ 1, then log x ≤ 0
      intro h
      by_cases h₂ : x < 1
      · -- Case: x < 1
        have h₃ : log x < 0 := log_neg hx h₂
        linarith
      · -- Case: x = 1
        have h₃ : x = 1 := by
          by_contra h₄
          have h₅ : x > 1 := by
            by_cases h₅ : x > 1
            · exact h₅
            · have h₆ : x ≤ 1 := by linarith
              have h₇ : x ≠ 1 := h₄
              have h₈ : x < 1 := by
                contrapose! h₇
                linarith
              linarith
          linarith
        rw [h₃]
        norm_num
        <;>
        simp_all [log_one]
        <;>
        linarith
  exact h₁