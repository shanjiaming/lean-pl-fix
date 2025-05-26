theorem hf0_ne_0 (f g : ℝ → ℝ) (fgnconst : ¬∃ c, f = Function.const ℝ c ∨ g = Function.const ℝ c) (fgdiff : Differentiable ℝ f ∧ Differentiable ℝ g) (fadd : ∀ (x y : ℝ), f (x + y) = f x * f y - g x * g y) (gadd : ∀ (x y : ℝ), g (x + y) = f x * g y + g x * f y) (hf'0 : deriv f 0 = 0) (hg0 : g 0 = 0) : f 0 ≠ 0 := by
  --  by_contra h
  have h₁ : f 0 = 0 := by sorry
  have h₂ : ∀ x, f x = 0 := by sorry
  have h₃ : ∀ x, g x = 0 := by sorry
  have h₄ : ∃ c, f = Function.const ℝ c ∨ g = Function.const ℝ c := by sorry
  --  exact fgnconst h₄
  hole