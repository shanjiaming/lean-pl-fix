macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem limit_of_sin_fraction_as_x_approaches_infinity :
    Tendsto (fun x : ℝ => sin (2 * x + x^3) / (x + 3 * x^3)) atTop (𝓝 0) := by
  have h_main : Tendsto (fun x : ℝ => sin (2 * x + x^3) / (x + 3 * x^3)) atTop (𝓝 0) := by
    have h₁ : Tendsto (fun x : ℝ => x + 3 * x ^ 3 : ℝ → ℝ) atTop atTop := by
      have h₂ : Tendsto (fun x : ℝ => x ^ 3 : ℝ → ℝ) atTop atTop := by
        
        hole_4
      
      have h₃ : Tendsto (fun x : ℝ => 3 * x ^ 3 : ℝ → ℝ) atTop atTop := by
        hole_5
      have h₄ : Tendsto (fun x : ℝ => x + 3 * x ^ 3 : ℝ → ℝ) atTop atTop := by
        
        hole_6
      hole_3
    
    have h₂ : Tendsto (fun x : ℝ => sin (2 * x + x ^ 3) / (x + 3 * x ^ 3)) atTop (𝓝 0) := by
      have h₃ : ∀ x : ℝ, sin (2 * x + x ^ 3) / (x + 3 * x ^ 3) = (sin (2 * x + x ^ 3)) * (1 / (x + 3 * x ^ 3)) := by
        intro x
        by_cases h : x + 3 * x ^ 3 = 0
        · have h₄ : x + 3 * x ^ 3 = 0 := h
          have h₅ : sin (2 * x + x ^ 3) / (x + 3 * x ^ 3) = 0 := by
            hole_9
          have h₆ : (sin (2 * x + x ^ 3)) * (1 / (x + 3 * x ^ 3)) = 0 := by
            hole_10
          linarith
        · have h₄ : x + 3 * x ^ 3 ≠ 0 := h
          hole_8
      hole_7
    hole_2
  hole_1