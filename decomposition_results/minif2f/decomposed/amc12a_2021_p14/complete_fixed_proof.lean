theorem amc12a_2021_p14 :
  ((∑ k in Finset.Icc 1 20, Real.logb (5 ^ k) (3 ^ k ^ 2)) * ∑ k in Finset.Icc 1 100, Real.logb (9 ^ k) (25 ^ k)) =
    21000:=
  by
  have h₁ : ∀ k ∈ Finset.Icc (1 : ℕ) 20, Real.logb ((5 : ℝ) ^ k) ((3 : ℝ) ^ (k ^ 2)) = (k : ℝ) * Real.logb 5 3:=
    by
    --  intro k hk
    have h₁ : 1 ≤ (k : ℕ):= by
      --  simp [Finset.mem_Icc] at hk
      --  exact hk.1
      hole
    have h₂ : (k : ℕ) ≤ 20:= by
      --  simp [Finset.mem_Icc] at hk
      --  exact hk.2
      hole
    have h₃ : k ≥ 1:= by -- exact_mod_cast h₁
      linarith
    have h₄ : k ≤ 20:= by -- exact_mod_cast h₂
      linarith
    have h₅ : Real.logb ((5 : ℝ) ^ k) ((3 : ℝ) ^ (k ^ 2)) = (k : ℝ) * Real.logb 5 3:=
      by
      have h₅₁ : Real.logb ((5 : ℝ) ^ k) ((3 : ℝ) ^ (k ^ 2)) = Real.log ((3 : ℝ) ^ (k ^ 2)) / Real.log ((5 : ℝ) ^ k):= by
        --  rw [Real.logb] <;> simp [Real.log_rpow] <;> field_simp <;> ring
        norm_cast
      --  rw [h₅₁]
      have h₅₂ : Real.log ((3 : ℝ) ^ (k ^ 2)) = (k ^ 2 : ℝ) * Real.log 3:= by
        --  --  rw [Real.log_pow] <;> norm_cast <;> field_simp <;> ring
        norm_num
      have h₅₃ : Real.log ((5 : ℝ) ^ k) = (k : ℝ) * Real.log 5:= by -- rw [Real.log_pow] <;> norm_cast <;> field_simp <;> ring
        norm_num
      --  rw [h₅₂, h₅₃]
      have h₅₄ : Real.logb 5 3 = Real.log 3 / Real.log 5 := by
        rw [Real.logb] <;> simp [Real.log_rpow] <;> field_simp <;> ring
      have h₅₅ : (k ^ 2 : ℝ) * Real.log 3 / ((k : ℝ) * Real.log 5) = (k : ℝ) * (Real.log 3 / Real.log 5):=
        by
        have h₅₅₁ : (k : ℝ) ≠ 0:= by -- -- norm_num at hk ⊢ <;> omega
          linarith
        --  --  field_simp [h₅₅₁] <;> ring <;> field_simp [h₅₅₁] <;> ring <;> norm_cast <;>
              simp_all [Nat.cast_pow, Nat.cast_mul, Nat.cast_add, Nat.cast_one] <;>
            field_simp [h₅₅₁] <;>
          ring
        hole
      have h₅₄ : Real.logb 5 3 = Real.log 3 / Real.log 5:= by -- rw [Real.logb] <;> simp [Real.log_rpow] <;> field_simp <;> ring
        norm_cast
    have h₅ : Real.logb ((5 : ℝ) ^ k) ((3 : ℝ) ^ (k ^ 2)) = (k : ℝ) * Real.logb 5 3 :=
      by
      have h₅₁ : Real.logb ((5 : ℝ) ^ k) ((3 : ℝ) ^ (k ^ 2)) = Real.log ((3 : ℝ) ^ (k ^ 2)) / Real.log ((5 : ℝ) ^ k) := by sorry
      rw [h₅₁]
      have h₅₂ : Real.log ((3 : ℝ) ^ (k ^ 2)) = (k ^ 2 : ℝ) * Real.log 3 := by sorry
      have h₅₃ : Real.log ((5 : ℝ) ^ k) = (k : ℝ) * Real.log 5 := by sorry
      rw [h₅₂, h₅₃]
      have h₅₄ : Real.logb 5 3 = Real.log 3 / Real.log 5 := by
        rw [Real.logb] <;> simp [Real.log_rpow] <;> field_simp <;> ring
      have h₅₅ : (k ^ 2 : ℝ) * Real.log 3 / ((k : ℝ) * Real.log 5) = (k : ℝ) * (Real.log 3 / Real.log 5) :=
        by
        have h₅₅₁ : (k : ℝ) ≠ 0 := by norm_num at hk ⊢ <;> omega
        field_simp [h₅₅₁] <;> ring <;> field_simp [h₅₅₁] <;> ring <;> norm_cast <;>
              simp_all [Nat.cast_pow, Nat.cast_mul, Nat.cast_add, Nat.cast_one] <;>
            field_simp [h₅₅₁] <;>
          ring
      rw [h₅₅, h₅₄] <;> ring <;> field_simp <;> ring
      hole
    --  exact h₅
    hole
  have h₂ : (∑ k in Finset.Icc (1 : ℕ) 20, Real.logb ((5 : ℝ) ^ k) ((3 : ℝ) ^ (k ^ 2))) = 210 * Real.logb 5 3:=
    by
    have h₂₁ :
      (∑ k in Finset.Icc (1 : ℕ) 20, Real.logb ((5 : ℝ) ^ k) ((3 : ℝ) ^ (k ^ 2))) =
        ∑ k in Finset.Icc (1 : ℕ) 20, ((k : ℝ) * Real.logb 5 3) := by sorry
    --  rw [h₂₁]
    have h₂₂ :
      (∑ k in Finset.Icc (1 : ℕ) 20, (k : ℝ) * Real.logb 5 3) = (∑ k in Finset.Icc (1 : ℕ) 20, (k : ℝ)) * Real.logb 5 3 := by sorry
    --  rw [h₂₂]
    have h₂₃ : (∑ k in Finset.Icc (1 : ℕ) 20, (k : ℝ)) = 210:= by -- norm_num [Finset.sum_Icc_succ_top] <;> rfl
      hole
    --  rw [h₂₃] <;> ring <;> simp [Real.logb] <;> field_simp <;> ring
    hole
  have h₃ : ∀ k ∈ Finset.Icc (1 : ℕ) 100, Real.logb ((9 : ℝ) ^ k) ((25 : ℝ) ^ k) = Real.logb 3 5:=
    by
    --  intro k hk
    have h₃₁ : Real.logb ((9 : ℝ) ^ k) ((25 : ℝ) ^ k) = (Real.log ((25 : ℝ) ^ k) / Real.log ((9 : ℝ) ^ k)):= by
      --  rw [Real.logb] <;> simp [Real.log_rpow] <;> field_simp <;> ring
      hole
    --  rw [h₃₁]
    have h₃₂ : Real.log ((25 : ℝ) ^ k) = (k : ℝ) * Real.log 25 := by
      rw [Real.log_pow] <;> norm_cast <;> field_simp <;> ring
    have h₃₃ : Real.log ((9 : ℝ) ^ k) = (k : ℝ) * Real.log 9:= by -- rw [Real.log_pow] <;> norm_cast <;> field_simp <;> ring
      hole
    --  rw [h₃₂, h₃₃]
    have h₃₄ : Real.log 25 = 2 * Real.log 5:=
      by
      have h₃₄₁ : Real.log 25 = Real.log (5 ^ 2):= by -- norm_num
        hole
      --  rw [h₃₄₁]
      have h₃₄₂ : Real.log (5 ^ 2) = 2 * Real.log 5:= by -- -- rw [Real.log_pow] <;> norm_num <;> ring
        hole
      --  rw [h₃₄₂]
      hole
    have h₃₅ : Real.log 9 = 2 * Real.log 3:=
      by
      have h₃₅₁ : Real.log 9 = Real.log (3 ^ 2):= by -- norm_num
        hole
      --  rw [h₃₅₁]
      have h₃₅₂ : Real.log (3 ^ 2) = 2 * Real.log 3:= by -- -- rw [Real.log_pow] <;> norm_num <;> ring
        hole
      --  rw [h₃₅₂]
      hole
    --  rw [h₃₄, h₃₅]
    have h₃₆ : (k : ℝ) ≠ 0:= by
      --  --  norm_num at hk ⊢ <;> (try omega) <;> (try linarith) <;>
            (try {aesop
              }) <;>
          (try {norm_num at hk ⊢ <;> omega
            }) <;>
        (try {linarith
          })
      hole
    have h₃₇ : (2 : ℝ) ≠ 0:= by -- norm_num
      hole
    have h₃₈ : Real.log 5 ≠ 0:= by
      have h₃₈₁ : Real.log 5 > 0 := Real.log_pos (by norm_num)
      --  linarith
      hole
    have h₃₉ : Real.log 3 ≠ 0:= by
      have h₃₉₁ : Real.log 3 > 0 := Real.log_pos (by norm_num)
      --  linarith
      hole
    --  --  field_simp [h₃₆, h₃₇, h₃₈, h₃₉, Real.logb, Real.log_mul, Real.log_rpow, Real.log_pow] <;> ring_nf <;>
                field_simp [h₃₆, h₃₇, h₃₈, h₃₉, Real.logb, Real.log_mul, Real.log_rpow, Real.log_pow] <;>
              ring_nf <;>
            field_simp [h₃₆, h₃₇, h₃₈, h₃₉, Real.logb, Real.log_mul, Real.log_rpow, Real.log_pow] <;>
          ring_nf <;>
        field_simp [h₃₆, h₃₇, h₃₈, h₃₉, Real.logb, Real.log_mul, Real.log_rpow, Real.log_pow] <;>
      have h₃₂ : Real.log ((25 : ℝ) ^ k) = (k : ℝ) * Real.log 25:= by -- rw [Real.log_pow] <;> norm_cast <;> field_simp <;> ring
        hole
  have h₃ : ∀ k ∈ Finset.Icc (1 : ℕ) 100, Real.logb ((9 : ℝ) ^ k) ((25 : ℝ) ^ k) = Real.logb 3 5 :=
    by
    intro k hk
    have h₃₁ : Real.logb ((9 : ℝ) ^ k) ((25 : ℝ) ^ k) = (Real.log ((25 : ℝ) ^ k) / Real.log ((9 : ℝ) ^ k)) := by sorry
    rw [h₃₁]
    have h₃₂ : Real.log ((25 : ℝ) ^ k) = (k : ℝ) * Real.log 25 := by
      rw [Real.log_pow] <;> norm_cast <;> field_simp <;> ring
    have h₃₃ : Real.log ((9 : ℝ) ^ k) = (k : ℝ) * Real.log 9 := by rw [Real.log_pow] <;> norm_cast <;> field_simp <;> ring
    rw [h₃₂, h₃₃]
    have h₃₄ : Real.log 25 = 2 * Real.log 5 :=
      by
      have h₃₄₁ : Real.log 25 = Real.log (5 ^ 2) := by norm_num
      rw [h₃₄₁]
      have h₃₄₂ : Real.log (5 ^ 2) = 2 * Real.log 5 := by rw [Real.log_pow] <;> norm_num <;> ring
      rw [h₃₄₂]
    have h₃₅ : Real.log 9 = 2 * Real.log 3 :=
      by
      have h₃₅₁ : Real.log 9 = Real.log (3 ^ 2) := by norm_num
      rw [h₃₅₁]
      have h₃₅₂ : Real.log (3 ^ 2) = 2 * Real.log 3 := by rw [Real.log_pow] <;> norm_num <;> ring
      rw [h₃₅₂]
    rw [h₃₄, h₃₅]
    have h₃₆ : (k : ℝ) ≠ 0 := by
      norm_num at hk ⊢ <;> (try omega) <;> (try linarith) <;>
            (try {aesop
              }) <;>
          (try {norm_num at hk ⊢ <;> omega
            }) <;>
        (try {linarith
          })
    have h₃₇ : (2 : ℝ) ≠ 0 := by norm_num
    have h₃₈ : Real.log 5 ≠ 0 := by
      have h₃₈₁ : Real.log 5 > 0 := Real.log_pos (by norm_num)
      linarith
    have h₃₉ : Real.log 3 ≠ 0 := by
      have h₃₉₁ : Real.log 3 > 0 := Real.log_pos (by norm_num)
      linarith
    field_simp [h₃₆, h₃₇, h₃₈, h₃₉, Real.logb, Real.log_mul, Real.log_rpow, Real.log_pow] <;> ring_nf <;>
                field_simp [h₃₆, h₃₇, h₃₈, h₃₉, Real.logb, Real.log_mul, Real.log_rpow, Real.log_pow] <;>
              ring_nf <;>
            field_simp [h₃₆, h₃₇, h₃₈, h₃₉, Real.logb, Real.log_mul, Real.log_rpow, Real.log_pow] <;>
          ring_nf <;>
        field_simp [h₃₆, h₃₇, h₃₈, h₃₉, Real.logb, Real.log_mul, Real.log_rpow, Real.log_pow] <;>
      ring_nf
    hole
  have h₄ : (∑ k in Finset.Icc (1 : ℕ) 100, Real.logb ((9 : ℝ) ^ k) ((25 : ℝ) ^ k)) = 100 * Real.logb 3 5:=
    by
    have h₄₁ :
      (∑ k in Finset.Icc (1 : ℕ) 100, Real.logb ((9 : ℝ) ^ k) ((25 : ℝ) ^ k)) =
        ∑ k in Finset.Icc (1 : ℕ) 100, (Real.logb 3 5 : ℝ) := by sorry
    --  rw [h₄₁]
    have h₄₂ : (∑ k in Finset.Icc (1 : ℕ) 100, (Real.logb 3 5 : ℝ)) = 100 * Real.logb 3 5:= by
      --  simp [Finset.sum_const, Finset.card_range] <;> norm_num <;> ring <;> simp [Real.logb] <;> field_simp <;> ring
      hole
    --  rw [h₄₂] <;> simp [Real.logb] <;> field_simp <;> ring
    hole
  have h₅ : Real.logb 5 3 * Real.logb 3 5 = 1:=
    by
    have h₅₁ : Real.logb 5 3 = Real.log 3 / Real.log 5 := by
      rw [Real.logb] <;> simp [Real.log_rpow] <;> field_simp <;> ring
    have h₅₂ : Real.logb 3 5 = Real.log 5 / Real.log 3 := by
      rw [Real.logb] <;> simp [Real.log_rpow] <;> field_simp <;> ring
    --  rw [h₅₁, h₅₂]
    have h₅₃ : Real.log 3 ≠ 0 := Real.log_ne_zero_of_pos_of_ne_one (by norm_num) (by norm_num)
    have h₅₄ : Real.log 5 ≠ 0 := Real.log_ne_zero_of_pos_of_ne_one (by norm_num) (by norm_num)
    have h₅₁ : Real.logb 5 3 = Real.log 3 / Real.log 5:= by -- rw [Real.logb] <;> simp [Real.log_rpow] <;> field_simp <;> ring
      hole
  have h₅ : Real.logb 5 3 * Real.logb 3 5 = 1 :=
    by
    have h₅₁ : Real.logb 5 3 = Real.log 3 / Real.log 5 := by
      rw [Real.logb] <;> simp [Real.log_rpow] <;> field_simp <;> ring
    have h₅₂ : Real.logb 3 5 = Real.log 5 / Real.log 3 := by
      rw [Real.logb] <;> simp [Real.log_rpow] <;> field_simp <;> ring
    rw [h₅₁, h₅₂]
    have h₅₃ : Real.log 3 ≠ 0 := Real.log_ne_zero_of_pos_of_ne_one (by norm_num) (by norm_num)
    have h₅₄ : Real.log 5 ≠ 0 := Real.log_ne_zero_of_pos_of_ne_one (by norm_num) (by norm_num)
    have h₅₂ : Real.logb 3 5 = Real.log 5 / Real.log 3:= by -- rw [Real.logb] <;> simp [Real.log_rpow] <;> field_simp <;> ring
      hole
  have h₅ : Real.logb 5 3 * Real.logb 3 5 = 1 :=
    by
    have h₅₁ : Real.logb 5 3 = Real.log 3 / Real.log 5 := by
      rw [Real.logb] <;> simp [Real.log_rpow] <;> field_simp <;> ring
    have h₅₂ : Real.logb 3 5 = Real.log 5 / Real.log 3 := by
      rw [Real.logb] <;> simp [Real.log_rpow] <;> field_simp <;> ring
    rw [h₅₁, h₅₂]
    have h₅₃ : Real.log 3 ≠ 0 := Real.log_ne_zero_of_pos_of_ne_one (by norm_num) (by norm_num)
    have h₅₄ : Real.log 5 ≠ 0 := Real.log_ne_zero_of_pos_of_ne_one (by norm_num) (by norm_num)
    have h₅₁ : Real.logb 5 3 = Real.log 3 / Real.log 5 := by sorry
  have h₅ : Real.logb 5 3 * Real.logb 3 5 = 1 :=
    by
    have h₅₁ : Real.logb 5 3 = Real.log 3 / Real.log 5 := by
      rw [Real.logb] <;> simp [Real.log_rpow] <;> field_simp <;> ring
    have h₅₂ : Real.logb 3 5 = Real.log 5 / Real.log 3 := by
      rw [Real.logb] <;> simp [Real.log_rpow] <;> field_simp <;> ring
    rw [h₅₁, h₅₂]
    have h₅₃ : Real.log 3 ≠ 0 := Real.log_ne_zero_of_pos_of_ne_one (by norm_num) (by norm_num)
    have h₅₄ : Real.log 5 ≠ 0 := Real.log_ne_zero_of_pos_of_ne_one (by norm_num) (by norm_num)
    field_simp [h₅₃, h₅₄] <;> ring <;> field_simp [h₅₃, h₅₄] <;> ring
    hole
  have h₆ :
    ((∑ k in Finset.Icc 1 20, Real.logb (5 ^ k) (3 ^ k ^ 2)) * ∑ k in Finset.Icc 1 100, Real.logb (9 ^ k) (25 ^ k)) =
      21000 := by sorry
  --  exact h₆
  linarith