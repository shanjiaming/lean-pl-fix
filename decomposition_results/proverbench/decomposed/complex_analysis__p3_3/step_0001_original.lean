theorem constant_reciprocal_function (f : ℂ → ℂ) (hf : Entire f) (h : ℂ → 1 ≤ sorry) : ∃ c, ∀ (z : ℂ), f z = 1 / c :=
  by
  have h₁ : Entire (fun z => 1 / f z) ∧ ∀ z, abs (1 / f z) ≤ 1 := by sorry
  have h₂ : ∃ (C : ℝ), ∀ (z : ℂ), abs ((fun z => 1 / f z) z) ≤ C := by sorry
  have h₃ : ∃ (c : ℂ), ∀ (z : ℂ), (fun z => 1 / f z) z = c := by sorry
  have h₄ : ∃ (c : ℂ), ∀ (z : ℂ), f z = 1 / c := by sorry
  obtain ⟨c, hc⟩ := h₄
  exact ⟨c, hc⟩