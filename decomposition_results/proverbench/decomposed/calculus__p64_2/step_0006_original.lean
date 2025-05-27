theorem h₄ (x : ℝ) (hx : x = 0 ∨ x = Real.pi / 3 ∨ x = Real.pi ∨ x = 4 * Real.pi / 3) (h₁ : 0 < Real.pi) (h₂ : 0 < 2 * Real.pi) (h₃ : 4 * Real.pi / 3 < 2 * Real.pi) : 0 ≤ x := by
  rcases hx with (rfl | rfl | rfl | rfl)
  · linarith
  · linarith [Real.pi_pos]
  · linarith [Real.pi_pos]
  · linarith [Real.pi_pos]