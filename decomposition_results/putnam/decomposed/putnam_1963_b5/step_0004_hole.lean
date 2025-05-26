theorem h₂ (a : ℤ → ℝ) (haineq : ∀ n ≥ 1, ∀ (k : ℤ), n ≤ k ∧ k ≤ 2 * n → 0 ≤ a k ∧ a k ≤ 100 * a n) (haseries : ∃ S, sorry) (h₁ : ∀ n ≥ 1, 0 ≤ a n) : ∀ n ≥ 1, a n ≥ 0 := by
  --  intro n hn
  --  exact h₁ n hn
  hole