theorem convergent_sum_sin_zero (hx : ∃ L, Tendsto x atTop (𝓝 L))
(h : Tendsto (λ n => x n + Real.sin (x n)) atTop (𝓝 0)) :
  Tendsto x atTop (𝓝 0) :=