theorem f_zero_ne_zero  : eval 0 f ≠ 0 :=
  by
  have h : eval (0 : ZMod 2) f = 1 := by sorry
  have h₁ : eval (0 : ZMod 2) f ≠ 0 := by sorry
  exact h₁