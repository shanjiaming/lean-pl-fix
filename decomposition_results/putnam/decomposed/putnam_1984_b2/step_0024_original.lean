theorem h₂ (f : ℝ → ℝ → ℝ) (hf : ∀ (u v : ℝ), f u v = (u - v) ^ 2 + (√(2 - u ^ 2) - 9 / v) ^ 2) (h₀ : 8 ∈ {y | ∃ u, ∃ v > 0, f (↑u : ℝ) v = y}) (h₁ : ∀ y ∈ {y | ∃ u, ∃ v > 0, f (↑u : ℝ) v = y}, 8 ≤ y) : IsLeast {y | ∃ u, ∃ v > 0, f (↑u : ℝ) v = y} 8 :=
  by
  refine' ⟨h₀, _⟩
  intro y hy
  have h₃ : (8 : ℝ) ≤ y := h₁ y hy
  linarith