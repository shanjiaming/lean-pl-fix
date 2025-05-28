theorem h₃₁ (m a : ℕ) (h₀ : 0 < m ∧ 0 < a) (h₁ : ↑m / ↑a = 3 / 4) (h₂ : 4 * ↑m = 3 * ↑a) : 4 * m = 3 * a := by
  norm_cast at h₂ ⊢ <;> (try norm_num) <;> (try ring_nf at h₂ ⊢) <;> (try field_simp at h₂ ⊢) <;>
                (try norm_cast at h₂ ⊢) <;>
              (try ring_nf at h₂ ⊢) <;>
            (try norm_num at h₂ ⊢) <;>
          (try nlinarith) <;>
        (try omega) <;>
      (try {
          have h₃₂ : a > 0 := by linarith
          have h₃₃ : m > 0 := by linarith
          norm_cast at h₂ ⊢ <;> ring_nf at h₂ ⊢ <;> norm_num at h₂ ⊢ <;> nlinarith
        }) <;>
    (try {norm_num at h₂ ⊢ <;> nlinarith
      })