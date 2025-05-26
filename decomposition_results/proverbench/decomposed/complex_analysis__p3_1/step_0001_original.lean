theorem bounded_reciprocal_function (f : ℂ → ℂ) (hf : sorry) (h : ℂ → 1 ≤ sorry) : sorry ∧ (ℂ → sorry ≤ 1) :=
  by
  have hf_ne_zero : ∀ (z : ℂ), f z ≠ 0 := by sorry
  have h₁ : Entire (fun z => 1 / f z) := by sorry
  have h₂ : ∀ z, abs (1 / f z) ≤ 1 := by sorry
  exact ⟨h₁, h₂⟩