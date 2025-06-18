macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)

theorem amc12b_2021_p18 (z : ℂ)
    (h₀ : 12 * Complex.normSq z = 2 * Complex.normSq (z + 2) + Complex.normSq (z ^ 2 + 1) + 31) :
    z + 6 / z = -2 := by
  have h₁ : z.re = -1 := by
    have h₁₁ : Complex.normSq z = z.re * z.re + z.im * z.im := by
      hole_1
    have h₁₂ : Complex.normSq (z + 2) = (z.re + 2) * (z.re + 2) + z.im * z.im := by
      hole_2
    have h₁₃ : Complex.normSq (z ^ 2 + 1) = (z.re * z.re - z.im * z.im + 1) * (z.re * z.re - z.im * z.im + 1) + (2 * z.re * z.im) * (2 * z.re * z.im) := by
      hole_3
    rw [h₁₁, h₁₂, h₁₃] at h₀
    have h₁₄ : z.re * z.re + z.im * z.im = (z.re * z.re + z.im * z.im) := by hole_4
    have h₁₅ : 12 * (z.re * z.re + z.im * z.im) = 2 * ((z.re + 2) * (z.re + 2) + z.im * z.im) + ((z.re * z.re - z.im * z.im + 1) * (z.re * z.re - z.im * z.im + 1) + (2 * z.re * z.im) * (2 * z.re * z.im)) + 31 := by
      hole_5
    have h₁₆ : (z.re + 1) = 0 := by
      hole_6
    hole_7
  
  have h₂ : z.re * z.re + z.im * z.im = 6 := by
    have h₂₁ : Complex.normSq z = z.re * z.re + z.im * z.im := by
      hole_8
    have h₂₂ : Complex.normSq (z + 2) = (z.re + 2) * (z.re + 2) + z.im * z.im := by
      hole_9
    have h₂₃ : Complex.normSq (z ^ 2 + 1) = (z.re * z.re - z.im * z.im + 1) * (z.re * z.re - z.im * z.im + 1) + (2 * z.re * z.im) * (2 * z.re * z.im) := by
      hole_10
    rw [h₂₁, h₂₂, h₂₃] at h₀
    have h₂₄ : z.re * z.re + z.im * z.im = (z.re * z.re + z.im * z.im) := by hole_11
    have h₂₅ : 12 * (z.re * z.re + z.im * z.im) = 2 * ((z.re + 2) * (z.re + 2) + z.im * z.im) + ((z.re * z.re - z.im * z.im + 1) * (z.re * z.re - z.im * z.im + 1) + (2 * z.re * z.im) * (2 * z.re * z.im)) + 31 := by
      hole_12
    hole_13
  
  have h₃ : z ≠ 0 := by
    hole_14
  
  have h₄ : z + 6 / z = -2 := by
    have h₄₁ : z.im = Real.sqrt 5 ∨ z.im = -Real.sqrt 5 := by
      have h₄₂ : z.im * z.im = 5 := by
        hole_15
      have h₄₃ : z.im = Real.sqrt 5 ∨ z.im = -Real.sqrt 5 := by
        hole_16
      hole_17
    have h₄₅ : z + 6 / z = -2 := by
      cases h₄₁ with
      | inl h₄₁ =>
        have h₄₆ : z.im = Real.sqrt 5 := h₄₁
        have h₄₇ : z.re = -1 := h₁
        have h₄₈ : z.re * z.re + z.im * z.im = 6 := h₂
        have h₄₉ : z ≠ 0 := h₃
        
        have h₅₀ : z + 6 / z = -2 := by
          
          hole_18
        exact h₅₀
      | inr h₄₁ =>
        have h₄₆ : z.im = -Real.sqrt 5 := h₄₁
        have h₄₇ : z.re = -1 := h₁
        have h₄₈ : z.re * z.re + z.im * z.im = 6 := h₂
        have h₄₉ : z ≠ 0 := h₃
        
        have h₅₀ : z + 6 / z = -2 := by
          
          hole_19
        exact h₅₀
    hole_21
  
  hole_22