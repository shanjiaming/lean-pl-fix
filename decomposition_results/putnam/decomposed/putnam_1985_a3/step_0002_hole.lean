theorem h_main (d : ℝ) (a : ℕ → ℕ → ℝ) (ha0 : ∀ (m : ℕ), a m 0 = d / 2 ^ m) (ha : ∀ (m j : ℕ), a m (j + 1) = a m j ^ 2 + 2 * a m j) : ∀ (m j : ℕ), a m j = (d / 2 ^ m + 1) ^ 2 ^ j - 1 :=
  by
  --  intro m j
  have h₁ : ∀ j : ℕ, a m j + 1 = (d / (2 : ℝ) ^ m + 1) ^ (2 ^ j : ℕ) := by sorry
  have h₂ : a m j + 1 = (d / (2 : ℝ) ^ m + 1) ^ (2 ^ j : ℕ) := h₁ j
  have h₃ : a m j = (d / (2 : ℝ) ^ m + 1) ^ (2 ^ j : ℕ) - 1 := by sorry
  --  exact h₃
  hole