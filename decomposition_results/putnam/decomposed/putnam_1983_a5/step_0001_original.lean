theorem putnam_1983_a5  : (∃ α > 0, ∀ n > 0, Even (⌊α ^ n⌋ - (↑n : ℤ))) ↔ True :=
  by
  have h_main : (∃ (α : ℝ), α > 0 ∧ ∀ (n : ℕ), n > 0 → Even (⌊α ^ n⌋ - n)) := by sorry
  have h_final : ((∃ (α : ℝ), α > 0 ∧ ∀ (n : ℕ), n > 0 → Even (⌊α ^ n⌋ - n)) ↔ True) := by sorry
  exact h_final