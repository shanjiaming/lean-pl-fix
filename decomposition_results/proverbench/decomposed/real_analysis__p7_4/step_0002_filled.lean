theorem h_main (x : ℝ) : ∃! c, c ∈ Set.Ioo 0 8 ∧ HasDerivAt f 0 c :=
  by
  --  use 4
  --  constructor
  ·
    have h₁ : (4 : ℝ) ∈ Set.Ioo 0 8 := by sorry
    have h₂ : HasDerivAt f 0 (4 : ℝ) := by sorry
  --    exact ⟨h₁, h₂⟩
  --  · rintro c ⟨h₁, h₂⟩
    have h₃ : c ∈ Set.Ioo 0 8 := h₁
    have h₄ : HasDerivAt f 0 c := h₂
    have h₅ : c = 4 := by sorry
  --    rw [h₅]
  hole