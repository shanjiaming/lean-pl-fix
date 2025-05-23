theorem isolate_r : given_equation r ↔ r = (7 : ℝ) := by
  have h_forward : given_equation r → r = (7 : ℝ) := by
    intro h
    have h₁ : (2 : ℝ) = (-12 : ℝ) + 2 * (r : ℝ) := h
    have h₂ : (14 : ℝ) = 2 * (r : ℝ) := by linarith
    have h₃ : (7 : ℝ) = r := by linarith
    have h₄ : r = (7 : ℝ) := by linarith
    exact h₄
  
  have h_backward : r = (7 : ℝ) → given_equation r := by
    intro h
    have h₁ : r = (7 : ℝ) := h
    have h₂ : (2 : ℝ) = (-12 : ℝ) + 2 * (r : ℝ) := by
      rw [h₁]
      norm_num
    exact h₂
  
  have h_main : given_equation r ↔ r = (7 : ℝ) := by
    constructor
    · -- Prove the forward direction: given_equation r → r = (7 : ℝ)
      intro h
      apply h_forward
      exact h
    · -- Prove the backward direction: r = (7 : ℝ) → given_equation r
      intro h
      apply h_backward
      exact h
  
  apply h_main