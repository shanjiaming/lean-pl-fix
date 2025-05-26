theorem inequality_solution (x : ℝ) : (1 - log x) / x^2 < 0 ↔ x > exp 1 := by
  have h_main : (1 - log x) / x^2 < 0 ↔ x > exp 1 := by
    constructor
    · -- Prove the forward direction: (1 - log x) / x^2 < 0 → x > exp 1
      intro h
      by_contra h₁
      -- Assume x ≤ exp 1 and derive a contradiction
      have h₂ : x ≤ exp 1 := by linarith
      by_cases hx : x ≤ 0
      · -- Case: x ≤ 0
        have h₃ : log x = 0 := by
          exact log_eq_zero_of_nonpos (by linarith)
        have h₄ : (1 - log x) / x ^ 2 = 1 / x ^ 2 := by
          rw [h₃]
          <;> ring
        rw [h₄] at h
        have h₅ : 1 / (x ^ 2 : ℝ) ≥ 0 := by
          apply div_nonneg
          · norm_num
          · exact sq_nonneg x
        linarith
      · -- Case: x > 0
        have h₃ : x > 0 := by linarith
        have h₄ : x ≤ exp 1 := by linarith
        have h₅ : log x ≤ 1 := by
          have h₅₁ : log x ≤ log (exp 1) := log_le_log (by positivity) h₄
          have h₅₂ : log (exp 1) = 1 := by
            rw [log_exp]
          linarith
        have h₆ : 1 - log x ≥ 0 := by linarith
        have h₇ : (1 - log x) / x ^ 2 ≥ 0 := by
          apply div_nonneg h₆
          exact sq_nonneg x
        linarith
    · -- Prove the backward direction: x > exp 1 → (1 - log x) / x^2 < 0
      intro h
      have h₁ : x > 0 := by
        linarith [exp_pos 1]
      have h₂ : log x > 1 := by
        have h₂₁ : log x > log (exp 1) := log_lt_log (by positivity) h
        have h₂₂ : log (exp 1) = 1 := by
          rw [log_exp]
        linarith
      have h₃ : 1 - log x < 0 := by linarith
      have h₄ : (1 - log x) / x ^ 2 < 0 := by
        apply div_neg_of_neg_of_pos h₃
        exact by positivity
      exact h₄
  exact h_main