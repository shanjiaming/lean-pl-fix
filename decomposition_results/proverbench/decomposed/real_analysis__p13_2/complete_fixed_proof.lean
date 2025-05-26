theorem two_le_log_iff (x : ℝ) (hx : x > 0) : 2 ≤ log x ↔ exp 2 ≤ x:=
  by
  have h_imp : 2 ≤ log x → exp 2 ≤ x:= by
    --  intro h
    have h₁ : exp 2 ≤ exp (log x):= by
      --  apply exp_le_exp.2
      --  exact h
      simpa
    have h₂ : exp (log x) = x:= by -- rw [exp_log hx]
      hole
    --  rw [h₂] at h₁
    --  exact h₁
    hole
  have h_conv : exp 2 ≤ x → 2 ≤ log x:= by
    --  intro h
    have h₁ : log (exp 2) ≤ log x:= by
      --  apply log_le_log
      --  · positivity
      --  · exact h
      hole
    have h₂ : log (exp 2) = 2:= by -- rw [log_exp]
      norm_num
    --  rw [h₂] at h₁
    --  exact h₁
    hole
  have h_main : 2 ≤ log x ↔ exp 2 ≤ x:= by
    --  constructor
    --  · intro h
    --    exact h_imp h
    --  · intro h
    --    exact h_conv h
    hole
  --  exact h_main
  simpa