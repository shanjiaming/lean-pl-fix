theorem h₄ (f : ℝ → ℝ) (hf h₃ : f = fun x => if x ≤ rexp 1 then x else x * f (Real.log x)) : f (-1) = if -1 ≤ rexp 1 then -1 else -1 * f (Real.log (-1)) := by
  --  --  rw [h₃] <;> simp
  hole