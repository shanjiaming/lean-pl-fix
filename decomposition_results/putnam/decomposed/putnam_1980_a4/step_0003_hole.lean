theorem h₁ (abcvals : ℤ → ℤ → ℤ → Prop) (habcvals : ∀ (a b c : ℤ), abcvals a b c ↔ (a = 0 ∧ b = 0 ∧ c = 0) ∧ |a| < 1000000 ∧ |b| < 1000000 ∧ |c| < 1000000) : abcvals 0 0 0 := by
  --  rw [habcvals]
  --  norm_num [abs_of_nonneg, abs_of_nonpos, Int.cast_zero]
  hole