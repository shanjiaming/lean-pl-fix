/-- Lemma 2: As n approaches infinity, (2/3)^n approaches 0 -/
lemma geometric_limit :
  Tendsto (λ n : ℕ => (2/3 : ℝ)^n) Filter.atTop (nhds 0) :=