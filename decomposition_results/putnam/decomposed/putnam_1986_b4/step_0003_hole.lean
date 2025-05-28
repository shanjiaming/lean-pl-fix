theorem h₂ (G : ℝ → ℝ) (hGeq : ∀ (r : ℝ), ∃ m n, G r = |r - √(↑m ^ 2 + 2 * ↑n ^ 2)|) (hGlb : ∀ (r : ℝ) (m n : ℤ), G r ≤ |r - √(↑m ^ 2 + 2 * ↑n ^ 2)|) : ∀ (r : ℝ), G r = 0 := by
  --  intro r
  have h₃ : ∃ m n : ℤ, G r = |r - Real.sqrt (m ^ 2 + 2 * n ^ 2)| := hGeq r
  --  obtain ⟨m, n, h₄⟩ := h₃
  have h₅ : G r ≤ |r - Real.sqrt (m ^ 2 + 2 * n ^ 2)| := hGlb r m n
  have h₆ : G r = |r - Real.sqrt (m ^ 2 + 2 * n ^ 2)| := h₄
  have h₇ : G r ≤ G r := by sorry
  have h₈ : G r ≥ 0 := by sorry
  have h₉ : G r ≤ 0 := by sorry
  --  linarith
  hole