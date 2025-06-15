theorem cos_taylor_series_converges (x : ℝ) : HasSum (λ n : ℕ => ((-1 : ℝ)^n / (2 * n).factorial) * x^(2 * n)) (cos x) := by
  have h : HasSum (λ n : ℕ => ((-1 : ℝ)^n / (2 * n).factorial) * x^(2 * n)) (Real.cos x) := by
    -- Apply the lemma `hasSum_cos` from mathlib
    apply hasSum_cos
  
  exact h