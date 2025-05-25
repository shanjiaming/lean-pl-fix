theorem putnam_1980_a4 (abcvals : ℤ → ℤ → ℤ → Prop) (habcvals : ∀ (a b c : ℤ), abcvals a b c ↔ (a = 0 ∧ b = 0 ∧ c = 0) ∧ |a| < 1000000 ∧ |b| < 1000000 ∧ |c| < 1000000) : (∃ a b c, abcvals a b c ∧ |(↑a : ℝ) + (↑b : ℝ) * √2 + (↑c : ℝ) * √3| < 10 ^ (-11)) ∧
    ∀ (a b c : ℤ), abcvals a b c → |(↑a : ℝ) + (↑b : ℝ) * √2 + (↑c : ℝ) * √3| > 10 ^ (-21) :=
  by
  have h_main₁ :
    ∃ a b c : ℤ, abcvals a b c ∧ |(a : ℝ) + (b : ℝ) * Real.sqrt 2 + (c : ℝ) * Real.sqrt 3| < (10 : ℝ) ^ (-(11 : ℝ)) := by sorry
  have h_main₂ : False := by sorry
  exfalso
  exact h_main₂