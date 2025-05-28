theorem mathd_numbertheory_277 (m n : ℕ) (h₀ : Nat.gcd m n = 6) (h₁ : Nat.lcm m n = 126) : 60 ≤ m + n:=
  by
  have h₂ : m ≠ 0:= by
    --  by_contra h
    --  rw [h] at h₁ h₀
    --  simp [Nat.lcm] at h₁ h₀ <;> norm_num at h₁ h₀ ⊢ <;> aesop
    hole
  have h₃ : n ≠ 0:= by
    --  by_contra h
    --  rw [h] at h₁ h₀
    --  simp [Nat.lcm] at h₁ h₀ <;> norm_num at h₁ h₀ ⊢ <;> aesop
    hole
  have h₄ : m * n = 756:=
    by
    have h₄₁ : m * n = Nat.gcd m n * Nat.lcm m n:= by -- rw [Nat.gcd_mul_lcm]
      hole
    --  rw [h₄₁]
    --  rw [h₀, h₁] <;> norm_num
    nlinarith
  have h₅ : 6 ∣ m:= by
    have h₅₁ : 6 ∣ Nat.gcd m n:= by -- norm_num [h₀]
      omega
    --  exact Nat.dvd_trans h₅₁ (Nat.gcd_dvd_left m n)
    hole
  have h₆ : 6 ∣ n:= by
    have h₆₁ : 6 ∣ Nat.gcd m n:= by -- norm_num [h₀]
      omega
    --  exact Nat.dvd_trans h₆₁ (Nat.gcd_dvd_right m n)
    hole
  have h₇ : m + n ≥ 60:= by
    --  by_contra h
    have h₇₁ : m + n < 60:= by -- omega
      linarith
    have h₇₂ : m ≤ 59:= by -- omega
      linarith
    have h₇₃ : n ≤ 59:= by -- omega
      linarith
    have h₇₄ : m ≥ 6:= by
      --  by_contra h₇₄
      have h₇₅ : m ≤ 5:= by -- omega
        linarith
      have h₇₆ : m = 0 ∨ m = 1 ∨ m = 2 ∨ m = 3 ∨ m = 4 ∨ m = 5:= by -- omega
        nlinarith
      --  --  rcases h₇₆ with (h₇₆ | h₇₆ | h₇₆ | h₇₆ | h₇₆ | h₇₆) <;> (try omega) <;>
          (try
              {simp [h₇₆, Nat.lcm, Nat.gcd_eq_right, Nat.gcd_eq_left] at h₁ h₀ h₄ ⊢ <;> norm_num at h₁ h₀ h₄ ⊢ <;>
                  (try omega) <;>
                (try {
                    have h₇₇ : n ≤ 59 := by omega
                    interval_cases n <;> norm_num at h₄ ⊢ <;> omega
                  })
            }) <;>
        (try
            {simp [h₇₆, Nat.lcm, Nat.gcd_eq_right, Nat.gcd_eq_left] at h₁ h₀ h₄ ⊢ <;> norm_num at h₁ h₀ h₄ ⊢ <;>
                (try omega) <;>
              (try {
                  have h₇₇ : n ≤ 59 := by omega
                  interval_cases n <;> norm_num at h₄ ⊢ <;> omega
                })
          })
      hole
    have h₇₅ : n ≥ 6:= by
      --  by_contra h₇₅
      have h₇₆ : n ≤ 5:= by -- omega
        linarith
      have h₇₇ : n = 0 ∨ n = 1 ∨ n = 2 ∨ n = 3 ∨ n = 4 ∨ n = 5:= by -- omega
        nlinarith
      --  --  rcases h₇₇ with (h₇₇ | h₇₇ | h₇₇ | h₇₇ | h₇₇ | h₇₇) <;> (try omega) <;>
          (try
              {simp [h₇₇, Nat.lcm, Nat.gcd_eq_right, Nat.gcd_eq_left] at h₁ h₀ h₄ ⊢ <;> norm_num at h₁ h₀ h₄ ⊢ <;>
                  (try omega) <;>
                (try {
                    have h₇₈ : m ≤ 59 := by omega
                    interval_cases m <;> norm_num at h₄ ⊢ <;> omega
                  })
            }) <;>
        (try
            {simp [h₇₇, Nat.lcm, Nat.gcd_eq_right, Nat.gcd_eq_left] at h₁ h₀ h₄ ⊢ <;> norm_num at h₁ h₀ h₄ ⊢ <;>
                (try omega) <;>
              (try {
                  have h₇₈ : m ≤ 59 := by omega
                  interval_cases m <;> norm_num at h₄ ⊢ <;> omega
                })
          })
      hole
    have h₇₆ : m = 6 ∨ m = 12 ∨ m = 18 ∨ m = 24 ∨ m = 30 ∨ m = 36 ∨ m = 42 ∨ m = 48 ∨ m = 54:=
      by
      have h₇₇ : m ≤ 59:= by -- omega
        linarith
      --  --  --  interval_cases m <;> norm_num at h₄ ⊢ <;> (try omega) <;>
          (try {
              have h₇₈ : n ≤ 59 := by omega
              interval_cases n <;> norm_num at h₄ ⊢ <;> omega
            }) <;>
        (try {omega
          })
      hole
    have h₇₇ : n = 6 ∨ n = 12 ∨ n = 18 ∨ n = 24 ∨ n = 30 ∨ n = 36 ∨ n = 42 ∨ n = 48 ∨ n = 54:=
      by
      have h₇₈ : n ≤ 59:= by -- omega
        linarith
      --  --  --  interval_cases n <;> norm_num at h₄ ⊢ <;> (try omega) <;>
          (try {
              have h₇₉ : m ≤ 59 := by omega
              interval_cases m <;> norm_num at h₄ ⊢ <;> omega
            }) <;>
        (try {omega
          })
      hole
    --  rcases h₇₆ with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl) <;>
    --            rcases h₇₇ with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl) <;>
    --          norm_num at h₀ h₁ h₄ ⊢ <;>
    --        (try omega) <;>
        (try {simp_all [Nat.gcd_eq_right, Nat.gcd_eq_left, Nat.lcm, Nat.mul_div_cancel_left] <;> norm_num at * <;> omega
          }) <;>
      (try omega)
    hole
  --  exact h₇ <;> (try omega) <;> (try norm_num) <;> (try linarith)
  linarith