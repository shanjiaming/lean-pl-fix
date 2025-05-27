theorem local_extrema (x : ℝ) : (∃ x, IsLocalMax f x) ∧ (∃ x, IsLocalMin f x) ∧ ∀ (x : ℝ), IsLocalMax f x ∨ IsLocalMin f x → x = 2 ∨ x = 4 :=
  by
  have h₁ : ∃ x, IsLocalMax f x := by sorry
  have h₂ : ∃ x, IsLocalMin f x := by sorry
  have h₃ : ∀ x, IsLocalMax f x ∨ IsLocalMin f x → x = 2 ∨ x = 4 := by sorry
  --  exact ⟨h₁, h₂, h₃⟩
  hole