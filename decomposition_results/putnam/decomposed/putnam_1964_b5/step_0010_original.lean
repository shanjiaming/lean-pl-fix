theorem h₂ (a b : ℕ → ℕ) (ha : StrictMono a ∧ ∀ (n : ℕ), a n > 0) (hb : b 0 = a 0 ∧ ∀ (n : ℕ), b (n + 1) = sorry) (h_b_pos : ∀ (n : ℕ), b n > 0) (h_b_mono : ∀ (n : ℕ), b n ≤ b (n + 1)) (h₁ : ∀ (n : ℕ), a n ≥ n + 1) : ∀ (n : ℕ), b n ≥ 2 ^ n := by
  intro n
  have h₃ : ∀ n, (b n : ℕ) ≥ 2 ^ n := by sorry
  exact h₃ n