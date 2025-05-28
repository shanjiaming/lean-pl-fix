theorem h₁ (a : ℤ → ℝ) (haineq : ∀ n ≥ 1, ∀ (k : ℤ), n ≤ k ∧ k ≤ 2 * n → 0 ≤ a k ∧ a k ≤ 100 * a n) (haseries : ∃ S, Tendsto (fun N => ∑ n, a ↑↑n) atTop (𝓝 S)) : ∀ n ≥ 1, 0 ≤ a n := by
  --  intro n hn
  have h₂ := haineq n hn n ⟨by linarith, by linarith⟩
  --  exact h₂.1
  hole