theorem h_main  : (∃ x y, x ^ 2 - sorry * y ^ 2 = 2) ∨
    (∃ x y, x ^ 2 - sorry * y ^ 2 = -2) ∧ ¬((∃ x y, x ^ 2 - sorry * y ^ 2 = 2) ∧ ∃ x y, x ^ 2 - sorry * y ^ 2 = -2) :=
  by
  by_cases h : ∃ (x y : ℤ), x ^ 2 - p * y ^ 2 = 2
  · exact Or.inl h
  ·
    have h₁ : ∃ (x y : ℤ), x ^ 2 - p * y ^ 2 = -2 := by sorry
    have h₂ : ¬((∃ (x y : ℤ), x ^ 2 - p * y ^ 2 = 2) ∧ (∃ (x y : ℤ), x ^ 2 - p * y ^ 2 = -2)) := by sorry
    exact Or.inr ⟨h₁, h₂⟩