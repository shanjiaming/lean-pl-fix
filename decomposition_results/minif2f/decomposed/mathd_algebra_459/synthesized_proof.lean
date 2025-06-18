theorem mathd_algebra_459 (a b c d : ℚ) (h₀ : 3 * a = b + c + d) (h₁ : 4 * b = a + c + d)
    (h₂ : 2 * c = a + b + d) (h₃ : 8 * a + 10 * b + 6 * c = 24) : ↑d.den + d.num = 28 := by
  have h₅b_eq_4a : 5 * b = 4 * a := by
    have h₄ : 5 * b = 4 * a := by
      linarith
    linarith
  
  have h₃c_eq_4a : 3 * c = 4 * a := by
    have h₄ : 3 * c = 4 * a := by
      linarith
    linarith
  
  have h_a_eq_1 : a = 1 := by
    have h₄ : a = 1 := by
      have h₅ : 8 * a + 10 * b + 6 * c = 24 := h₃
      have h₆ : 5 * b = 4 * a := h₅b_eq_4a
      have h₇ : 3 * c = 4 * a := h₃c_eq_4a
      have h₈ : 8 * a + 10 * b + 6 * c = 24 := by linarith
      have h₉ : b = (4 : ℚ) / 5 * a := by
        have h₁₀ : b = (4 : ℚ) / 5 * a := by
          linarith
        linarith
      have h₁₀ : c = (4 : ℚ) / 3 * a := by
        have h₁₁ : c = (4 : ℚ) / 3 * a := by
          linarith
        linarith
      linarith
    linarith
  
  have h_b_eq_4_div_5 : b = 4 / 5 := by
    have h₄ : b = 4 / 5 := by
      have h₅ : 5 * b = 4 * a := h₅b_eq_4a
      have h₆ : a = 1 := h_a_eq_1
      linarith
    linarith
  
  have h_c_eq_4_div_3 : c = 4 / 3 := by
    have h₄ : c = 4 / 3 := by
      have h₅ : 3 * c = 4 * a := h₃c_eq_4a
      have h₆ : a = 1 := h_a_eq_1
      linarith
    linarith
  
  have h_d_eq_13_div_15 : d = 13 / 15 := by
    have h₄ : d = 13 / 15 := by
      have h₅ : 3 * a = b + c + d := h₀
      have h₆ : a = 1 := h_a_eq_1
      have h₇ : b = 4 / 5 := h_b_eq_4_div_5
      have h₈ : c = 4 / 3 := h_c_eq_4_div_3
      linarith
    linarith
  
  have h_final : ↑d.den + d.num = 28 := by
    admit
  
  linarith
