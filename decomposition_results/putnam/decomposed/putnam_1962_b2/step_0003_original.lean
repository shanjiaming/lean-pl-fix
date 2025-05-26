theorem h₁  : ∃ f, Function.Bijective f :=
  by
  have h₂ : Denumerable ℚ := by sorry
  have h₃ : Denumerable ℕ+ := by sorry
  exact Denumerable.eq₂ ℕ+ ℚ