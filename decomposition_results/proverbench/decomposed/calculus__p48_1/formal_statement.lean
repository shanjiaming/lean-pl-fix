/-- Proof that the Taylor series of cos(x) converges for all real numbers x -/
lemma cos_taylor_series_converges (x : ℝ) : HasSum (λ n : ℕ => ((-1 : ℝ)^n / (2 * n).factorial) * x^(2 * n)) (cos x) :=