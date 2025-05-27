theorem two_le_log_iff (x : ℝ) (hx : x > 0) : 2 ≤ log x ↔ rexp 2 ≤ x :=
  by
  have h_imp : 2 ≤ log x → exp 2 ≤ x := by sorry
  have h_conv : exp 2 ≤ x → 2 ≤ log x := by sorry
  have h_main : 2 ≤ log x ↔ exp 2 ≤ x := by sorry
  --  exact h_main
  hole