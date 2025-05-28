theorem induction_pord1p1on2powklt5on2 (n : ℕ) (h₀ : 0 < n) : (∏ k in Finset.Icc 1 n, 1 + (1 : ℝ) / 2 ^ k) < 5 / 2:=
  by
  have h₁ : (∏ k in Finset.Icc 1 n, (1 : ℝ)) = 1:= by -- -- rw [Finset.prod_const] <;> simp [h₀] <;> norm_num <;> aesop
    norm_num
  have h₂ : (1 : ℝ) / (2 : ℝ) ^ k ≤ 1:=
    by
    have h₃ : (2 : ℝ) ^ k ≥ 1:=
      by
      have h₄ : (1 : ℝ) ≤ (2 : ℝ) ^ k:=
        by
        have h₅ : (1 : ℝ) ≤ (2 : ℝ) ^ (k : ℕ):=
          by
          have h₂ : (1 : ℝ) ≤ (2 : ℝ) ^ (k : ℕ) :=
            by
            have h₂₁ : 1 ≤ (2 : ℝ) := by norm_num
            have h₂₂ : (1 : ℝ) ≤ (2 : ℝ) ^ (k : ℕ) := by exact one_le_pow_of_one_le h₂₁ (k : ℕ)
            exact h₂₂
          have h₂ : (1 : ℝ) ≤ (2 : ℝ) ^ (k : ℕ):= by
            have h₂₁ : 1 ≤ (2 : ℝ):= by -- norm_num
              norm_num
            have h₂₂ : (1 : ℝ) ≤ (2 : ℝ) ^ (k : ℕ):= by -- exact one_le_pow_of_one_le h₂₁ (k : ℕ)
              hole
            --  exact h₂₂
            hole
        have h₅ : (1 : ℝ) ≤ (2 : ℝ) ^ (k : ℕ) :=
          by
          have h₂ : (1 : ℝ) ≤ (2 : ℝ) ^ (k : ℕ) :=
            by
            have h₂₁ : 1 ≤ (2 : ℝ) := by norm_num
            have h₂₂ : (1 : ℝ) ≤ (2 : ℝ) ^ (k : ℕ) := by exact one_le_pow_of_one_le h₂₁ (k : ℕ)
            exact h₂₂
          exact h₂
          hole
        --  simpa using h₅
        hole
      --  linarith
      hole
    have h₄ : (1 : ℝ) / (2 : ℝ) ^ k ≤ 1:=
      by
      have h₅ : 0 < (2 : ℝ) ^ k:= by -- positivity
        norm_num
      have h₆ : (1 : ℝ) / (2 : ℝ) ^ k ≤ 1:= by -- sorry
        hole
      --  exact h₆
      hole
    --  exact h₄
    hole
  have h₃ : (∏ k in Finset.Icc 1 n, (1 : ℝ)) + (1 : ℝ) / (2 : ℝ) ^ k < 5 / 2:=
    by
    have h₃ : (∏ k in Finset.Icc 1 n, (1 : ℝ)) = 1:= by -- simp [Finset.prod_const]
      norm_num
    --  rw [h₃]
    have h₄ : (1 : ℝ) + (1 : ℝ) / (2 : ℝ) ^ k ≤ 2:=
      by
      have h₄₁ : (1 : ℝ) / (2 : ℝ) ^ k ≤ 1 :=
        by
        have h₄₂ : (k : ℕ) ≥ 0 := by positivity
        have h₄₃ : (2 : ℝ) ^ k ≥ 1 := by
          have h₄₄ : (1 : ℝ) ≤ (2 : ℝ) := by norm_num
          exact
            calc
              (1 : ℝ) ≤ (2 : ℝ) ^ 0 := by norm_num
              _ ≤ (2 : ℝ) ^ k := pow_le_pow_right (by norm_num) (by positivity)
        exact
          (div_le_one (by positivity)).mpr
            (by
              have h₄₅ : (1 : ℝ) ≤ (2 : ℝ) ^ k := by linarith
              linarith)
      have h₄₁ : (1 : ℝ) / (2 : ℝ) ^ k ≤ 1:= by
        have h₄₂ : (k : ℕ) ≥ 0:= by -- positivity
          norm_num
        have h₄₃ : (2 : ℝ) ^ k ≥ 1:= by
          have h₄₄ : (1 : ℝ) ≤ (2 : ℝ):= by -- norm_num
            norm_num
          --  exact
          --    calc
          --      (1 : ℝ) ≤ (2 : ℝ) ^ 0 := by norm_num
          --      _ ≤ (2 : ℝ) ^ k := pow_le_pow_right (by norm_num) (by positivity)
          hole
        --  exact
        --    (div_le_one (by positivity)).mpr
        --      (by
        --        have h₄₅ : (1 : ℝ) ≤ (2 : ℝ) ^ k := by linarith
        --        linarith)
        hole
    have h₄ : (1 : ℝ) + (1 : ℝ) / (2 : ℝ) ^ k ≤ 2 :=
      by
      have h₄₁ : (1 : ℝ) / (2 : ℝ) ^ k ≤ 1 :=
        by
        have h₄₂ : (k : ℕ) ≥ 0 := by positivity
        have h₄₃ : (2 : ℝ) ^ k ≥ 1 := by
          have h₄₄ : (1 : ℝ) ≤ (2 : ℝ) := by norm_num
          exact
            calc
              (1 : ℝ) ≤ (2 : ℝ) ^ 0 := by norm_num
              _ ≤ (2 : ℝ) ^ k := pow_le_pow_right (by norm_num) (by positivity)
        exact
          (div_le_one (by positivity)).mpr
            (by
              have h₄₅ : (1 : ℝ) ≤ (2 : ℝ) ^ k := by linarith
              linarith)
      linarith
      hole
    have h₅ : (1 : ℝ) + (1 : ℝ) / (2 : ℝ) ^ k < 5 / 2:= by -- -- -- norm_num at h₄ ⊢ <;> (try linarith) <;> (try nlinarith)
      hole
    linarith
    hole
  --  simpa [h₁] using h₃
  hole