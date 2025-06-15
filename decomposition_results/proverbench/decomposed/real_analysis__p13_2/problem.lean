theorem two_le_log_iff (x : ℝ) (hx : x > 0) : 2 ≤ log x ↔ exp 2 ≤ x := by
  have h_imp : 2 ≤ log x → exp 2 ≤ x := by
    intro h
    have h₁ : exp 2 ≤ exp (log x) := by
      apply exp_le_exp.2
      exact h
    have h₂ : exp (log x) = x := by
      rw [exp_log hx]
    rw [h₂] at h₁
    exact h₁
  
  have h_conv : exp 2 ≤ x → 2 ≤ log x := by
    intro h
    have h₁ : log (exp 2) ≤ log x := by
      apply log_le_log
      · positivity
      · exact h
    have h₂ : log (exp 2) = 2 := by
      rw [log_exp]
    rw [h₂] at h₁
    exact h₁
  
  have h_main : 2 ≤ log x ↔ exp 2 ≤ x := by
    constructor
    · -- Prove the forward direction: if 2 ≤ log x, then exp 2 ≤ x
      intro h
      exact h_imp h
    · -- Prove the backward direction: if exp 2 ≤ x, then 2 ≤ log x
      intro h
      exact h_conv h
  
  exact h_main