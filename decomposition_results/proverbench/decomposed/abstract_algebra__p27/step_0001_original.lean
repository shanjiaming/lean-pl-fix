theorem field_is_integral_domain (F : Type) (inst✝² : Field F) (D : Type) (inst✝¹ : CommRing D) (inst✝ : NoZeroDivisors D) (a b : F) (h : a * b = 0) : a = 0 ∨ b = 0 :=
  by
  have h_main : a = 0 ∨ b = 0 := by sorry
  exact h_main