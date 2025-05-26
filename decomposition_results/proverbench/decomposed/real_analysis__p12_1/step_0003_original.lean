theorem h₁ (x : ℝ) (h : -1 ≤ sin x ∧ sin x ≤ 1) : |sin x| ≤ 1 := by
  apply abs_le.mpr
  exact ⟨h.1, h.2⟩