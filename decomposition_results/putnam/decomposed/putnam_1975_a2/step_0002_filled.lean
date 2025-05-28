theorem h_main (b c : ℝ) : (∀ (z : ℂ), eval z (X ^ 2 + C ↑b * X + C ↑c) = 0 → ‖z‖ < 1) ↔ c < 1 ∧ c - b > -1 ∧ c + b > -1 :=
  by
  --  constructor
  --  · intro h
    have h₁ : c < 1 := by sorry
    have h₂ : c - b > -1 := by sorry
    have h₃ : c + b > -1 := by sorry
  --    exact ⟨h₁, h₂, h₃⟩
  --  · rintro ⟨h₁, h₂, h₃⟩
  --    intro z hz
  --    sorry
  hole