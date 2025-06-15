macro "hole_5" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem max_integral_value :
IsMaxOn (fun f => ∫ x in Set.Icc 0 1, (x^2 * f x - x * f x^2)) {f | Continuous f} f →
(∫ x in Set.Icc 0 1, (x^2 * f x - x * f x^2)) = 1/16 := by
  intro h_max
  have h1 : ∫ x in Set.Icc 0 1, (x^2 * f x - x * f x^2) ≤ 1/16 := by
    have h1₁ : (∫ x in Set.Icc 0 1, (x^2 * f x - x * f x^2)) = (∫ x in Set.Icc 0 1, (x^3 / 4 : ℝ)) - ∫ x in Set.Icc 0 1, (x * (f x - x / 2 : ℝ)^2 : ℝ) := by
      have h1₂ : (fun x : ℝ => (x^2 * f x - x * f x^2 : ℝ)) = (fun x : ℝ => (x^3 / 4 : ℝ) - x * (f x - x / 2 : ℝ)^2) := by
        funext x
        have h1₃ : x ^ 2 * f x - x * f x ^ 2 = x ^ 3 / 4 - x * (f x - x / 2) ^ 2 := by
          hole_5
        hole_4
      rw [h1₂]
      
      have h1₃ : (∫ x in Set.Icc 0 1, (x ^ 3 / 4 : ℝ) - x * (f x - x / 2 : ℝ) ^ 2) = (∫ x in Set.Icc 0 1, (x ^ 3 / 4 : ℝ)) - ∫ x in Set.Icc 0 1, (x * (f x - x / 2 : ℝ) ^ 2 : ℝ) := by
        
        hole_6
      hole_3
    hole_2
  
  have h2 : ∫ x in Set.Icc 0 1, (x^2 * f x - x * f x^2) ≥ 1/16 := by
    have h₂ : Continuous (fun x : ℝ => x / 2 : ℝ → ℝ) := by hole_8
    have h₃ : (fun f : ℝ → ℝ => ∫ x in Set.Icc 0 1, (x ^ 2 * f x - x * f x ^ 2)) (fun x : ℝ => x / 2) = 1 / 16 := by
      
      have h₄ : (∫ x in Set.Icc 0 1, (x ^ 2 * ((fun x : ℝ => x / 2) x) - x * ((fun x : ℝ => x / 2) x) ^ 2)) = 1 / 16 := by
        
        have h₅ : (∫ x in Set.Icc 0 1, (x ^ 2 * ((fun x : ℝ => x / 2) x) - x * ((fun x : ℝ => x / 2) x) ^ 2)) = ∫ x in Set.Icc 0 1, (x ^ 3 / 4 : ℝ) := by
          
          hole_11
        rw [h₅]
        
        have h₆ : (∫ x in Set.Icc 0 1, (x ^ 3 / 4 : ℝ)) = 1 / 16 := by
          hole_12
        hole_10
      hole_9
    have h₄ : (∫ x in Set.Icc 0 1, (x ^ 2 * f x - x * f x ^ 2)) ≥ 1 / 16 := by
      have h₅ : (fun f : ℝ → ℝ => ∫ x in Set.Icc 0 1, (x ^ 2 * f x - x * f x ^ 2)) (fun x : ℝ => x / 2) ≤ (fun f : ℝ → ℝ => ∫ x in Set.Icc 0 1, (x ^ 2 * f x - x * f x ^ 2)) f := by
        hole_14
      have h₆ : (∫ x in Set.Icc 0 1, (x ^ 2 * f x - x * f x ^ 2)) ≥ 1 / 16 := by
        hole_15
      hole_13
    hole_7
  
  have h3 : ∫ x in Set.Icc 0 1, (x^2 * f x - x * f x^2) = 1/16 := by
    have h3 : ∫ x in Set.Icc 0 1, (x^2 * f x - x * f x^2) ≤ 1/16 := h1
    have h4 : ∫ x in Set.Icc 0 1, (x^2 * f x - x * f x^2) ≥ 1/16 := h2
    hole_16
  
  hole_1