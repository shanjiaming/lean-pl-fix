theorem h_main (n : ℕ) (m : ℤ) (h : ↑m = 2 + 2 * √(28 * ↑n ^ 2 + 1)) (h_int : ∃ k, √(28 * ↑n ^ 2 + 1) = ↑k) : ∃ t, m = t ^ 2 := by
  obtain ⟨k, hk⟩ := h_int
  have h₁ : (k : ℝ) = Real.sqrt (28 * (n : ℝ) ^ 2 + 1) := by sorry
  have h₂ : (k : ℝ) ^ 2 = (28 * (n : ℝ) ^ 2 + 1 : ℝ) := by sorry
  have h₃ : (k : ℤ) ^ 2 = 28 * n ^ 2 + 1 := by sorry
  have h₄ : m = 2 + 2 * k := by sorry
  have h₅ : k ≥ 0 := by sorry
  have h₆ : ∃ (t : ℤ), m = t ^ 2 := by sorry
  obtain ⟨t, ht⟩ := h₆
  refine' ⟨t, _⟩
  linarith