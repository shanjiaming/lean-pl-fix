theorem h₈₇ (a b : ℕ → ℝ) (h₀ : ∀ (n : ℕ), a (n + 1) = √3 * a n - b n) (h₁ : ∀ (n : ℕ), b (n + 1) = √3 * b n + a n) (h₂ : a 100 = 2) (h₃ : b 100 = 4) (h₄ : ∀ (n : ℕ), a (n + 3) = -8 * b n) (h₅ : ∀ (n : ℕ), b (n + 3) = 8 * a n) (h₆ : ∀ (n : ℕ), a (n + 6) = -64 * a n) (h₇ : ∀ (n : ℕ), b (n + 6) = -64 * b n) (h₈₁ : a 100 = 2) (h₈₂ : b 100 = 4) : a 100 = (-64) ^ 16 * a 4 := by
  norm_num [h₆, h₇, pow_succ, mul_assoc] at h₈₁ h₈₂ ⊢ <;> (try ring_nf at * <;> try norm_num at * <;> try linarith) <;>
        (try ring_nf at * <;> try norm_num at * <;> try linarith) <;>
      (try ring_nf at * <;> try norm_num at * <;> try linarith) <;>
    (try ring_nf at * <;> try norm_num at * <;> try linarith)