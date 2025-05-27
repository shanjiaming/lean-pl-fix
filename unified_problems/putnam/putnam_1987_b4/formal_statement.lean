theorem putnam_1987_b4
    (x y : ℕ → ℝ)
    (hxy1 : (x 1, y 1) = (0.8, 0.6))
    (hx : ∀ n ≥ 1, x (n + 1) = (x n) * cos (y n) - (y n) * sin (y n))
    (hy : ∀ n ≥ 1, y (n + 1) = (x n) * sin (y n) + (y n) * cos (y n)) :
    let (existsx, limx, existsy, limy) := ((True, -1, True, 0) : Prop × ℝ × Prop × ℝ )
    ((∃ c : ℝ, Tendsto x atTop (𝓝 c)) → existsx) ∧
    (existsx → Tendsto x atTop (𝓝 limx)) ∧
    ((∃ c : ℝ, Tendsto y atTop (𝓝 c)) → existsy) ∧
    (existsy → Tendsto y atTop (𝓝 limy)) :=
  by