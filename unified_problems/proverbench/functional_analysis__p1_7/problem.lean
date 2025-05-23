theorem f_unique_minimum (u v : ℝ) :
  f u v = 0 ↔ u = 0 ∧ v = 0 := by
  have h_forward : f u v = 0 → u = 0 ∧ v = 0 := by
    intro h
    have h₁ : (u ^ 2 + v ^ 2 : ℝ) * Real.exp (-(u + v)) = 0 := by
      simpa [f] using h
    have h₂ : u ^ 2 + v ^ 2 = 0 := by
      have h₃ : Real.exp (-(u + v)) > 0 := Real.exp_pos (-(u + v))
      have h₄ : (u ^ 2 + v ^ 2 : ℝ) = 0 := by
        by_contra h₅
        have h₆ : (u ^ 2 + v ^ 2 : ℝ) > 0 := by
          have h₇ : (u ^ 2 + v ^ 2 : ℝ) > 0 := by
            -- Prove that the sum of squares is positive if not zero
            have h₈ : u ^ 2 + v ^ 2 > 0 := by
              by_contra h₉
              have h₁₀ : u ^ 2 + v ^ 2 ≤ 0 := by linarith
              have h₁₁ : u ^ 2 ≥ 0 := by nlinarith
              have h₁₂ : v ^ 2 ≥ 0 := by nlinarith
              have h₁₃ : u ^ 2 + v ^ 2 = 0 := by nlinarith
              have h₁₄ : u = 0 := by nlinarith
              have h₁₅ : v = 0 := by nlinarith
              simp_all
            linarith
          linarith
        have h₈ : (u ^ 2 + v ^ 2 : ℝ) * Real.exp (-(u + v)) > 0 := by positivity
        linarith
      linarith
    have h₃ : u = 0 := by
      have h₄ : u ^ 2 + v ^ 2 = 0 := h₂
      have h₅ : u = 0 := by
        nlinarith [sq_nonneg u, sq_nonneg v]
      exact h₅
    have h₄ : v = 0 := by
      have h₅ : u ^ 2 + v ^ 2 = 0 := h₂
      have h₆ : v = 0 := by
        nlinarith [sq_nonneg u, sq_nonneg v]
      exact h₆
    exact ⟨h₃, h₄⟩
  
  have h_backward : u = 0 ∧ v = 0 → f u v = 0 := by
    rintro ⟨rfl, rfl⟩
    simp [f]
    <;>
    norm_num
    <;>
    ring_nf
    <;>
    simp [Real.exp_zero]
    <;>
    ring_nf
    <;>
    norm_num
  
  have h_main : f u v = 0 ↔ u = 0 ∧ v = 0 := by
    constructor
    · -- Prove the forward direction: if f u v = 0, then u = 0 and v = 0.
      intro h
      exact h_forward h
    · -- Prove the backward direction: if u = 0 and v = 0, then f u v = 0.
      intro h
      exact h_backward h
  
  exact h_main