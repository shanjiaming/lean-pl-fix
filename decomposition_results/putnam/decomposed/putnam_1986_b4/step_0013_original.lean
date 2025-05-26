theorem h₄ (G : ℝ → ℝ) (hGeq : ∀ (r : ℝ), ∃ m n, G r = |r - √((↑m : ℝ) ^ 2 + 2 * (↑n : ℝ) ^ 2)|) (hGlb : ∀ (r : ℝ) (m n : ℤ), G r ≤ |r - √((↑m : ℝ) ^ 2 + 2 * (↑n : ℝ) ^ 2)|) (h₂ h₃ : ∀ (r : ℝ), G r = 0) : sorry :=
  by
  have h₅ : G = fun _ => 0 := by sorry
  rw [h₅]
  simpa using tendsto_const_nhds