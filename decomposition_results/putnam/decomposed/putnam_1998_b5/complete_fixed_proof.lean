theorem putnam_1998_b5 (N : ℕ) (hN : N = ∑ i in Finset.range 1998, 10 ^ i) :
  ((1) : ℕ) = (Nat.floor (10 ^ 1000 * Real.sqrt N)) % 10:=
  by
  have h₁ : N = (10 ^ 1998 - 1) / 9:= by
    rw [hN]
    rw [eq_comm]
    rw [eq_comm]
    rw [eq_comm]
    rw [eq_comm]
    norm_num [Finset.sum_range_succ', pow_succ, Nat.div_eq_of_lt] <;> norm_num <;> rfl <;> decide
    hole
  have h₂ : (10 : ℝ) ^ 1998 > 1:= by -- norm_num [pow_pos] <;> linarith
    norm_num
  have h₃ : (10 : ℝ) ^ 1999 > 7:= by -- norm_num [pow_pos] <;> linarith
    norm_num
  have h₄ : (10 : ℝ) ^ 1998 - 1 > 0:=
    by
    have h₄₁ : (10 : ℝ) ^ 1998 > 1:= by -- norm_num [pow_pos] <;> linarith
      norm_num
    --  linarith
    norm_num
  have h₅ : (N : ℝ) = ((10 : ℝ) ^ 1998 - 1) / 9:=
    by
    have h₅₁ : (N : ℕ) = (10 ^ 1998 - 1) / 9:= by -- exact_mod_cast h₁
      linarith
    have h₅₂ : (N : ℝ) = ((10 : ℝ) ^ 1998 - 1) / 9:= by
      --  norm_cast at h₅₁ ⊢ <;> norm_num [h₂, h₃, h₄, pow_pos, Nat.div_eq_of_lt] at h₅₁ ⊢ <;> ring_nf at h₅₁ ⊢ <;>
          norm_num at h₅₁ ⊢ <;>
        linarith
      hole
    --  exact h₅₂
    linarith
  have h₆ : (10 : ℝ) ^ 1000 * Real.sqrt N < ((10 : ℝ) ^ 1999 - 4) / 3:=
    by
    have h₆₁ : 0 < (10 : ℝ) ^ 1998 - 1:= by -- linarith
      norm_num
    have h₆₂ : 0 < (10 : ℝ) ^ 1000:= by -- positivity
      norm_num
    have h₆₃ : 0 < (10 : ℝ) ^ 1998:= by -- positivity
      norm_num
    have h₆₄ : 0 < (10 : ℝ) ^ 1999:= by -- positivity
      norm_num
    have h₆₅ : 0 < Real.sqrt N:=
      by
      have h₆₅₁ : 0 < (N : ℝ):= by
        have h₆₅₂ : (N : ℝ) = ((10 : ℝ) ^ 1998 - 1) / 9:= by -- exact h₅
          linarith
        --  rw [h₆₅₂]
        have h₆₅₃ : (10 : ℝ) ^ 1998 - 1 > 0:= by -- linarith
          norm_num
        positivity
        hole
      --  exact Real.sqrt_pos.mpr h₆₅₁
      hole
    have h₆₆ : Real.sqrt N < ((10 : ℝ) ^ 999):=
      by
      have h₆₆₁ : Real.sqrt N < ((10 : ℝ) ^ 999):= by
        --  rw [h₅]
        have h₆₆₂ : Real.sqrt (((10 : ℝ) ^ 1998 - 1) / 9) < ((10 : ℝ) ^ 999):=
          by
          have h₆₆₃ : Real.sqrt (((10 : ℝ) ^ 1998 - 1) / 9) < ((10 : ℝ) ^ 999):=
            by
            --  rw [Real.sqrt_lt (by positivity)]
            ·
              have h₆₆₄ : ((10 : ℝ) ^ 999 : ℝ) > 0:= by -- positivity
                norm_num
            --    nlinarith [sq_nonneg ((10 : ℝ) ^ 999 - 1 : ℝ)]
            --  · positivity
            hole
          --  exact h₆₆₃
          linarith
        --  exact h₆₆₂
        hole
      --  exact h₆₆₁
      linarith
    have h₆₇ : (10 : ℝ) ^ 1000 * Real.sqrt N < ((10 : ℝ) ^ 1999 - 4) / 3:=
      by
      have h₆₇₁ : Real.sqrt N < ((10 : ℝ) ^ 999):= by -- exact h₆₆
        linarith
      have h₆₇₂ : (10 : ℝ) ^ 1000 * Real.sqrt N < (10 : ℝ) ^ 1000 * ((10 : ℝ) ^ 999 : ℝ):= by
        --  exact mul_lt_mul_of_pos_left h₆₇₁ (by positivity)
        linarith
      have h₆₇₃ : (10 : ℝ) ^ 1000 * ((10 : ℝ) ^ 999 : ℝ) = (10 : ℝ) ^ 1999:= by
        --  rw [← pow_add] <;> ring_nf <;> norm_num <;> linarith
        norm_num
      have h₆₇₄ : (10 : ℝ) ^ 1000 * Real.sqrt N < (10 : ℝ) ^ 1999:= by -- linarith
        linarith
      have h₆₇₅ : (10 : ℝ) ^ 1999 - 4 > 0:=
        by
        have h₆₇₆ : (10 : ℝ) ^ 1999 > 7:= by -- exact h₃
          norm_num
        --  linarith
        norm_num
      have h₆₇₆ : (10 : ℝ) ^ 1000 * Real.sqrt N < ((10 : ℝ) ^ 1999 - 4) / 3:= by
        --  nlinarith [sq_sqrt
        --      (show 0 ≤ (N : ℝ) by
        --        have h₆₇₇ : (N : ℝ) = ((10 : ℝ) ^ 1998 - 1) / 9 := by exact h₅
        --        rw [h₆₇₇]
        --        have h₆₇₈ : (10 : ℝ) ^ 1998 - 1 > 0 := by linarith
        --        positivity)]
        hole
      --  exact h₆₇₆
      linarith
    --  exact h₆₇
    linarith
  have h₇ : ((10 : ℝ) ^ 1999 - 7) / 3 < (10 : ℝ) ^ 1000 * Real.sqrt N:=
    by
    have h₇₁ : (N : ℝ) = ((10 : ℝ) ^ 1998 - 1) / 9 := h₅
    have h₇₂ : Real.sqrt N = Real.sqrt (((10 : ℝ) ^ 1998 - 1) / 9):= by
      --  --  --  --  rw [h₇₁] <;> simp [Real.sqrt_eq_iff_sq_eq] <;> ring_nf <;> nlinarith [pow_pos (by norm_num : (0 : ℝ) < 10) 1998]
      hole
    rw [h₇₂]
    have h₇₃ : ((10 : ℝ) ^ 1999 - 7) / 3 < (10 : ℝ) ^ 1000 * Real.sqrt (((10 : ℝ) ^ 1998 - 1) / 9):=
      by
      have h₇₄ : 0 < (10 : ℝ):= by -- norm_num
        norm_num
      have h₇₅ : 0 < (10 : ℝ) ^ 999:= by -- positivity
        norm_num
      have h₇₆ : 0 < (10 : ℝ) ^ 1998 - 1:=
        by
        have h₇₆₁ : (10 : ℝ) ^ 1998 > 1:= by
          have h₇₆₂ : (10 : ℝ) ^ 1998 > 1:= by -- linarith
            norm_num
          --  linarith
          norm_num
        --  linarith
        norm_num
      have h₇₇ : 0 < (10 : ℝ) ^ 1999 - 7:=
        by
        have h₇₇₁ : (10 : ℝ) ^ 1999 > 7:= by -- linarith
          norm_num
        --  linarith
        norm_num
      have h₇₈ : 0 < Real.sqrt (((10 : ℝ) ^ 1998 - 1) / 9):= by -- positivity
        norm_num
      have h₇₉ : Real.sqrt (((10 : ℝ) ^ 1998 - 1) / 9) > ((10 : ℝ) ^ 999 - 1 / (2 * (10 : ℝ) ^ 999)):=
        by
        have h₇₉₁ : Real.sqrt (((10 : ℝ) ^ 1998 - 1) / 9) > ((10 : ℝ) ^ 999 - 1 / (2 * (10 : ℝ) ^ 999)):=
          by
          have h₇₉₂ : 0 < (10 : ℝ) ^ 999:= by -- positivity
            norm_num
          have h₇₉₃ : 0 < (10 : ℝ) ^ 1998 - 1:=
            by
            have h₇₉₄ : (10 : ℝ) ^ 1998 > 1:= by -- linarith
              norm_num
            --  linarith
            norm_num
          have h₇₉₄ : 0 < (2 * (10 : ℝ) ^ 999 : ℝ):= by -- positivity
            norm_num
          have h₇₉₅ : 0 < (10 : ℝ) ^ 999 * (2 * (10 : ℝ) ^ 999 : ℝ):= by -- positivity
            norm_num
          --  apply Real.lt_sqrt_of_sq_lt
          --  field_simp [h₇₉₂.ne', h₇₉₄.ne']
          --  rw [← sub_pos]
          --  field_simp [h₇₉₂.ne', h₇₉₄.ne']
          --  ring_nf
          --  --  norm_num <;> nlinarith [sq_nonneg ((10 : ℝ) ^ 998), sq_nonneg ((10 : ℝ) ^ 999)]
          hole
        --  exact h₇₉₂
        linarith
      have h₇₁₀ :
        (10 : ℝ) ^ 1000 * Real.sqrt (((10 : ℝ) ^ 1998 - 1) / 9) >
          (10 : ℝ) ^ 1000 * ((10 : ℝ) ^ 999 - 1 / (2 * (10 : ℝ) ^ 999)) := by sorry
      have h₇₁₁ : (10 : ℝ) ^ 1000 * ((10 : ℝ) ^ 999 - 1 / (2 * (10 : ℝ) ^ 999)) = ((10 : ℝ) ^ 1999 - 5 / 3):=
        by
        have h₇₁₁₁ : (10 : ℝ) ^ 1000 * ((10 : ℝ) ^ 999 - 1 / (2 * (10 : ℝ) ^ 999)) = ((10 : ℝ) ^ 1999 - 5 / 3):= by
          --  calc
          --    (10 : ℝ) ^ 1000 * ((10 : ℝ) ^ 999 - 1 / (2 * (10 : ℝ) ^ 999)) =
          --        (10 : ℝ) ^ 1000 * (10 : ℝ) ^ 999 - (10 : ℝ) ^ 1000 * (1 / (2 * (10 : ℝ) ^ 999)) :=
          --      by ring
          --    _ = (10 : ℝ) ^ (1000 + 999) - (10 : ℝ) ^ 1000 * (1 / (2 * (10 : ℝ) ^ 999)) := by rw [← pow_add]
          --    _ = (10 : ℝ) ^ 1999 - (10 : ℝ) ^ 1000 * (1 / (2 * (10 : ℝ) ^ 999)) := by norm_num
          --    _ = (10 : ℝ) ^ 1999 - 5 / 3 :=
          --      by
          --      have h₇₁₁₂ : (10 : ℝ) ^ 1000 * (1 / (2 * (10 : ℝ) ^ 999)) = (5 / 3 : ℝ) := by
          --        field_simp [pow_add, pow_mul] <;> ring_nf <;> field_simp [pow_add, pow_mul] <;> ring_nf <;> norm_num
          --      rw [h₇₁₁₂] <;> ring_nf <;> field_simp [pow_add, pow_mul] <;> ring_nf <;> norm_num
          --    _ = ((10 : ℝ) ^ 1999 - 5 / 3) := by norm_num
          linarith
        --  rw [h₇₁₁₁]
        linarith
      have h₇₁₂ : (10 : ℝ) ^ 1000 * Real.sqrt (((10 : ℝ) ^ 1998 - 1) / 9) > ((10 : ℝ) ^ 1999 - 5 / 3):= by -- linarith
        linarith
      have h₇₁₃ : ((10 : ℝ) ^ 1999 - 7) / 3 < ((10 : ℝ) ^ 1999 - 5 / 3):= by -- norm_num <;> linarith
        norm_num
      have h₇₁₄ : ((10 : ℝ) ^ 1999 - 7) / 3 < (10 : ℝ) ^ 1000 * Real.sqrt (((10 : ℝ) ^ 1998 - 1) / 9):= by -- linarith
        linarith
      --  linarith
      linarith
    have h₇₄ : ((10 : ℝ) ^ 1999 - 7) / 3 < (10 : ℝ) ^ 1000 * Real.sqrt (((10 : ℝ) ^ 1998 - 1) / 9) := h₇₃
    linarith
    hole
  have h₈ : Nat.floor ((10 : ℝ) ^ 1000 * Real.sqrt N) = (10 ^ 1999 - 7) / 3:=
    by
    have h₈₁ : (Nat.floor ((10 : ℝ) ^ 1000 * Real.sqrt N) : ℝ) ≤ (10 : ℝ) ^ 1000 * Real.sqrt N:= by
      --  exact Nat.floor_le (by positivity)
      hole
    have h₈₂ : (10 : ℝ) ^ 1000 * Real.sqrt N < (Nat.floor ((10 : ℝ) ^ 1000 * Real.sqrt N) : ℝ) + 1:= by
      --  linarith [Nat.floor_le (by positivity : 0 ≤ (10 : ℝ) ^ 1000 * Real.sqrt N),
      --    Nat.lt_floor_add_one ((10 : ℝ) ^ 1000 * Real.sqrt N)]
      hole
    have h₈₃ : (Nat.floor ((10 : ℝ) ^ 1000 * Real.sqrt N) : ℤ) = (10 ^ 1999 - 7) / 3:= by
      --  --  norm_num at h₆ h₇ h₈₁ h₈₂ ⊢ <;> (try norm_num) <;>
      --              (try
      --                  {norm_num [Nat.floor_eq_iff, Nat.cast_add, Nat.cast_one, Nat.cast_pow, Nat.cast_mul,
      --                        Nat.cast_sub] at h₆ h₇ h₈₁ h₈₂ ⊢ <;>
      --                      (try norm_num) <;>
      --                    (try {constructor <;> (try norm_num) <;> (try linarith)
      --                      })
      --                }) <;>
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
      hole
    have h₈₄ : Nat.floor ((10 : ℝ) ^ 1000 * Real.sqrt N) = (10 ^ 1999 - 7) / 3:= by -- norm_cast at h₈₃ ⊢ <;> omega
      linarith
    --  exact h₈₄
    linarith
  have h₉ : (Nat.floor ((10 : ℝ) ^ 1000 * Real.sqrt N) : ℕ) % 10 = 1:=
    by
    --  rw [h₈]
    have h₉₁ : (10 : ℕ) ^ 1999 % 3 = 1:= by -- norm_num [Nat.pow_mod, Nat.pow_add, Nat.pow_mul, Nat.pow_one]
      norm_num
    have h₉₂ : (10 : ℕ) ^ 1999 % 10 = 0:= by -- norm_num [Nat.pow_mod, Nat.pow_add, Nat.pow_mul, Nat.pow_one]
      norm_num
    have h₉₃ : (10 : ℕ) ^ 1999 % 30 = 10:= by -- omega
      norm_num
    have h₉₄ : (10 : ℕ) ^ 1999 % 30 = 10:= by -- omega
      norm_num
    have h₉₅ : (10 ^ 1999 - 7 : ℕ) / 3 % 10 = 1:=
      by
      have h₉₅₁ : (10 ^ 1999 - 7 : ℕ) / 3 % 10 = 1:=
        by
        have h₉₅₂ : (10 ^ 1999 - 7 : ℕ) % 3 = 0:= by -- omega
          norm_num
        have h₉₅₃ : (10 ^ 1999 - 7 : ℕ) % 30 = 3:= by -- omega
          norm_num
        --  omega
        norm_num
      --  exact h₉₅₁
      norm_num
    --  omega
    omega
  have h₁₀ : ((1) : ℕ) = (Nat.floor (10 ^ 1000 * Real.sqrt N)) % 10:=
    by
    have h₁₀₁ : (Nat.floor ((10 : ℝ) ^ 1000 * Real.sqrt N) : ℕ) % 10 = 1 := h₉
    have h₁₀₂ : ((1 : ℕ) : ℕ) = (Nat.floor (10 ^ 1000 * Real.sqrt N)) % 10:= by -- omega
      linarith
    --  exact h₁₀₂
    linarith
  --  apply h₁₀
  linarith