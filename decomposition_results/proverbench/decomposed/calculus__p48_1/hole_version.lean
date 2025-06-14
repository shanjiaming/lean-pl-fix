macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem cos_taylor_series_converges (x : ℝ) : HasSum (λ n : ℕ => ((-1 : ℝ)^n / (2 * n).factorial) * x^(2 * n)) (cos x) := by
  have h : HasSum (λ n : ℕ => ((-1 : ℝ)^n / (2 * n).factorial) * x^(2 * n)) (Real.cos x) := by
    
    hole_2
  
  hole_1