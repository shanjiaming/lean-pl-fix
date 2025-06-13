theorem contradiction_with_have (a b : ℕ) (h : a + b = 0) : a = 0 ∧ b = 0 := by
  admit
  · 
    have h1 : a > 0 := Nat.pos_of_ne_zero ha
    have h2 : a + b ≥ a := by omega
    have h3 : a + b ≥ 1 := by
      have h4 : a ≥ 1 := h1
      omega
    have h4 : a + b = 0 := h
    have h5 : (0 : ℕ) < 1 := by norm_num
    omega
  · 
    have h1 : b > 0 := Nat.pos_of_ne_zero hb
    have h2 : a + b ≥ b := by omega
    have h3 : a + b ≥ 1 := by
      have h4 : b ≥ 1 := h1
      omega
    have h4 : a + b = 0 := h
    omega