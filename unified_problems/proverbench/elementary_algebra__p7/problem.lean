theorem function_composition_example :
    f_at (g_at_7.eval (5 : ℤ)) (h_at_5.eval (4 : ℤ)) = 125 := by
  have h₁ : g_at_7.eval (5 : ℤ) = 55 := by
    simp [g_at_7, eval_add, eval_mul, eval_X, eval_C, eval_pow, eval_bit0, eval_one]
    <;> norm_num
    <;> rfl
  
  have h₂ : h_at_5.eval (4 : ℤ) = 20 := by
    simp [h_at_5, eval_mul, eval_X, eval_C]
    <;> norm_num
    <;> rfl
  
  have h₃ : f_at (g_at_7.eval (5 : ℤ)) (h_at_5.eval (4 : ℤ)) = 125 := by
    rw [h₁, h₂]
    simp [f_at]
    <;> norm_num
    <;> rfl
  
  rw [h₃]
  <;> rfl