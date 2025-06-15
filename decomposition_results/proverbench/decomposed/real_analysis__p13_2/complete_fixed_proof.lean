theorem two_le_log_iff (x : ℝ) (hx : x > 0) : 2 ≤ log x ↔ exp 2 ≤ x := by
  have h_imp : 2 ≤ log x → exp 2 ≤ x := by
    intro h
    have h₁ : exp 2 ≤ exp (log x) := by
      admit
    have h₂ : exp (log x) = x := by
      admit
    admit
  
  have h_conv : exp 2 ≤ x → 2 ≤ log x := by
    intro h
    have h₁ : log (exp 2) ≤ log x := by
      admit
    have h₂ : log (exp 2) = 2 := by
      admit
    admit
  
  have h_main : 2 ≤ log x ↔ exp 2 ≤ x := by
    admit
  
  admit