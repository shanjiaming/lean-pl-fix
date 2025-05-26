theorem h_main  : ¬∃ f, StrictMono f ∧ Differentiable ℝ f ∧ ∀ (x : ℝ), deriv f x = f (f x) :=
  by
  --  intro h
  --  rcases h with ⟨f, hf_strict_mono, hf_diff, hf_eq⟩
  have h₁ : ∀ x, deriv f x = f (f x) := hf_eq
  have h₂ : StrictMono f := hf_strict_mono
  have h₃ : Differentiable ℝ f := hf_diff
  have h₄ : ∀ x, deriv f x > 0 := by sorry
  have h₅ : ∀ x, deriv f x > 0 := h₄
  have h₆ : ContinuousOn f (Set.univ : Set ℝ) := by sorry
  have h₇ : ∀ x, f x > x := by sorry
  have h₈ : ∀ x, f x > x := h₇
  have h₉ : ∀ x, deriv f x > f x := by sorry
  have h₁₀ : ∀ x, deriv f x > f x := h₉
  have h₁₁ : False := by sorry
  --  exact h₁₁
  hole