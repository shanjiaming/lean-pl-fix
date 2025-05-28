theorem h_b_mono (a b : ℕ → ℕ) (ha : StrictMono a ∧ ∀ (n : ℕ), a n > 0) (hb : b 0 = a 0 ∧ ∀ (n : ℕ), b (n + 1) = lcm (b n) (a (n + 1))) (h_b_pos : ∀ (n : ℕ), b n > 0) : ∀ (n : ℕ), b n ≤ b (n + 1) := by
  intro n
  have h₁ : b (n + 1) = lcm (b n) (a (n + 1)) := hb.2 n
  rw [h₁]
  have h₂ : b n ∣ lcm (b n) (a (n + 1)) := dvd_lcm_left (b n) (a (n + 1))
  have h₃ : b n ≤ lcm (b n) (a (n + 1)) := by sorry
  exact h₃