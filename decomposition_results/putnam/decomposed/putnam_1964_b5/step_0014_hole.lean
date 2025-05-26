theorem h₁ (a b : ℕ → ℕ) (ha : StrictMono a ∧ ∀ (n : ℕ), a n > 0) (hb : b 0 = a 0 ∧ ∀ (n : ℕ), b (n + 1) = sorry) (h_b_pos : ∀ (n : ℕ), b n > 0) (h_b_mono : ∀ (n : ℕ), b n ≤ b (n + 1)) (h_b_exponential : ∀ (n : ℕ), b n ≥ 2 ^ n) : ∀ (n : ℕ), (↑(b n) : ℝ) ≥ 2 ^ n := by
  --  intro n
  have h₂ : (b n : ℕ) ≥ 2 ^ n := h_b_exponential n
  have h₃ : (b n : ℝ) ≥ (2 : ℝ) ^ n := by sorry
  --  exact h₃
  hole