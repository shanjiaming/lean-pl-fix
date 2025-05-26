theorem h₅₅ (T : ℝ) (hT : 0 < T) (h : ¬False) (h₁ h₂ : T > 0) (h₄ : 2 * T ≥ T) (h₅₁ : (↑⌊T⌋₊ : ℝ) ≤ T) (h₅₂ : T < (↑⌊T⌋₊ : ℝ) + 1) (h₅₃ : 2 * (↑⌊T⌋₊ : ℝ) ≤ 2 * T) (h₅₄ : 2 * T < 2 * (↑⌊T⌋₊ : ℝ) + 2) : ⌊2 * T⌋₊ = 2 * ⌊T⌋₊ :=
  by
  rw [Int.floor_eq_iff]
  constructor <;> norm_num at h₅₁ h₅₂ h₅₃ h₅₄ ⊢ <;> (try norm_num) <;> (try linarith) <;>
      (try
          {norm_num at h₅₁ h₅₂ h₅₃ h₅₄ ⊢ <;> (try norm_num) <;> (try linarith) <;>
            (try
                {cases' le_or_lt 0 (T - Nat.floor T) with h₅₆ h₅₆ <;>
                          cases' le_or_lt 0 (2 * T - 2 * (Nat.floor T : ℝ)) with h₅₇ h₅₇ <;>
                        simp_all [Nat.floor_eq_iff, Int.floor_eq_iff, Nat.cast_add, Nat.cast_mul, Nat.cast_ofNat] <;>
                      (try norm_num) <;>
                    (try linarith) <;>
                  (try {nlinarith
                    })
              })
        }) <;>
    (try
        {cases' le_or_lt 0 (T - Nat.floor T) with h₅₆ h₅₆ <;>
                  cases' le_or_lt 0 (2 * T - 2 * (Nat.floor T : ℝ)) with h₅₇ h₅₇ <;>
                simp_all [Nat.floor_eq_iff, Int.floor_eq_iff, Nat.cast_add, Nat.cast_mul, Nat.cast_ofNat] <;>
              (try norm_num) <;>
            (try linarith) <;>
          (try {nlinarith
            })
      })