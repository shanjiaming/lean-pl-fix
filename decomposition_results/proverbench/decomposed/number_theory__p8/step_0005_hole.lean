theorem h₄ (x y z : ℕ) (h : x * y = z ^ 2 + 1) (hx : x = 1) (h₃ : x * y = z ^ 2 + 1) : y = z ^ 2 + 1 := by -- -- norm_num [hx] at h₃ ⊢ <;> nlinarith
  hole