theorem putnam_1978_b6 (a : ℕ → ℕ → ℝ) (ha : ∀ i j, a i j ∈ Icc 0 1) (m n : ℕ) (mnpos : m > 0 ∧ n > 0) :
  ((∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j / i) ^ 2 ≤
    2 * m * ∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j):=
  by
  have h₁ : ∀ i ∈ Finset.Icc 1 n, (∑ j in Finset.Icc 1 (m * i), a i j) ≤ m * i:=
    by
    --  intro i hi
    have h₂ : ∀ j ∈ Finset.Icc 1 (m * i), a i j ≤ 1:= by
      --  intro j hj
      have h₃ : a i j ∈ Icc 0 1 := ha i j
      --  exact h₃.2
      hole
    have h₃ : ∑ j in Finset.Icc 1 (m * i), a i j ≤ ∑ j in Finset.Icc 1 (m * i), (1 : ℝ):=
      by
      --  apply Finset.sum_le_sum
      --  intro j hj
      have h₄ : a i j ≤ 1 := h₂ j hj
      --  linarith
      hole
    have h₄ : ∑ j in Finset.Icc 1 (m * i), (1 : ℝ) = (m * i : ℝ):= by
      --  simp [Finset.sum_const] <;> (try norm_cast) <;> (try ring_nf) <;> (try field_simp) <;> (try positivity)
      norm_num
    have h₅ : ∑ j in Finset.Icc 1 (m * i), a i j ≤ (m * i : ℝ):= by -- linarith
      hole
    have h₆ : (m * i : ℝ) = (m * i : ℝ) := rfl
    --  exact by simpa [h₆] using h₅
    hole
  have h₂ : ∀ i ∈ Finset.Icc 1 n, (∑ j in Finset.Icc 1 (m * i), a i j / i) ≤ m:=
    by
    --  intro i hi
    have h₃ : (∑ j in Finset.Icc 1 (m * i), a i j / i) = (∑ j in Finset.Icc 1 (m * i), a i j) / i:=
      by
      have h₄ : (∑ j in Finset.Icc 1 (m * i), a i j / i) = (∑ j in Finset.Icc 1 (m * i), a i j) / i:= by
        --  simp [Finset.sum_div]
        hole
      --  rw [h₄]
      linarith
    --  rw [h₃]
    have h₄ : (∑ j in Finset.Icc 1 (m * i), a i j) ≤ m * i:= by -- exact h₁ i hi
      hole
    have h₅ : (i : ℝ) ≥ 1:= by
      --  norm_cast
      --  simp_all [Finset.mem_Icc] <;> linarith
      hole
    have h₆ : (∑ j in Finset.Icc 1 (m * i), a i j : ℝ) / i ≤ m:=
      by
      have h₇ : (∑ j in Finset.Icc 1 (m * i), a i j : ℝ) ≤ m * i:= by -- exact_mod_cast h₄
        linarith
      have h₈ : 0 < (i : ℝ):= by -- positivity
        linarith
      have h₉ : (∑ j in Finset.Icc 1 (m * i), a i j : ℝ) / i ≤ m:=
        by
        --  rw [div_le_iff h₈]
        nlinarith
        hole
      --  exact h₉
      linarith
    --  exact h₆
    hole
  have h₃ : (∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j / i) ≤ m * n:=
    by
    have h₄ : ∀ i ∈ Finset.Icc 1 n, (∑ j in Finset.Icc 1 (m * i), a i j / i) ≤ m:=
      by
      --  intro i hi
      --  --  apply h₂ <;> assumption
      norm_cast
    --  calc
    --    (∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j / i) ≤ ∑ i in Finset.Icc 1 n, (m : ℝ) :=
    --      by
    --      apply Finset.sum_le_sum
    --      intro i hi
    --      exact h₄ i hi
    --    _ = ∑ i in Finset.Icc 1 n, (m : ℝ) := by rfl
    --    _ = (n : ℝ) * m := by
    --      simp [Finset.sum_const, Finset.card_range] <;> ring_nf <;> norm_cast <;> field_simp <;> ring_nf <;> norm_cast
    --    _ = m * n := by ring <;> norm_num <;> linarith
    hole
  have h₄ : (∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j / i) ^ 2 ≤ (m * n : ℝ) ^ 2:=
    by
    have h₄₁ : (∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j / i) ≤ (m * n : ℝ):= by -- exact_mod_cast h₃
      linarith
    have h₄₂ : (∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j / i) ≥ 0:=
      by
      --  apply Finset.sum_nonneg
      --  intro i _i
      --  apply Finset.sum_nonneg
      --  intro j _j
      have h₄₃ : a i j / (i : ℝ) ≥ 0:= by
        have h₄₄ : a i j ≥ 0 := (ha i j).1
        have h₄₅ : (i : ℝ) > 0:= by -- -- -- norm_cast <;> norm_num at * <;> omega
          hole
        --  positivity
        positivity
      --  exact h₄₃
      hole
    have h₄₃ : ((∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j / i) : ℝ) ≤ (m * n : ℝ):= by -- exact h₄₁
      linarith
    have h₄₄ : ((∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j / i) : ℝ) ≥ 0:= by -- exact h₄₂
      linarith
    have h₄₅ : ((∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j / i : ℝ) : ℝ) ^ 2 ≤ ((m * n : ℝ) : ℝ) ^ 2:= by
      --  gcongr <;> nlinarith
      nlinarith
    --  exact_mod_cast h₄₅
    linarith
  have h₅ : (m * n : ℝ) ^ 2 ≤ 2 * m * ∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j:=
    by
    have h₅₁ : (m : ℝ) ≥ 1:= by
      have h₅₂ : (m : ℕ) > 0:= by -- linarith
        linarith
      have h₅₃ : (m : ℝ) > 0:= by -- exact_mod_cast h₅₂
        linarith
      have h₅₄ : (m : ℕ) ≥ 1:= by -- omega
        linarith
      have h₅₅ : (m : ℝ) ≥ 1:= by -- exact_mod_cast h₅₄
        linarith
      --  exact h₅₅
      linarith
    have h₅₂ : (n : ℝ) ≥ 1:= by
      have h₅₃ : (n : ℕ) > 0:= by -- linarith
        linarith
      have h₅₄ : (n : ℝ) > 0:= by -- exact_mod_cast h₅₃
        linarith
      have h₅₅ : (n : ℕ) ≥ 1:= by -- omega
        linarith
      have h₅₆ : (n : ℝ) ≥ 1:= by -- exact_mod_cast h₅₅
        linarith
      --  exact h₅₆
      linarith
    have h₅₃ : (∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j : ℝ) ≥ (m * n : ℝ) * n / 2:=
      by
      have h₅₄ : ∀ (k : ℕ), k ≥ 1 → (∑ i in Finset.Icc 1 k, ∑ j in Finset.Icc 1 (m * i), a i j : ℝ) ≥ (m * k : ℝ) * k / 2:=
        by
        --  intro k hk
        --  induction' hk with k hk IH
        --  · norm_num [Finset.sum_Icc_succ_top, Finset.sum_range_succ] at *
          have h₅₅ := ha 1 1
          have h₅₆ := ha 1 0
        --  --  --    norm_num [Finset.mem_Icc, Finset.mem_singleton] at h₅₅ h₅₆ ⊢ <;> (try norm_num at h₅₅ h₅₆ ⊢) <;> (try linarith) <;>
        --                      (try nlinarith) <;>
        --                    (try ring_nf at h₅₅ h₅₆ ⊢) <;>
        --                  (try norm_cast at h₅₅ h₅₆ ⊢) <;>
        --                (try linarith) <;>
        --              (try nlinarith) <;>
        --            (try ring_nf at h₅₅ h₅₆ ⊢) <;>
        --          (try norm_cast at h₅₅ h₅₆ ⊢) <;>
        --        (try linarith) <;>
        --      (try nlinarith)
        ·
        --    simp_all [Finset.sum_Icc_succ_top, Finset.sum_range_succ, Nat.cast_add, Nat.cast_one, Nat.cast_zero] <;>
        --                                  norm_num at * <;>
        --                                (try linarith) <;>
        --                              (try nlinarith) <;>
        --                            (try ring_nf at *) <;>
        --                          (try norm_cast at *) <;>
        --                        (try linarith) <;>
        --                      (try nlinarith) <;>
        --                    (try ring_nf at *) <;>
        --                  (try norm_cast at *) <;>
        --                (try linarith) <;>
        --              (try nlinarith) <;>
        --            (try {
        --                have h₅₅ := ha (k + 1) 0
        --                have h₅₆ := ha (k + 1) 1
        --                have h₅₇ := ha (k + 1) (m * (k + 1))
        --                norm_num [Finset.mem_Icc, Finset.mem_singleton] at h₅₅ h₅₆ h₅₇ ⊢ <;> (try norm_num at h₅₅ h₅₆ h₅₇ ⊢) <;>
        --                            (try linarith) <;>
        --                          (try nlinarith) <;>
        --                        (try ring_nf at h₅₅ h₅₆ h₅₇ ⊢) <;>
        --                      (try norm_cast at h₅₅ h₅₆ h₅₇ ⊢) <;>
        --                    (try linarith) <;>
        --                  (try nlinarith)
        --              }) <;>
        --          (try {
        --              have h₅₅ := ha (k + 1) 0
        --              have h₅₆ := ha (k + 1) 1
        --              have h₅₇ := ha (k + 1) (m * (k + 1))
        --              norm_num [Finset.mem_Icc, Finset.mem_singleton] at h₅₅ h₅₆ h₅₇ ⊢ <;> (try norm_num at h₅₅ h₅₆ h₅₇ ⊢) <;>
        --                          (try linarith) <;>
        --                        (try nlinarith) <;>
        --                      (try ring_nf at h₅₅ h₅₆ h₅₇ ⊢) <;>
        --                    (try norm_cast at h₅₅ h₅₆ h₅₇ ⊢) <;>
        --                  (try linarith) <;>
        --                (try nlinarith)
        --            }) <;>
              (try {
                  have h₅₅ := ha (k + 1) 0
                  have h₅₆ := ha (k + 1) 1
                  have h₅₇ := ha (k + 1) (m * (k + 1))
                  norm_num [Finset.mem_Icc, Finset.mem_singleton] at h₅₅ h₅₆ h₅₇ ⊢ <;> (try norm_num at h₅₅ h₅₆ h₅₇ ⊢) <;>
                              (try linarith) <;>
                            (try nlinarith) <;>
                          (try ring_nf at h₅₅ h₅₆ h₅₇ ⊢) <;>
                        (try norm_cast at h₅₅ h₅₆ h₅₇ ⊢) <;>
                      (try linarith) <;>
                    (try nlinarith)
                }) <;>
            linarith
        hole
      have h₅₅ := h₅₄ n (by linarith)
      --  simp_all [Finset.sum_Icc_succ_top, Finset.sum_range_succ, Nat.cast_add, Nat.cast_one, Nat.cast_zero] <;>
                          (try norm_num at *) <;>
                        (try linarith) <;>
                      (try nlinarith) <;>
                    (try ring_nf at *) <;>
                  (try norm_cast at *) <;>
                (try linarith) <;>
              (try nlinarith) <;>
            (try {
                have h₅₆ := ha 1 0
                have h₅₇ := ha 1 1
                have h₅₈ := ha 1 (m * 1)
                norm_num [Finset.mem_Icc, Finset.mem_singleton] at h₅₆ h₅₇ h₅₈ ⊢ <;> (try norm_num at h₅₆ h₅₇ h₅₈ ⊢) <;>
                    (try linarith) <;>
                  (try nlinarith)
              }) <;>
          (try {
              have h₅₆ := ha 1 0
              have h₅₇ := ha 1 1
              have h₅₈ := ha 1 (m * 1)
              norm_num [Finset.mem_Icc, Finset.mem_singleton] at h₅₆ h₅₇ h₅₈ ⊢ <;> (try norm_num at h₅₆ h₅₇ h₅₈ ⊢) <;>
                  (try linarith) <;>
                (try nlinarith)
            }) <;>
        (try {
            have h₅₆ := ha 1 0
            have h₅₇ := ha 1 1
            have h₅₈ := ha 1 (m * 1)
            norm_num [Finset.mem_Icc, Finset.mem_singleton] at h₅₆ h₅₇ h₅₈ ⊢ <;> (try norm_num at h₅₆ h₅₇ h₅₈ ⊢) <;>
                (try linarith) <;>
              (try nlinarith)
          })
      hole
    have h₅₄ : (∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j : ℝ) ≥ (m * n : ℝ) * n / 2 := h₅₃
    have h₅₅ : (m * n : ℝ) ^ 2 ≤ 2 * m * ∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j :=
      by
      have h₅₆ : 0 ≤ (m : ℝ) * n := by positivity
      have h₅₇ : (m * n : ℝ) ≥ 0 := by positivity
      have h₅₈ : (2 : ℝ) > 0 := by norm_num
      have h₅₉ : (m * n : ℝ) * n / 2 = (m * n : ℝ) * n / 2 := by ring
      nlinarith [sq_nonneg ((m * n : ℝ) - (m * n : ℝ) * n / 2), h₅₄, sq_nonneg ((m : ℝ) - 1), sq_nonneg ((n : ℝ) - 1)]
    --  linarith
    linarith
  have h₆ :
    ((∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j / i) ^ 2 ≤
      2 * m * ∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j) :=
    by
    have h₆₁ : (∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j / i) ^ 2 ≤ (m * n : ℝ) ^ 2 := h₄
    have h₆₂ : (m * n : ℝ) ^ 2 ≤ 2 * m * ∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j := h₅
    have h₆₃ :
      (∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j / i) ^ 2 ≤
        2 * m * ∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j :=
      by linarith
    exact_mod_cast h₆₃
  have h₇ :
    ((∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j / i) ^ 2 ≤
      2 * m * ∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j) :=
    by exact h₆
  --  exact h₇
  linarith