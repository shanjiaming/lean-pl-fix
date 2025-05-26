theorem hf_ne_zero (f : ℂ → ℂ) (hf : sorry) (h : ℂ → 1 ≤ sorry) : ∀ (z : ℂ), f z ≠ 0 := by
  intro z
  have h₁ : 1 ≤ abs (f z) := h z
  have h₂ : abs (f z) ≠ 0 := by sorry
  exact fun h₃ => h₂ (by simp [h₃, abs.map_zero])