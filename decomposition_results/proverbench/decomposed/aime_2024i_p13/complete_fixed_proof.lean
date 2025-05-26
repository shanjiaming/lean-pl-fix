theorem aime_2024i_p13 (p m : ℕ) (h₀ : isSolution p m) (h₁ : ∀ q < p, ¬(∃ (n : ℕ), isSolution q n))
  (h₂ : ∀ k < m, ¬isSolution p k) : m = 110:=
  by
  have h_p_eq_17 : p = 17:= by
    have h₀' : p.Prime := h₀.1
    have h₀'' : 0 < m := h₀.2.1
    have h₀''' : p ^ 2 ∣ m ^ 4 + 1 := h₀.2.2
    have h₃ : p ≤ 17:= by
      --  by_contra h
      have h₄ : p ≥ 18:= by -- linarith
        hole
      have h₅ : 17 < p:= by -- linarith
        hole
      have h₆ : ¬(∃ (n : ℕ), isSolution 17 n) := h₁ 17 (by linarith)
      have h₇ : ∃ (n : ℕ), isSolution 17 n:= by
        --  use 110
        --  constructor
        · norm_num [Nat.Prime]
        constructor
        · norm_num
        · norm_num [Nat.pow_succ, Nat.pow_zero, Nat.mul_assoc] <;> decide
        hole
      exact h₆ h₇
      hole
    have h₄ : p ≥ 2 := Nat.Prime.two_le h₀'
    --  --  --  interval_cases p <;> norm_num [Nat.Prime, isSolution] at h₀' h₀''' h₁ h₃ h₄ ⊢ <;> (try omega) <;>
    --            (try {
    --                have h₅ := h₁ 2
    --                have h₆ := h₁ 3
    --                have h₇ := h₁ 5
    --                have h₈ := h₁ 7
    --                have h₉ := h₁ 11
    --                have h₁₀ := h₁ 13
    --                norm_num [Nat.Prime, isSolution] at h₅ h₆ h₇ h₈ h₉ h₁₀ <;> (try omega) <;>
    --                  (try {
    --                      exfalso
    --                      have h₁₁ := h₅
    --                      have h₁₂ := h₆
    --                      have h₁₃ := h₇
    --                      have h₁₄ := h₈
    --                      have h₁₅ := h₉
    --                      have h₁₆ := h₁₀
    --                      simp_all [Nat.Prime, isSolution] <;> norm_num at * <;> (try omega) <;>
    --                        (try {
    --                            have h₁₇ : m ^ 2 ≥ 1 := by nlinarith
    --                            have h₁₈ : m ^ 4 ≥ 1 := by nlinarith
    --                            omega
    --                          })
    --                    })
    --              }) <;>
    --          (try {
    --              have h₅ := h₁ 2
    --              have h₆ := h₁ 3
    --              have h₇ := h₁ 5
    --              have h₈ := h₁ 7
    --              have h₉ := h₁ 11
    --              have h₁₀ := h₁ 13
    --              norm_num [Nat.Prime, isSolution] at h₅ h₆ h₇ h₈ h₉ h₁₀ <;> (try omega) <;>
    --                (try {
    --                    exfalso
    --                    have h₁₁ := h₅
    --                    have h₁₂ := h₆
    --                    have h₁₃ := h₇
    --                    have h₁₄ := h₈
    --                    have h₁₅ := h₉
    --                    have h₁₆ := h₁₀
    --                    simp_all [Nat.Prime, isSolution] <;> norm_num at * <;> (try omega) <;>
    --                      (try {
    --                          have h₁₇ : m ^ 2 ≥ 1 := by nlinarith
    --                          have h₁₈ : m ^ 4 ≥ 1 := by nlinarith
    --                          omega
    --                        })
    --                  })
    --            }) <;>
    --        (try omega) <;>
    --      (try {
    --          have h₅ : p = 17 := by omega
    --          exact h₅
    --        }) <;>
    --    (try omega)
    hole
  have h_m_le_110 : m ≤ 110:= by
    --  by_contra h
    have h₁₀ : m ≥ 111:= by -- linarith
      hole
    have h₁₁ : isSolution p 110:= by
      --  rw [h_p_eq_17] at *
      --  constructor
      · norm_num [Nat.Prime]
      constructor
      · norm_num
      · norm_num [Nat.pow_succ, Nat.pow_zero, Nat.mul_assoc] at * <;> decide
      hole
    have h₁₂ : 110 < m:= by -- omega
      hole
    have h₁₃ : isSolution p 110 := h₁₁
    have h₁₄ : ¬isSolution p 110 := h₂ 110 (by omega)
    --  exact h₁₄ h₁₃
    hole
  have h_m_ge_110 : m ≥ 110:= by
    by_contra h
    have h₁₀ : m ≤ 109:= by -- omega
      hole
    have h₁₁ : m > 0 := h₀.2.1
    interval_cases m <;> norm_num [isSolution, h_p_eq_17, Nat.Prime, Nat.div_eq_of_lt] at h₀ h₂ ⊢ <;> (try omega) <;>
            (try {
                have h₁₂ := h₂ 1
                have h₁₃ := h₂ 2
                have h₁₄ := h₂ 3
                have h₁₅ := h₂ 4
                have h₁₆ := h₂ 5
                have h₁₇ := h₂ 6
                have h₁₈ := h₂ 7
                have h₁₉ := h₂ 8
                have h₂₀ := h₂ 9
                have h₂₁ := h₂ 10
                have h₂₂ := h₂ 110
                norm_num [isSolution, h_p_eq_17, Nat.Prime,
                      Nat.div_eq_of_lt] at h₁₂ h₁₃ h₁₄ h₁₅ h₁₆ h₁₇ h₁₈ h₁₉ h₂₀ h₂₁ h₂₂ <;>
                    (try omega) <;>
                  (try {simp_all [Nat.Prime, Nat.div_eq_of_lt] <;> norm_num <;> omega
                    })
              }) <;>
          (try omega) <;>
        (try {
            have h₁₂ := h₂ 1
            have h₁₃ := h₂ 2
            have h₁₄ := h₂ 3
            have h₁₅ := h₂ 4
            have h₁₆ := h₂ 5
            have h₁₇ := h₂ 6
            have h₁₈ := h₂ 7
            have h₁₉ := h₂ 8
            have h₂₀ := h₂ 9
            have h₂₁ := h₂ 10
            have h₂₂ := h₂ 110
            norm_num [isSolution, h_p_eq_17, Nat.Prime,
                  Nat.div_eq_of_lt] at h₁₂ h₁₃ h₁₄ h₁₅ h₁₆ h₁₇ h₁₈ h₁₉ h₂₀ h₂₁ h₂₂ <;>
                (try omega) <;>
              (try {simp_all [Nat.Prime, Nat.div_eq_of_lt] <;> norm_num <;> omega
                })
          }) <;>
      (try omega)
    hole
  have h_main : m = 110:= by
    have h₁₁ : m ≤ 110 := h_m_le_110
    have h₁₂ : m ≥ 110 := h_m_ge_110
    --  linarith
    hole
  --  exact h_main
  hole