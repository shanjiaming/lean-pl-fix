theorem h_main (x : ℝ) : ∃! c, c ∈ Set.Ioo 0 8 ∧ HasDerivAt f 0 c ∧ c = 4 :=
  by
  use 4
  constructor
  ·
    have h₁ : (4 : ℝ) ∈ Set.Ioo 0 8 := by sorry
    have h₂ : HasDerivAt f 0 (4 : ℝ) := by sorry
    exact ⟨h₁, h₂, rfl⟩
  · rintro c ⟨h₁, h₂, h₃⟩
    simp_all <;> aesop