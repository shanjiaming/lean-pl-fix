theorem hg0 (f g : ℝ → ℝ) (fgnconst : ¬∃ c, f = Function.const ℝ c ∨ g = Function.const ℝ c) (fgdiff : Differentiable ℝ f ∧ Differentiable ℝ g) (fadd : ∀ (x y : ℝ), f (x + y) = f x * f y - g x * g y) (gadd : ∀ (x y : ℝ), g (x + y) = f x * g y + g x * f y) (hf'0 : deriv f 0 = 0) : g 0 = 0 := by
  --  by_contra h
  have h₁ : g 0 ≠ 0 := h
  have h₂ : f 0 = 1 / 2 := by sorry
  have h₃ : f 0 = 1 / 2 := h₂
  have h₄ : (g 0) ^ 2 < 0 := by sorry
  have h₅ : (g 0) ^ 2 ≥ 0 := by sorry
  --  linarith
  hole