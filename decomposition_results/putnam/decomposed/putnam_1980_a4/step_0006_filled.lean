theorem h₄ (abcvals : ℤ → ℤ → ℤ → Prop) (habcvals : ∀ (a b c : ℤ), abcvals a b c ↔ (a = 0 ∧ b = 0 ∧ c = 0) ∧ |a| < 1000000 ∧ |b| < 1000000 ∧ |c| < 1000000) (h₁ : abcvals 0 0 0) (h₃ : 10 ^ (-11) > 0) : |0 + 0 * √2 + 0 * √3| = 0 := by
  --  norm_num [abs_of_nonneg, Real.sqrt_nonneg, add_assoc]
  hole