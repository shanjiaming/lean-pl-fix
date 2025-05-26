theorem putnam_1991_b2 (f g : ℝ → ℝ) (fgnconst : ¬∃ c, f = Function.const ℝ c ∨ g = Function.const ℝ c) (fgdiff : Differentiable ℝ f ∧ Differentiable ℝ g) (fadd : ∀ (x y : ℝ), f (x + y) = f x * f y - g x * g y) (gadd : ∀ (x y : ℝ), g (x + y) = f x * g y + g x * f y) : deriv f 0 = 0 → ∀ (x : ℝ), f x ^ 2 + g x ^ 2 = 1 :=
  by
  --  intro hf'0
  have hg0 : g 0 = 0 := by sorry
  have hf0_ne_0 : f 0 ≠ 0 := by sorry
  have hf0 : f 0 = 1 := by sorry
  have hsumsq : ∀ x, (f x) ^ 2 + (g x) ^ 2 = 1 := by sorry
  --  exact hsumsq
  hole