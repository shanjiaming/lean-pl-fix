theorem mathd_algebra_276 (a b : ℤ) (h₀ : ∀ x : ℝ, 10 * x ^ 2 - x - 24 = (a * x - 8) * (b * x + 3)) : a * b + b = 12:=
  by
  have h₁ : (a + 8 : ℤ) * (b - 3) = -13:= by
    have h₁₀ := h₀ (-1 : ℝ)
    --  norm_num at h₁₀
    --  ring_nf at h₁₀
    have h₁₁ := congr_arg (fun x : ℝ => (x : ℝ)) h₁₀
    --  norm_num at h₁₁
    --  ring_nf at h₁₁
    --  --  --  --  norm_cast at h₁₁ ⊢ <;> (try norm_num at h₁₁ ⊢) <;> (try ring_nf at h₁₁ ⊢) <;> (try nlinarith) <;>
    --            (try {nlinarith [sq_nonneg (a + 8 : ℤ), sq_nonneg (b - 3 : ℤ), sq_nonneg (a - 8 : ℤ), sq_nonneg (b + 3 : ℤ)]
    --              }) <;>
    --          (try {nlinarith [sq_nonneg (a + 8 : ℤ), sq_nonneg (b - 3 : ℤ), sq_nonneg (a - 8 : ℤ), sq_nonneg (b + 3 : ℤ)]
    --            }) <;>
    --        (try {nlinarith [sq_nonneg (a + 8 : ℤ), sq_nonneg (b - 3 : ℤ), sq_nonneg (a - 8 : ℤ), sq_nonneg (b + 3 : ℤ)]
    --          }) <;>
    --      (try {nlinarith [sq_nonneg (a + 8 : ℤ), sq_nonneg (b - 3 : ℤ), sq_nonneg (a - 8 : ℤ), sq_nonneg (b + 3 : ℤ)]
    --        }) <;>
    --    nlinarith [sq_nonneg (a + 8 : ℤ), sq_nonneg (b - 3 : ℤ), sq_nonneg (a - 8 : ℤ), sq_nonneg (b + 3 : ℤ)]
    hole
  have h₂ : (a - 8 : ℤ) * (b + 3) = -15:= by
    have h₂₀ := h₀ (1 : ℝ)
    --  norm_num at h₂₀
    --  ring_nf at h₂₀
    have h₂₁ := congr_arg (fun x : ℝ => (x : ℝ)) h₂₀
    --  norm_num at h₂₁
    --  ring_nf at h₂₁
    --  --  --  --  norm_cast at h₂₁ ⊢ <;> (try norm_num at h₂₁ ⊢) <;> (try ring_nf at h₂₁ ⊢) <;> (try nlinarith) <;>
    --            (try {nlinarith [sq_nonneg (a + 8 : ℤ), sq_nonneg (b - 3 : ℤ), sq_nonneg (a - 8 : ℤ), sq_nonneg (b + 3 : ℤ)]
    --              }) <;>
    --          (try {nlinarith [sq_nonneg (a + 8 : ℤ), sq_nonneg (b - 3 : ℤ), sq_nonneg (a - 8 : ℤ), sq_nonneg (b + 3 : ℤ)]
    --            }) <;>
    --        (try {nlinarith [sq_nonneg (a + 8 : ℤ), sq_nonneg (b - 3 : ℤ), sq_nonneg (a - 8 : ℤ), sq_nonneg (b + 3 : ℤ)]
    --          }) <;>
    --      (try {nlinarith [sq_nonneg (a + 8 : ℤ), sq_nonneg (b - 3 : ℤ), sq_nonneg (a - 8 : ℤ), sq_nonneg (b + 3 : ℤ)]
    --        }) <;>
    --    nlinarith [sq_nonneg (a + 8 : ℤ), sq_nonneg (b - 3 : ℤ), sq_nonneg (a - 8 : ℤ), sq_nonneg (b + 3 : ℤ)]
    hole
  have h₃ : a = 5:=
    by
    have h₃₁ : a = 5:= by
      have h₃₂ : (a + 8 : ℤ) * (b - 3) = -13 := h₁
      have h₃₃ : (a - 8 : ℤ) * (b + 3) = -15 := h₂
      have h₃₄ : a = 5:=
        by
        have h₃₅ : a = 5:=
          by
          have h₃₆ : a = 5:=
            by
            have h₃₇ : a + 8 = 13 ∨ a + 8 = -13 ∨ a + 8 = 1 ∨ a + 8 = -1:=
              by
              have h₃₈ : a + 8 ∣ -13:= by
                --  use b - 3
                --  linarith
                hole
              have h₃₉ : a + 8 = 13 ∨ a + 8 = -13 ∨ a + 8 = 1 ∨ a + 8 = -1:=
                by
                have h₄₀ : a + 8 = 13 ∨ a + 8 = -13 ∨ a + 8 = 1 ∨ a + 8 = -1:=
                  by
                  --  rw [← Int.natAbs_dvd_natAbs] at h₃₈
                  have h₄₁ : (a + 8 : ℤ).natAbs ∣ 13:= by
                    --  --  norm_num at h₃₈ ⊢ <;> (try omega) <;>
                        (try {cases' h₃₈ with h₃₈ h₃₈ <;> simp_all [Int.natAbs_of_nonneg, Int.ofNat_inj] <;> omega
                          }) <;>
                      (try omega)
                    hole
                  have h₄₂ : (a + 8 : ℤ).natAbs = 1 ∨ (a + 8 : ℤ).natAbs = 13:=
                    by
                    have h₄₃ : (a + 8 : ℤ).natAbs ∣ 13 := h₄₁
                    have h₄₄ : (a + 8 : ℤ).natAbs = 1 ∨ (a + 8 : ℤ).natAbs = 13:=
                      by
                      have h₄₅ : (a + 8 : ℤ).natAbs ≤ 13 := Nat.le_of_dvd (by norm_num) h₄₁
                      --  --  interval_cases (a + 8 : ℤ).natAbs <;> norm_num at h₄₁ ⊢ <;> omega
                      hole
                    --  exact h₄₄
                    omega
                  --  cases' h₄₂ with h₄₂ h₄₂
                  ·
                    have h₄₆ : a + 8 = 1 ∨ a + 8 = -1:= by
                      have h₄₇ : (a + 8 : ℤ).natAbs = 1 := h₄₂
                      have h₄₈ : a + 8 = 1 ∨ a + 8 = -1:= by
                        --  rw [Int.natAbs_eq_iff] at h₄₇
                        --  tauto
                        omega
                      --  exact h₄₈
                      omega
                  --    cases' h₄₆ with h₄₆ h₄₆
                  --    · omega
                  --    · omega
                  ·
                    have h₄₆ : a + 8 = 13 ∨ a + 8 = -13 :=
                      by
                      have h₄₇ : (a + 8 : ℤ).natAbs = 13 := h₄₂
                      have h₄₈ : a + 8 = 13 ∨ a + 8 = -13 := by
                        rw [Int.natAbs_eq_iff] at h₄₇
                        tauto
                      exact h₄₈
                  --    cases' h₄₆ with h₄₆ h₄₆
                  --    · omega
                    have h₄₆ : a + 8 = 13 ∨ a + 8 = -13 := by sorry
                have h₄₀ : a + 8 = 13 ∨ a + 8 = -13 ∨ a + 8 = 1 ∨ a + 8 = -1 :=
                  by
                  rw [← Int.natAbs_dvd_natAbs] at h₃₈
                  have h₄₁ : (a + 8 : ℤ).natAbs ∣ 13 := by sorry
                  have h₄₂ : (a + 8 : ℤ).natAbs = 1 ∨ (a + 8 : ℤ).natAbs = 13 := by sorry
                  cases' h₄₂ with h₄₂ h₄₂
                  ·
                    have h₄₆ : a + 8 = 1 ∨ a + 8 = -1 := by sorry
                    cases' h₄₆ with h₄₆ h₄₆
                    · omega
                    · omega
                  ·
                    have h₄₆ : a + 8 = 13 ∨ a + 8 = -13 :=
                      by
                      have h₄₇ : (a + 8 : ℤ).natAbs = 13 := h₄₂
                      have h₄₈ : a + 8 = 13 ∨ a + 8 = -13 := by
                        rw [Int.natAbs_eq_iff] at h₄₇
                        tauto
                      exact h₄₈
                    cases' h₄₆ with h₄₆ h₄₆
                    · omega
                    · omega
                  hole
                --  exact h₄₀
                omega
              --  exact h₃₉
              omega
            --  cases' h₃₇ with h₃₇ h₃₇
            ·
              have h₃₈ : a + 8 = 13 := h₃₇
              have h₃₉ : a = 5:= by -- omega
                linarith
            --    exact h₃₉
            --  · cases' h₃₇ with h₃₇ h₃₇
              ·
                have h₃₈ : a + 8 = -13 := h₃₇
                have h₃₉ : a = -21 := by sorry
                have h₄₀ : (a - 8 : ℤ) * (b + 3) = -15 := h₂
                have h₄₁ : a = -21 := h₃₉
            --      rw [h₄₁] at h₄₀
            --  --      norm_num at h₄₀ <;> (try omega) <;>
                    (try {
                        have h₄₂ := h₁
                        rw [h₄₁] at h₄₂
                        norm_num at h₄₂ <;> omega
                      }) <;>
                  omega
            --    · cases' h₃₇ with h₃₇ h₃₇
                ·
                  have h₃₈ : a + 8 = 1 := h₃₇
                  have h₃₉ : a = -7 := by sorry
                  have h₄₀ : (a - 8 : ℤ) * (b + 3) = -15 := h₂
                  have h₄₁ : a = -7 := h₃₉
            --        rw [h₄₁] at h₄₀
            --  --        norm_num at h₄₀ <;> (try omega) <;>
            --            (try {
            --                have h₄₂ := h₁
            --                rw [h₄₁] at h₄₂
            --                norm_num at h₄₂ <;> omega
            --              }) <;>
                    omega
                ·
                  have h₃₈ : a + 8 = -1 := h₃₇
                  have h₃₉ : a = -9 := by sorry
                  have h₄₀ : (a - 8 : ℤ) * (b + 3) = -15 := h₂
                  have h₄₁ : a = -9 := h₃₉
            --        rw [h₄₁] at h₄₀
            --  --        norm_num at h₄₀ <;> (try omega) <;>
                      (try {
                          have h₄₂ := h₁
                          rw [h₄₁] at h₄₂
                          norm_num at h₄₂ <;> omega
                        }) <;>
                    omega
            hole
          --  exact h₃₆
          linarith
        --  exact h₃₅
        linarith
      --  exact h₃₄
      linarith
    --  exact h₃₁
    linarith
  have h₄ : b = 2:=
    by
    have h₄₁ : b = 2:= by
      have h₄₂ : (a + 8 : ℤ) * (b - 3) = -13 := h₁
      have h₄₃ : (a - 8 : ℤ) * (b + 3) = -15 := h₂
      have h₄₄ : a = 5 := h₃
      --  rw [h₄₄] at h₄₂ h₄₃
      --  --  norm_num at h₄₂ h₄₃ ⊢ <;> (try omega) <;> (try nlinarith) <;>
        (try {omega
          })
      hole
    --  exact h₄₁
    linarith
  have h₅ : a * b + b = 12:= by -- -- rw [h₃, h₄] <;> norm_num <;> linarith
    linarith
  --  exact h₅
  linarith