theorem function_composition_result : (g_poly.eval ((f_poly 6).eval 7)) = 595 := by
  have h1 : (f_poly 6).eval 7 = 120 := by
    -- Evaluate the polynomial f_poly 6 at 7
    dsimp [f_poly, eval_sub, eval_add, eval_mul, eval_pow, eval_C, eval_X]
    <;> norm_num
    <;> ring_nf
    <;> norm_num
    <;> rfl
  
  have h2 : g_poly.eval ((f_poly 6).eval 7) = 595 := by
    rw [h1]
    -- Evaluate the polynomial g_poly at 120
    dsimp [g_poly, eval_sub, eval_add, eval_mul, eval_pow, eval_C, eval_X]
    <;> norm_num
    <;> ring_nf
    <;> norm_num
    <;> rfl
  
  rw [h2]
  <;> norm_num
  <;> rfl