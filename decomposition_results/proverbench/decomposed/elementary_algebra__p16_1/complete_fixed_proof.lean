theorem isolate_r : given_equation r ↔ r = (7 : ℝ):=
  by
  have h_forward : given_equation r → r = (7 : ℝ):= by
    --  intro h
    have h₁ : (2 : ℝ) = (-12 : ℝ) + 2 * (r : ℝ) := h
    have h₂ : (14 : ℝ) = 2 * (r : ℝ):= by -- linarith
      hole
    have h₃ : (7 : ℝ) = r:= by -- linarith
      hole
    have h₄ : r = (7 : ℝ):= by -- linarith
      hole
    --  exact h₄
    hole
  have h_backward : r = (7 : ℝ) → given_equation r:= by
    --  intro h
    have h₁ : r = (7 : ℝ) := h
    have h₂ : (2 : ℝ) = (-12 : ℝ) + 2 * (r : ℝ):= by
      --  rw [h₁]
      norm_num
      hole
    --  exact h₂
    hole
  have h_main : given_equation r ↔ r = (7 : ℝ):= by
    --  constructor
    --  · intro h
    --    apply h_forward
      exact h
    --  · intro h
    --    apply h_backward
      exact h
    hole
  --  apply h_main
  hole