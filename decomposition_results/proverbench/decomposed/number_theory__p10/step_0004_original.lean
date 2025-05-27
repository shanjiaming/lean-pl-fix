theorem h₂ (α✝ : ℝ) (n✝ : ℕ) (α : ℝ) (hα : Irrational α) (n : ℕ) (hn : 0 < n) : ∃ i j, i < j ∧ j ≤ n ∧ |↑j * α - ↑i * α - (↑(round (↑j * α)) - ↑(round (↑i * α)))| < 1 / (↑n + 1) :=
  by
  set f : ℕ → ℝ := fun k => (k : ℝ) * α - round ((k : ℝ) * α)
  have h₃ : ∃ (i j : ℕ), i < j ∧ j ≤ n ∧ |f j - f i| < 1 / (n + 1 : ℝ) := by sorry
  obtain ⟨i, j, hij, hjn, hdiff⟩ := h₃
  refine' ⟨i, j, hij, hjn, _⟩
  simp [f] at hdiff ⊢ <;> ring_nf at hdiff ⊢ <;> simpa using hdiff