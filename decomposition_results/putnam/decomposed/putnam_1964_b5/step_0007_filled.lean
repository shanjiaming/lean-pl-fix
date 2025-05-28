theorem h_b_exponential (a b : ℕ → ℕ) (ha : StrictMono a ∧ ∀ (n : ℕ), a n > 0) (hb : b 0 = a 0 ∧ ∀ (n : ℕ), b (n + 1) = lcm (b n) (a (n + 1))) (h_b_pos : ∀ (n : ℕ), b n > 0) (h_b_mono : ∀ (n : ℕ), b n ≤ b (n + 1)) : ∀ (n : ℕ), b n ≥ 2 ^ n :=
  by
  have h₁ : ∀ n, a n ≥ n + 1 := by sorry
  have h₂ : ∀ n, (b n : ℕ) ≥ 2 ^ n := by sorry
  --  exact h₂
  simpa