theorem h_main (a : ℕ → ℝ) (ha0 : a 0 = 1) (han : ∀ (n : ℕ), a (n + 1) = a n + rexp (-a n)) : ∃ L, Tendsto (fun n => a n - log ↑n) atTop (𝓝 L) :=
  by
  use (a 0 - Real.log 0)
  have h₁ : Tendsto (fun n ↦ a n - Real.log n) atTop (𝓝 (a 0 - Real.log 0)) := by sorry
  exact h₁