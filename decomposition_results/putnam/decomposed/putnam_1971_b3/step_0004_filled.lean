theorem h₃ (T : ℝ) (hT : 0 < T) (h : ¬False) (h₁ h₂ : T > 0) : ∃ t ≥ T, ⌊t⌋₊ = 2 * ⌊t - T⌋₊ :=
  by
  --  use 2 * T
  have h₄ : (2 * T : ℝ) ≥ T := by sorry
  have h₅ : Nat.floor (2 * T : ℝ) = 2 * Nat.floor T := by sorry
  have h₆ : Nat.floor ((2 * T : ℝ) - T) = Nat.floor T := by sorry
  have h₇ : Nat.floor (2 * T : ℝ) = 2 * Nat.floor ((2 * T : ℝ) - T) := by sorry
  --  constructor
  --  · exact h₄
  --  · simpa [h₅, h₆, h₇] using h₇
  hole