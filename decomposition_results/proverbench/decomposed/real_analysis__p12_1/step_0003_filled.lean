theorem h₁ (x✝ : ℕ → ℝ) (x : ℝ) (h : -1 ≤ Real.sin x ∧ Real.sin x ≤ 1) : |Real.sin x| ≤ 1 := by
  apply abs_le.mpr
  exact ⟨h.1, h.2⟩
  hole