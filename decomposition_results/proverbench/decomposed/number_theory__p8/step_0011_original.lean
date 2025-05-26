theorem h₅ (x y z : ℕ) (h : x * y = z ^ 2 + 1) (hx : ¬x = 1) (hy : ¬y = 1) (h₂ : x * y = z ^ 2 + 1) (h₃ h₄ : x = z ^ 2 + 1) : y = 1 := by
  have h₅ : x * y = z ^ 2 + 1 := by sorry
  have h₆ : x = z ^ 2 + 1 := by sorry
  simp_all [mul_comm] <;> ring_nf at * <;> nlinarith