theorem h₁ (a : ℕ → ℝ) (ha0 : a 0 = 1) (han : ∀ (n : ℕ), a (n + 1) = a n + rexp (-a n)) : Tendsto (fun n => a n - log ↑n) atTop (𝓝 (a 0 - log 0)) :=
  by
  have h₂ : (fun n ↦ a n - Real.log n) = fun n ↦ a 0 - Real.log 0 := by sorry
  rw [h₂]
  exact tendsto_const_nhds