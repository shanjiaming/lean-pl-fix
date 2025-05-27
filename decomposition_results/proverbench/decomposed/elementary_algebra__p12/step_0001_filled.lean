theorem function_composition_result  : eval (eval 7 (f_poly 6)) g_poly = 595 :=
  by
  have h1 : (f_poly 6).eval 7 = 120 := by sorry
  have h2 : g_poly.eval ((f_poly 6).eval 7) = 595 := by sorry
  --  rw [h2] <;> norm_num <;> rfl
  linarith