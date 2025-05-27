theorem h₁ (h₀ : parabola_fun = fun x => x ^ 2 + 3) : ∫ (x : ℝ) in Icc 1 3, parabola_fun x = 44 / 3 := by
  rw [h₀]
  have h₂ : (∫ x in Icc 1 3, (fun x ↦ (x : ℝ) ^ 2 + 3 : ℝ → ℝ) x) = 44 / 3 := by sorry
  simpa using h₂