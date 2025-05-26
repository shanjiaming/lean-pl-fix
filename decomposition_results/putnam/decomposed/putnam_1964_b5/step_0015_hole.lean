theorem h₃ (a b : ℕ → ℕ) (ha : StrictMono a ∧ ∀ (n : ℕ), a n > 0) (hb : b 0 = a 0 ∧ ∀ (n : ℕ), b (n + 1) = sorry) (h_b_pos : ∀ (n : ℕ), b n > 0) (h_b_mono : ∀ (n : ℕ), b n ≤ b (n + 1)) (h_b_exponential : ∀ (n : ℕ), b n ≥ 2 ^ n) (n : ℕ) (h₂ : b n ≥ 2 ^ n) : (↑(b n) : ℝ) ≥ 2 ^ n := by
  --  norm_cast at h₂ ⊢ <;> (try norm_num) <;> (try linarith) <;> (try ring_nf at h₂ ⊢) <;> (try norm_num at h₂ ⊢) <;>
    (try linarith)
  hole