theorem function_composition_example  : f_at (eval 5 g_at_7) (eval 4 h_at_5) = 125 :=
  by
  have h₁ : g_at_7.eval (5 : ℤ) = 55 := by sorry
  have h₂ : h_at_5.eval (4 : ℤ) = 20 := by sorry
  have h₃ : f_at (g_at_7.eval (5 : ℤ)) (h_at_5.eval (4 : ℤ)) = 125 := by sorry
  rw [h₃] <;> rfl