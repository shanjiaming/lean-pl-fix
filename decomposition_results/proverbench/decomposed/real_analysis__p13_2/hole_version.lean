macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem two_le_log_iff (x : ℝ) (hx : x > 0) : 2 ≤ log x ↔ exp 2 ≤ x := by
  have h_imp : 2 ≤ log x → exp 2 ≤ x := by
    intro h
    have h₁ : exp 2 ≤ exp (log x) := by
      hole_3
    have h₂ : exp (log x) = x := by
      hole_4
    hole_2
  
  have h_conv : exp 2 ≤ x → 2 ≤ log x := by
    intro h
    have h₁ : log (exp 2) ≤ log x := by
      hole_6
    have h₂ : log (exp 2) = 2 := by
      hole_7
    hole_5
  
  have h_main : 2 ≤ log x ↔ exp 2 ≤ x := by
    hole_8
  
  hole_1