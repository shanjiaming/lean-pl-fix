theorem series_sum_exists (h : sequence_converges b (1/2)) :
  ∃ S : ℝ, Tendsto (λ n : ℕ => ∑ i in Finset.range n, |b i^i * cos (i * π) / i|) atTop (nhds S) :=