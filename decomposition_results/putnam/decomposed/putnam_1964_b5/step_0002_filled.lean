theorem h_b_pos (a b : ℕ → ℕ) (ha : StrictMono a ∧ ∀ (n : ℕ), a n > 0) (hb : b 0 = a 0 ∧ ∀ (n : ℕ), b (n + 1) = lcm (b n) (a (n + 1))) : ∀ (n : ℕ), b n > 0 := by
  --  intro n
  have h₁ : ∀ n, b n > 0 := by sorry
  --  exact h₁ n
  simpa