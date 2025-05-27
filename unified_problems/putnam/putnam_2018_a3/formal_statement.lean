theorem putnam_2018_a3 :
    IsGreatest
      {∑ i, Real.cos (3 * x i) | (x : Fin 10 → ℝ) (hx : ∑ i, Real.cos (x i) = 0)}
      ((480/49) : ℝ ) :=
  by