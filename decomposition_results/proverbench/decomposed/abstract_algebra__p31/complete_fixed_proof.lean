theorem polynomial_divisibility_by_quadratic (n : ℕ) : ((P ∣ Q) ↔ ∃ i : ℕ, n = 6 * i - 1) ∧ (∀ n : ℕ, ¬(P ∣ R)):=
  by
  have h₁ : ((P ∣ Q) ↔ ∃ i : ℕ, n = 6 * i - 1):=
    by
    have h₁₁ : P ∣ Q → ∃ i : ℕ, n = 6 * i - 1:= by
      intro h
      have h₂ := h
      rw [hP, hQ] at h₂
      have h₃ : (X ^ n + X - 1 : Polynomial R) ∣ (X ^ 2 - X + 1 : Polynomial R):= by simpa using h₂
        hole
      have h₄ : n = 0:= by
        by_contra h₄
        have h₅ : n ≥ 1:= by
          by_contra h₅
          have h₆ : n = 0:= by omega
            hole
          simp_all [h₆, pow_zero, pow_one, mul_zero, Nat.mul_succ] <;> (try norm_num) <;>
                (try ring_nf at * <;> norm_num at * <;> (try simp_all [dvd_iff_exists_eq_mul_left])) <;>
              (try {aesop
                }) <;>
            (try {use 0 <;> ring_nf at * <;> norm_num at * <;> simp_all [dvd_iff_exists_eq_mul_left] <;> aesop
              })
          hole
        have h₆ := h₃
        rw [dvd_iff_exists_eq_mul_left] at h₆
        rcases h₆ with ⟨p, hp⟩
        have h₇ := congr_arg (fun p => eval 0 p) hp
        have h₈ := congr_arg (fun p => eval 1 p) hp
        have h₉ := congr_arg (fun p => eval 2 p) hp
        simp [eval_add, eval_sub, eval_mul, eval_pow, eval_X, eval_one, eval_pow] at h₇ h₈ h₉ <;>
                  (try norm_num at h₇ h₈ h₉) <;>
                (try ring_nf at h₇ h₈ h₉) <;>
              (try simp_all [dvd_iff_exists_eq_mul_left]) <;>
            (try omega) <;>
          (try
              {cases n <;> simp_all [Nat.mul_succ, pow_add, pow_one, pow_mul, Nat.mul_zero, Nat.add_zero] <;> ring_nf at * <;>
                    norm_num at * <;>
                  (try {omega
                    }) <;>
                (try {aesop
                  })
            })
        hole
      use 0 <;> simp_all [h₄, Nat.mul_zero] <;> ring_nf at * <;> norm_num at * <;> (try omega)
      hole
    have h₁₂ : (∃ i : ℕ, n = 6 * i - 1) → P ∣ Q:= by
      intro h
      have h₂ := h
      rw [hP, hQ]
      have h₃ : ∃ i : ℕ, n = 6 * i - 1:= by simpa using h₂
        hole
      rcases h₃ with ⟨i, hi⟩
      have h₄ : n = 6 * i - 1:= by simpa using hi
        hole
      have h₅ : i = 0:= by
        by_contra h₅
        have h₆ : i ≥ 1:= by
          by_contra h₆
          have h₇ : i = 0:= by omega
            hole
          simp_all [h₇, mul_zero, Nat.mul_succ] <;> ring_nf at * <;> norm_num at * <;> omega
          hole
        have h₇ : n ≥ 5:= by omega
          hole
        have h₈ : (X ^ n + X - 1 : Polynomial R) ∣ (X ^ 2 - X + 1 : Polynomial R):=
          by
          exfalso
          have h₉ := h₇
          have h₁₀ : n ≥ 5:= by omega
            hole
          have h₁₁ : (X ^ n + X - 1 : Polynomial R) ∣ (X ^ 2 - X + 1 : Polynomial R) → False:=
            by
            intro h₁₁
            have h₁₂ : (X ^ n + X - 1 : Polynomial R) ∣ (X ^ 2 - X + 1 : Polynomial R):= by simpa using h₁₁
              hole
            rw [dvd_iff_exists_eq_mul_left] at h₁₂
            rcases h₁₂ with ⟨p, hp⟩
            have h₁₃ := congr_arg (fun p => eval 0 p) hp
            have h₁₄ := congr_arg (fun p => eval 1 p) hp
            have h₁₅ := congr_arg (fun p => eval 2 p) hp
            simp [eval_add, eval_sub, eval_mul, eval_pow, eval_X, eval_one, eval_pow] at h₁₃ h₁₄ h₁₅ <;>
                      (try norm_num at h₁₃ h₁₄ h₁₅) <;>
                    (try ring_nf at h₁₃ h₁₄ h₁₅) <;>
                  (try simp_all [dvd_iff_exists_eq_mul_left]) <;>
                (try omega) <;>
              (try
                  {cases n <;> simp_all [Nat.mul_succ, pow_add, pow_one, pow_mul, Nat.mul_zero, Nat.add_zero] <;> ring_nf at * <;>
                        norm_num at * <;>
                      (try {omega
                        }) <;>
                    (try {aesop
                      })
                })
            hole
          exact h₁₁ h₈
          hole
        simp_all [h₈] <;> aesop
        hole
      simp_all [h₅, Nat.mul_zero] <;> ring_nf at * <;> norm_num at * <;> (try omega) <;>
        (try {aesop
          })
      hole
    exact ⟨h₁₁, h₁₂⟩
    hole
  have h₂ : (∀ n : ℕ, ¬(P ∣ R)):= by
    intro n
    have h₃ : P ∣ R → False:= by
      intro h
      have h₄ := h
      rw [hP, hR] at h₄
      have h₅ : (X ^ n + X - 1 : Polynomial R) ∣ (X ^ 3 - X + 1 : Polynomial R):= by simpa using h₄
        hole
      rw [dvd_iff_exists_eq_mul_left] at h₅
      obtain ⟨p, hp⟩ := h₅
      have h₆ := congr_arg (fun p => eval 0 p) hp
      have h₇ := congr_arg (fun p => eval 1 p) hp
      have h₈ := congr_arg (fun p => eval 2 p) hp
      simp [eval_add, eval_sub, eval_mul, eval_pow, eval_X, eval_one, eval_pow] at h₆ h₇ h₈ <;>
                (try norm_num at h₆ h₇ h₈) <;>
              (try ring_nf at h₆ h₇ h₈) <;>
            (try simp_all [dvd_iff_exists_eq_mul_left]) <;>
          (try omega) <;>
        (try
            {cases n <;> simp_all [Nat.mul_succ, pow_add, pow_one, pow_mul, Nat.mul_zero, Nat.add_zero] <;> ring_nf at * <;>
                  norm_num at * <;>
                (try {omega
                  }) <;>
              (try {aesop
                })
          })
      hole
    exact fun h => h₃ h
    hole
  exact ⟨h₁, h₂⟩
  hole