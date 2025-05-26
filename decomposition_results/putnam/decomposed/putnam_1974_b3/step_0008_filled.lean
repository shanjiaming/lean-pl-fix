theorem h_final (α : ℝ) (ha : cos (π * α) = 1 / 3) (h_main : ¬∃ p, ∃ q > 0, α = (↑p : ℝ) / (↑q : ℝ)) : Irrational α := by
  --  intro h
  --  obtain ⟨r, hr⟩ := h
  have h₁ : ∃ (p : ℤ) (q : ℤ), q > 0 ∧ α = (p : ℝ) / q := by sorry
  --  exact h_main h₁
  hole