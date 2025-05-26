theorem putnam_2016_a3 (f : ℝ → ℝ) (hf : ∀ (x : ℝ), x ≠ 0 → f x + f (1 - 1 / x) = arctan x) : ∫ (x : ℝ) in 0 ..1, f x = 3 * π / 8 :=
  by
  have h₁ : ∫ x in (0)..1, arctan x = Real.pi / 4 - Real.log 2 / 2 := by sorry
  have h₂ : ∫ x in (0)..1, arctan (1 / (1 - x)) = Real.pi / 4 + Real.log 2 / 2 := by sorry
  have h₃ : ∫ x in (0)..1, arctan (1 - 1 / x) = -(3 * Real.pi / 4) := by sorry
  have h₄ : ∫ x in (0)..1, f x = (3 * Real.pi / 8 : ℝ) := by sorry
  rw [h₄] <;> norm_num <;> linarith [Real.pi_pos]