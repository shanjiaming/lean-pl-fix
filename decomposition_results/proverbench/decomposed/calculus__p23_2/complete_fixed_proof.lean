theorem geometric_limit :
  Tendsto (λ n : ℕ => (2/3 : ℝ)^n) Filter.atTop (nhds 0) := by
  have h₁ : Tendsto (λ n : ℕ => (2/3 : ℝ)^n) Filter.atTop (nhds 0) := by
    admit
  
  admit