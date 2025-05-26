theorem h_conv (x : ℝ) (hx : x > 0) (h_imp : 2 ≤ Real.log x → rexp 2 ≤ x) : rexp 2 ≤ x → 2 ≤ Real.log x := by
  --  intro h
  have h₁ : log (exp 2) ≤ log x := by sorry
  have h₂ : log (exp 2) = 2 := by sorry
  --  rw [h₂] at h₁
  --  exact h₁
  hole