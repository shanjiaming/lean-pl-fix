theorem aime_1983_p2 (x p : ℝ) (f : ℝ → ℝ) (h₀ : 0 < p ∧ p < 15) (h₁ : p ≤ x ∧ x ≤ 15)
    (h₂ : f x = abs (x - p) + abs (x - 15) + abs (x - p - 15)) : 15 ≤ f x := by
  have h₃ : x - p ≥ 0 := by
    have h₃₁ : p ≤ x := h₁.1
    linarith
  
  have h₄ : x - 15 ≤ 0 := by
    have h₄₁ : x ≤ 15 := h₁.2
    linarith
  
  have h₅ : x - p - 15 ≤ 0 := by
    have h₅₁ : x ≤ 15 := h₁.2
    have h₅₂ : p > 0 := h₀.1
    linarith
  
  have h₆ : abs (x - p) = x - p := by
    norm_num ; linarith
  
  have h₇ : abs (x - 15) = 15 - x := by
    have h₇₁ : x - 15 ≤ 0 := h₄
    have h₇₂ : abs (x - 15) = -(x - 15) := by
      rw[abs_of_nonpos] ; linarith
    linarith
  
  have h₈ : abs (x - p - 15) = p + 15 - x := by
    have h₈₁ : x - p - 15 ≤ 0 := h₅
    have h₈₂ : abs (x - p - 15) = -(x - p - 15) := by
      rw[abs_of_neg] ; linarith
    linarith
  
  have h₉ : f x = 30 - x := by
    linarith
  
  have h₁₀ : 15 ≤ f x := by
    rw [h₉]
    have h₁₀₁ : x ≤ 15 := h₁.2
    linarith
  
  linarith
