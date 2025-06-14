theorem aime_1990_p4 (x : ℝ) (h₀ : 0 < x) (h₁ : x ^ 2 - 10 * x - 29 ≠ 0)
    (h₂ : x ^ 2 - 10 * x - 45 ≠ 0) (h₃ : x ^ 2 - 10 * x - 69 ≠ 0)
    (h₄ : 1 / (x ^ 2 - 10 * x - 29) + 1 / (x ^ 2 - 10 * x - 45) - 2 / (x ^ 2 - 10 * x - 69) = 0) :
    x = 13 := by
  have h_y : x ^ 2 - 10 * x = 39 := by
    have h₅ : (x ^ 2 - 10 * x - 45) ≠ 0 := by norm_num
    have h₆ : (x ^ 2 - 10 * x - 29) ≠ 0 := by norm_num
    have h₇ : (x ^ 2 - 10 * x - 69) ≠ 0 := by norm_num
    have h₈ : 1 / (x ^ 2 - 10 * x - 29) + 1 / (x ^ 2 - 10 * x - 45) - 2 / (x ^ 2 - 10 * x - 69) = 0 := h₄
    have h₉ : (x ^ 2 - 10 * x - 45) * (x ^ 2 - 10 * x - 69) + (x ^ 2 - 10 * x - 29) * (x ^ 2 - 10 * x - 69) - 2 * (x ^ 2 - 10 * x - 29) * (x ^ 2 - 10 * x - 45) = 0 := by
      have h₉₁ : (x ^ 2 - 10 * x - 45) * (x ^ 2 - 10 * x - 69) + (x ^ 2 - 10 * x - 29) * (x ^ 2 - 10 * x - 69) - 2 * (x ^ 2 - 10 * x - 29) * (x ^ 2 - 10 * x - 45) = 0 := by
        norm_num
      norm_num
    have h₁₀ : x ^ 2 - 10 * x = 39 := by
      norm_num
    norm_num
  
  have h_final : x = 13 := by
    have h₅ : x = 13 := by
      have h₅₁ : x = 13 ∨ x = -3 := by
        have h₅₂ : x ^ 2 - 10 * x - 39 = 0 := by
          norm_num
        have h₅₃ : (x - 13) * (x + 3) = 0 := by
          norm_num
        have h₅₄ : x - 13 = 0 ∨ x + 3 = 0 := by
          norm_num
        norm_num
      norm_num
    norm_num
  
  norm_num