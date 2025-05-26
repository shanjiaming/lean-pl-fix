theorem h₂ (f : ℝ → ℝ) (hf : f = fun x => if x ≤ rexp 1 then x else x * f (Real.log x)) : f (-1) = -1 :=
  by
  have h₃ : f = (fun x => if x ≤ Real.exp 1 then x else x * (f (Real.log x))) := hf
  have h₄ : f (-1 : ℝ) = (if (-1 : ℝ) ≤ Real.exp 1 then (-1 : ℝ) else (-1 : ℝ) * (f (Real.log (-1 : ℝ)))) := by sorry
  --  rw [h₄]
  have h₅ : ((-1 : ℝ) : ℝ) ≤ Real.exp 1 := by sorry
  --  --  split_ifs at * <;> norm_num at * <;> linarith [Real.add_one_le_exp (1 : ℝ)]
  hole