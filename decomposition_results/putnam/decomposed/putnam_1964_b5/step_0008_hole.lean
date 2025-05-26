theorem h₁ (a b : ℕ → ℕ) (ha : StrictMono a ∧ ∀ (n : ℕ), a n > 0) (hb : b 0 = a 0 ∧ ∀ (n : ℕ), b (n + 1) = sorry) (h_b_pos : ∀ (n : ℕ), b n > 0) (h_b_mono : ∀ (n : ℕ), b n ≤ b (n + 1)) : ∀ (n : ℕ), a n ≥ n + 1 := by
  --  intro n
  have h₂ : StrictMono a := ha.1
  have h₃ : ∀ k, a k > 0 := ha.2
  have h₄ : ∀ k, a k ≥ k + 1 := by sorry
  --  exact h₄ n
  hole