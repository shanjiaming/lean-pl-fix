theorem h₂ (x : ℕ) (h₀ : ↑x + 4 / 100 * ↑x = 598) (h₁ : 104 * ↑x = 59800) : 104 * x = 59800 := by
  norm_cast at h₁ <;> (try norm_num at h₁ ⊢) <;> (try ring_nf at h₁ ⊢) <;> (try norm_num at h₁ ⊢) <;> (try omega) <;>
              (try {norm_num at h₁ ⊢ <;> ring_nf at h₁ ⊢ <;> norm_num at h₁ ⊢ <;> omega
                }) <;>
            (try {ring_nf at h₁ ⊢ <;> norm_num at h₁ ⊢ <;> omega
              }) <;>
          (try {norm_num at h₁ ⊢ <;> ring_nf at h₁ ⊢ <;> norm_num at h₁ ⊢ <;> omega
            }) <;>
        (try {ring_nf at h₁ ⊢ <;> norm_num at h₁ ⊢ <;> omega
          }) <;>
      (try {norm_num at h₁ ⊢ <;> ring_nf at h₁ ⊢ <;> norm_num at h₁ ⊢ <;> omega
        }) <;>
    (try {ring_nf at h₁ ⊢ <;> norm_num at h₁ ⊢ <;> omega
      })