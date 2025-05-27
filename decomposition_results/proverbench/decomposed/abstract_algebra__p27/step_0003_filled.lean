theorem h₁ (F : Type) (inst✝² : Field F) (D : Type) (inst✝¹ : CommRing D) (inst✝ : NoZeroDivisors D) (a b : F) (h : a * b = 0) (h₀ : ¬a = 0) : b = 0 := by
  have h₂ : a * b = a * 0 := by sorry
  have h₃ : b = 0 := mul_left_cancel₀ h₀ h₂
  exact h₃
  hole