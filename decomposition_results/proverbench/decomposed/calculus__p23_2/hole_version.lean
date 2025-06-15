macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem geometric_limit :
  Tendsto (λ n : ℕ => (2/3 : ℝ)^n) Filter.atTop (nhds 0) := by
  have h₁ : Tendsto (λ n : ℕ => (2/3 : ℝ)^n) Filter.atTop (nhds 0) := by
    hole_2
  
  hole_1