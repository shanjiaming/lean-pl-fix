theorem h₈₃ (N : ℕ) (hN : N = ∑ i ∈ Finset.range 1998, 10 ^ i) (h₁ : N = (10 ^ 1998 - 1) / 9) (h₂ : 10 ^ 1998 > 1) (h₃ : 10 ^ 1999 > 7) (h₄ : 10 ^ 1998 - 1 > 0) (h₅ : ↑N = (10 ^ 1998 - 1) / 9) (h₆ : 10 ^ 1000 * √↑N < (10 ^ 1999 - 4) / 3) (h₇ : (10 ^ 1999 - 7) / 3 < 10 ^ 1000 * √↑N) (h₈₁ : ↑⌊10 ^ 1000 * √↑N⌋₊ ≤ 10 ^ 1000 * √↑N) (h₈₂ : 10 ^ 1000 * √↑N < ↑⌊10 ^ 1000 * √↑N⌋₊ + 1) : ↑⌊10 ^ 1000 * √↑N⌋₊ = (10 ^ 1999 - 7) / 3 := by
  norm_num at h₆ h₇ h₈₁ h₈₂ ⊢ <;> (try norm_num) <;>
              (try
                  {norm_num [Nat.floor_eq_iff, Nat.cast_add, Nat.cast_one, Nat.cast_pow, Nat.cast_mul,
                        Nat.cast_sub] at h₆ h₇ h₈₁ h₈₂ ⊢ <;>
                      (try norm_num) <;>
                    (try {constructor <;> (try norm_num) <;> (try linarith)
                      })
                }) <;>
            (try
                {ring_nf at h₆ h₇ h₈₁ h₈₂ ⊢ <;> (try norm_num at h₆ h₇ h₈₁ h₈₂ ⊢) <;>
                  (try {constructor <;> (try norm_num) <;> (try linarith)
                    })
              }) <;>
          (try
              {norm_num [Nat.floor_eq_iff, Nat.cast_add, Nat.cast_one, Nat.cast_pow, Nat.cast_mul,
                    Nat.cast_sub] at h₆ h₇ h₈₁ h₈₂ ⊢ <;>
                  (try norm_num) <;>
                (try {constructor <;> (try norm_num) <;> (try linarith)
                  })
            }) <;>
        (try
            {ring_nf at h₆ h₇ h₈₁ h₈₂ ⊢ <;> (try norm_num at h₆ h₇ h₈₁ h₈₂ ⊢) <;>
              (try {constructor <;> (try norm_num) <;> (try linarith)
                })
          }) <;>
      (try
          {simp_all [Nat.floor_eq_iff, Nat.cast_add, Nat.cast_one, Nat.cast_pow, Nat.cast_mul, Nat.cast_sub] <;>
                  norm_num at * <;>
                ring_nf at * <;>
              norm_num at * <;>
            linarith
        }) <;>
    (try {norm_num at h₆ h₇ h₈₁ h₈₂ ⊢ <;> ring_nf at h₆ h₇ h₈₁ h₈₂ ⊢ <;> norm_num at h₆ h₇ h₈₁ h₈₂ ⊢ <;> linarith
      })