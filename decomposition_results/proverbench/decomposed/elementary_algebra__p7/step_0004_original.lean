theorem h₃ (h₁ : eval 5 g_at_7 = 55) (h₂ : eval 4 h_at_5 = 20) : f_at (eval 5 g_at_7) (eval 4 h_at_5) = 125 :=
  by
  rw [h₁, h₂]
  simp [f_at] <;> norm_num <;> rfl