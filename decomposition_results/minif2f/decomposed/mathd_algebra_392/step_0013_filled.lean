theorem h₄ (n : ℕ) (h₀ : Even n) (h₁ : (↑n - 2) ^ 2 + ↑n ^ 2 + (↑n + 2) ^ 2 = 12296) (h₂ : ↑n ^ 2 = 4096) (h₃ : n = 64) : (↑n - 2) * ↑n * (↑n + 2) / 8 = 32736 := by
  --  rw [h₃]
  norm_num <;> (try ring_nf at h₁ ⊢) <;> (try norm_num at h₁ ⊢) <;> (try linarith) <;> (try omega)
  hole