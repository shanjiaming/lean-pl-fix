theorem h_imp (x : ℝ) (hx : x > 0) : 2 ≤ log x → rexp 2 ≤ x := by
  intro h
  have h₁ : exp 2 ≤ exp (log x) := by sorry
  have h₂ : exp (log x) = x := by sorry
  rw [h₂] at h₁
  exact h₁