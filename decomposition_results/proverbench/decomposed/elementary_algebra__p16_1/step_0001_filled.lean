theorem isolate_r (r : ℝ) : given_equation r ↔ r = 7 :=
  by
  have h_forward : given_equation r → r = (7 : ℝ) := by sorry
  have h_backward : r = (7 : ℝ) → given_equation r := by sorry
  have h_main : given_equation r ↔ r = (7 : ℝ) := by sorry
  --  apply h_main
  simpa