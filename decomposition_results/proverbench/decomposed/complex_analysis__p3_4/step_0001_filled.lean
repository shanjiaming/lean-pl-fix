theorem constant_entire_function (f : ℂ → ℂ) (hf : sorry) (h : ℂ → 1 ≤ sorry) : ∃ c, ∀ (z : ℂ), f z = c :=
  by
  have h₁ : ∃ (c : ℂ), ∀ (z : ℂ), f z = 1 / c := by sorry
  have h₂ : ∃ (c : ℂ), ∀ (z : ℂ), f z = c := by sorry
  --  exact h₂
  simpa