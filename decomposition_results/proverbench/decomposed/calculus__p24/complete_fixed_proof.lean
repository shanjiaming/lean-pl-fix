theorem limit_of_sin_fraction_as_x_approaches_infinity :
    Tendsto (fun x : ℝ => sin (2 * x + x^3) / (x + 3 * x^3)) atTop (𝓝 0) := by
  have h_main : Tendsto (fun x : ℝ => sin (2 * x + x^3) / (x + 3 * x^3)) atTop (𝓝 0) := by
    have h₁ : Tendsto (fun x : ℝ => x + 3 * x ^ 3 : ℝ → ℝ) atTop atTop := by
      have h₂ : Tendsto (fun x : ℝ => x ^ 3 : ℝ → ℝ) atTop atTop := by
        
        admit
      
      have h₃ : Tendsto (fun x : ℝ => 3 * x ^ 3 : ℝ → ℝ) atTop atTop := by
        admit
      have h₄ : Tendsto (fun x : ℝ => x + 3 * x ^ 3 : ℝ → ℝ) atTop atTop := by
        
        admit
      admit
    
    have h₂ : Tendsto (fun x : ℝ => sin (2 * x + x ^ 3) / (x + 3 * x ^ 3)) atTop (𝓝 0) := by
      have h₃ : ∀ x : ℝ, sin (2 * x + x ^ 3) / (x + 3 * x ^ 3) = (sin (2 * x + x ^ 3)) * (1 / (x + 3 * x ^ 3)) := by
        intro x
        by_cases h : x + 3 * x ^ 3 = 0
        · have h₄ : x + 3 * x ^ 3 = 0 := h
          have h₅ : sin (2 * x + x ^ 3) / (x + 3 * x ^ 3) = 0 := by
            admit
          have h₆ : (sin (2 * x + x ^ 3)) * (1 / (x + 3 * x ^ 3)) = 0 := by
            admit
          linarith
        · have h₄ : x + 3 * x ^ 3 ≠ 0 := h
          admit
      admit
    admit
  admit