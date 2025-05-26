theorem h₁ (f : ℝ → ℝ) (hf : f = fun x => if x ≤ rexp 1 then x else x * f (Real.log x)) : False :=
  by
  have h₂ : f (-1 : ℝ) = (-1 : ℝ) := by sorry
  have h₃ : f (-1 : ℝ) = 0 := by sorry
  linarith