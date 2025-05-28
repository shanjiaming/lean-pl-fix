theorem h_trivial (a : ℕ → ℝ) (ha0 : a 0 = 1) (han : ∀ (n : ℕ), a (n + 1) = a n + rexp (-a n)) (h_main : ∃ L, Tendsto (fun n => a n - log ↑n) atTop (𝓝 L)) : (∃ L, Tendsto (fun n => a n - log ↑n) atTop (𝓝 L)) ↔ True := by
  --  --  constructor <;> simp_all <;> tauto
  hole