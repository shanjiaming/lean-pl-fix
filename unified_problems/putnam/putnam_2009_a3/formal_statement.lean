theorem putnam_2009_a3
(cos_matrix : (n : ℕ) → Matrix (Fin n) (Fin n) ℝ)
(hM : ∀ n : ℕ, ∀ i j : Fin n, (cos_matrix n) i j = Real.cos (1 + n * i + j))
: Tendsto (fun n => (cos_matrix n).det) atTop (𝓝 ((0) : ℝ )) := by