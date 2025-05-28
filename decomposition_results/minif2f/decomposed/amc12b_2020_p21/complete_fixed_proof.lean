theorem amc12b_2020_p21 (S : Finset ℕ) (h₀ : ∀ n : ℕ, n ∈ S ↔ 0 < n ∧ (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n)) :
  S.card = 6:=
  by
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 }:=
    by
    --  apply Finset.ext
    --  intro n
    --  rw [h₀]
    --  simp only [Finset.mem_insert, Finset.mem_singleton]
    --  constructor
    --  · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0:=
        by
        have h₄ : ((n : ℝ) + 1000) / 70 = Int.floor (Real.sqrt n):= by -- exact_mod_cast h₂
          hole
        have h₅ : (n + 1000 : ℤ) % 70 = 0:=
          by
          have h₆ : ((n : ℝ) + 1000 : ℝ) / 70 = Int.floor (Real.sqrt n):= by -- exact_mod_cast h₂
            hole
          have h₇ : (n : ℤ) + 1000 ≡ 0 [ZMOD 70]:=
            by
            have h₈ : ((n : ℝ) + 1000 : ℝ) / 70 = Int.floor (Real.sqrt n):= by -- exact_mod_cast h₂
              hole
            have h₉ : (Int.floor (Real.sqrt n) : ℝ) = ((n : ℝ) + 1000 : ℝ) / 70:= by -- linarith
              hole
            have h₁₀ : (Int.floor (Real.sqrt n) : ℝ) * 70 = (n : ℝ) + 1000:= by -- linarith
              hole
            have h₁₁ : (Int.floor (Real.sqrt n) : ℤ) * 70 = (n : ℤ) + 1000:= by
              --  --  --  --  norm_cast at h₁₀ ⊢ <;> (try norm_num at h₁₀ ⊢) <;> (try ring_nf at h₁₀ ⊢) <;> (try field_simp at h₁₀ ⊢) <;>
              --            (try norm_cast at h₁₀ ⊢) <;>
              --          (try linarith) <;>
              --        (try ring_nf at h₁₀ ⊢) <;>
              --      (try norm_cast at h₁₀ ⊢) <;>
              --    (try linarith)
              hole
            have h₁₂ : (n : ℤ) + 1000 ≡ 0 [ZMOD 70]:= by
              --  rw [Int.ModEq]
              --  omega
              hole
            --  exact h₁₂
            hole
          --  exact h₇
          hole
        --  exact_mod_cast h₅
        hole
      have h₄ : n % 70 = 50:= by -- omega
        hole
      have h₅ : ∃ k : ℕ, n = 70 * k + 50:= by
        --  use n / 70
        have h₆ := Nat.mod_add_div n 70
        --  omega
        hole
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n):=
        by
        have h₈ : ((n : ℝ) + 1000 : ℝ) / 70 = Int.floor (Real.sqrt n):= by -- exact_mod_cast h₂
          hole
        have h₉ : (k : ℝ) + 15 = ((n : ℝ) + 1000 : ℝ) / 70:= by
          --  --  --  --  --  --  --  rw [h₆] <;> ring_nf at * <;> norm_num <;> field_simp at * <;> ring_nf at * <;> norm_cast at * <;> linarith
          hole
        have h₁₀ : (k : ℝ) + 15 = (Int.floor (Real.sqrt n) : ℝ):= by -- linarith
          hole
        have h₁₁ : (k : ℤ) + 15 = Int.floor (Real.sqrt n):= by
          --  --  --  --  norm_cast at h₁₀ ⊢ <;> (try norm_num at h₁₀ ⊢) <;> (try ring_nf at h₁₀ ⊢) <;> (try field_simp at h₁₀ ⊢) <;>
          --      (try norm_cast at h₁₀ ⊢) <;>
          --    (try linarith)
          hole
        --  exact_mod_cast h₁₁
        hole
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ):=
        by
        have h₉ : (k + 15 : ℝ) ≤ Real.sqrt n:=
          by
          have h₁₀ : (k + 15 : ℝ) ≤ Real.sqrt n:=
            by
            have h₁₁ : (k + 15 : ℝ) = Int.floor (Real.sqrt n):= by -- exact_mod_cast h₇
              hole
            have h₁₂ : (Int.floor (Real.sqrt n) : ℝ) ≤ Real.sqrt n:= by -- exact Int.floor_le (Real.sqrt n)
              hole
            --  linarith
            hole
          --  exact h₁₀
          hole
        have h₁₀ : 0 ≤ Real.sqrt n := Real.sqrt_nonneg n
        have h₁₁ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ):= by -- nlinarith [Real.sq_sqrt (by positivity : 0 ≤ (n : ℝ)), h₉]
          hole
        --  exact h₁₁
        hole
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2:=
        by
        have h₁₀ : Real.sqrt n < (k + 16 : ℝ):=
          by
          have h₁₁ : Real.sqrt n < (k + 16 : ℝ):=
            by
            have h₁₂ : (Int.floor (Real.sqrt n) : ℝ) = (k + 15 : ℝ):=
              by
              have h₁₃ : (k + 15 : ℝ) = Int.floor (Real.sqrt n):= by -- exact_mod_cast h₇
                hole
              --  linarith
              hole
            have h₁₃ : Real.sqrt n < (Int.floor (Real.sqrt n) : ℝ) + 1:= by
              --  linarith [Int.floor_le (Real.sqrt n), Int.lt_floor_add_one (Real.sqrt n)]
              hole
            --  linarith
            hole
          --  exact h₁₁
          hole
        have h₁₁ : 0 ≤ Real.sqrt n := Real.sqrt_nonneg n
        have h₁₂ : (n : ℝ) < (k + 16 : ℝ) ^ 2:= by -- nlinarith [Real.sq_sqrt (by positivity : 0 ≤ (n : ℝ)), h₁₀]
          hole
        --  exact h₁₂
        hole
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n:= by
        --  norm_cast at h₈ ⊢ <;> (try ring_nf at h₈ ⊢) <;> (try norm_num at h₈ ⊢) <;> (try nlinarith)
        hole
      have h₁₁ : n < (k + 16 : ℕ) ^ 2:= by
        --  norm_cast at h₉ ⊢ <;> (try ring_nf at h₉ ⊢) <;> (try norm_num at h₉ ⊢) <;> (try nlinarith)
        hole
      have h₁₂ : k ≤ 35:= by
        --  by_contra h
        have h₁₃ : k ≥ 36:= by omega
          hole
        have h₁₄ : (k + 15 : ℕ) ^ 2 > n:= by nlinarith
          hole
        --  nlinarith
        hole
      have h₁₃ : k ≥ 5 ∨ k ≤ 4:= by -- omega
        hole
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    --  · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500:= by -- tauto
        hole
    --    rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
    --    · constructor
    --      · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
    --  --        norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
    --    · constructor
    --      · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
    --  --        norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
    --    · constructor
    --      · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
    --  --        norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
    --    · constructor
    --      · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
    --  --        norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
    --    · constructor
    --      · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
    --  --        norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
    --    · constructor
    --      · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20:= by
            --  rw [Int.floor_eq_iff]
            --  constructor
            --  · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
            --    norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
            hole
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 := by sorry
  have h_main : S = { 400, 470, 2290, 2360, 2430, 2500 } :=
    by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by sorry
      have h₄ : n % 70 = 50 := by sorry
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by sorry
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by sorry
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by sorry
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by sorry
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by sorry
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by sorry
      have h₁₂ : k ≤ 35 := by sorry
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by sorry
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
                      (try {
                          have h₁₇ : n = 400 := by omega
                          simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                            (try
                                {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                  (try
                                      {constructor <;> norm_num <;>
                                        nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                                    })
                              })
                        }) <;>
                    (try {
                        have h₁₇ : n = 470 := by omega
                        simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                          (try
                              {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                                (try
                                    {constructor <;> norm_num <;>
                                      nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                                  })
                            })
                      }) <;>
                  (try {
                      have h₁₇ : n = 2290 := by omega
                      simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                        (try
                            {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                              (try
                                  {constructor <;> norm_num <;>
                                    nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                                })
                          })
                    }) <;>
                (try {
                    have h₁₇ : n = 2360 := by omega
                    simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                      (try
                          {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                            (try
                                {constructor <;> norm_num <;>
                                  nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                              })
                        })
                  }) <;>
              (try {
                  have h₁₇ : n = 2430 := by omega
                  simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                    (try
                        {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                          (try
                              {constructor <;> norm_num <;>
                                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                            })
                      })
                }) <;>
            (try {
                have h₁₇ : n = 2500 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by omega
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;> (try omega) <;>
            (try {
                have h₁₇ : n = 400 := by omega
                simp_all [h₁₇] <;> norm_num [Int.emod_eq_of_lt] at * <;>
                  (try
                      {rw [eq_comm] <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt] <;>
                        (try
                            {constructor <;> norm_num <;>
                              nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                          })
                    })
              }) <;>
          (try omega)
    · intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by sorry
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num), Real.sqrt_nonneg 470,
                  Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num), Real.sqrt_nonneg 2290,
                  Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num), Real.sqrt_nonneg 2360,
                  Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num), Real.sqrt_nonneg 2430,
                  Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · constructor
        · norm_num
        ·
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 :=
            by
            rw [Int.floor_eq_iff]
            constructor
            · norm_num [Real.le_sqrt, Real.sqrt_lt]
            ·
              norm_num [Real.le_sqrt, Real.sqrt_lt] <;>
                nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
          norm_num [h₂] <;> nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
    hole
  have h_card : S.card = 6:= by
    --  rw [h_main]
    --  norm_num <;> rfl
    hole
  --  exact h_card
  hole