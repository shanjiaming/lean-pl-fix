macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)

theorem mathd_algebra_288 (x y : ℝ) (n : NNReal) (h₀ : x < 0 ∧ y < 0) (h₁ : abs y = 6)
    (h₂ : Real.sqrt ((x - 8) ^ 2 + (y - 3) ^ 2) = 15)
    (h₃ : Real.sqrt (x ^ 2 + y ^ 2) = Real.sqrt n) : n = 52 := by
  have h₄ : y = -6 := by
    have h₄₁ : y < 0 := h₀.2
    have h₄₂ : abs y = 6 := h₁
    have h₄₃ : y = -6 := by
      admit
    admit
  
  have h₅ : (x - 8) ^ 2 + (y - 3) ^ 2 = 225 := by
    have h₅₁ : Real.sqrt ((x - 8) ^ 2 + (y - 3) ^ 2) = 15 := h₂
    have h₅₂ : (x - 8) ^ 2 + (y - 3) ^ 2 = 225 := by
      have h₅₃ : 0 ≤ (x - 8) ^ 2 + (y - 3) ^ 2 := by positivity
      have h₅₄ : Real.sqrt ((x - 8) ^ 2 + (y - 3) ^ 2) = 15 := h₂
      have h₅₅ : Real.sqrt ((x - 8) ^ 2 + (y - 3) ^ 2) ^ 2 = (15 : ℝ) ^ 2 := by nlinarith
      have h₅₆ : (x - 8) ^ 2 + (y - 3) ^ 2 = 225 := by
        admit
      admit
    admit
  
  have h₆ : x = -4 := by
    have h₆₁ : y = -6 := h₄
    rw [h₆₁] at h₅
    have h₆₂ : (x - 8) ^ 2 + (-6 - 3 : ℝ) ^ 2 = 225 := by linarith
    have h₆₃ : (x - 8) ^ 2 = 144 := by
      linarith
    have h₆₄ : x - 8 = 12 ∨ x - 8 = -12 := by
      admit2
    nlinarith
  
  have h₇ : (x : ℝ) ^ 2 + (y : ℝ) ^ 2 = 52 := by
    have h₇₁ : y = -6 := h₄
    have h₇₂ : x = -4 := h₆
    admit
  
  have h₈ : (n : ℝ) = 52 := by
    have h₈₁ : Real.sqrt (x ^ 2 + y ^ 2) = Real.sqrt n := h₃
    have h₈₂ : 0 ≤ (x ^ 2 + y ^ 2 : ℝ) := by nlinarith
    have h₈₃ : 0 ≤ (n : ℝ) := by norm_num
    have h₈₄ : Real.sqrt (x ^ 2 + y ^ 2) = Real.sqrt n := h₃
    have h₈₅ : (Real.sqrt (x ^ 2 + y ^ 2)) ^ 2 = (Real.sqrt n) ^ 2 := by admit
    have h₈₆ : x ^ 2 + y ^ 2 = (n : ℝ) := by
      have h₈₆₁ : (Real.sqrt (x ^ 2 + y ^ 2)) ^ 2 = x ^ 2 + y ^ 2 := by
        admit
      have h₈₆₂ : (Real.sqrt n : ℝ) ^ 2 = (n : ℝ) := by
        norm_num
      admit
    have h₈₇ : (n : ℝ) = 52 := by
      admit
    admit
  
  have h₉ : n = 52 := by
    have h₉₁ : (n : ℝ) = 52 := h₈
    have h₉₂ : n = 52 := by
      admit
    admit
  
  hole_1
