theorem h_main  : ∀ (x : ℝ), x = 0 ∨ x = Real.pi / 3 ∨ x = Real.pi ∨ x = 4 * Real.pi / 3 → x ∈ Set.Ico 0 (2 * Real.pi) :=
  by
  --  intro x hx
  have h₁ : 0 < Real.pi := Real.pi_pos
  have h₂ : 0 < 2 * Real.pi := by sorry
  have h₃ : 4 * Real.pi / 3 < 2 * Real.pi := by sorry
  have h₄ : 0 ≤ x := by sorry
  have h₅ : x < 2 * Real.pi := by sorry
  --  exact ⟨h₄, h₅⟩
  hole