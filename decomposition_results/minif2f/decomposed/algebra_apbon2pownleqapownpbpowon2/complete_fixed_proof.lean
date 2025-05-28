theorem algebra_apbon2pownleqapownpbpowon2 (a b : ℝ) (n : ℕ) (h₀ : 0 < a ∧ 0 < b) (h₁ : 0 < n) :
  ((a + b) / 2) ^ n ≤ (a ^ n + b ^ n) / 2:=
  by
  have h₂ : 0 < a:= by -- linarith [h₀.1]
    linarith
  have h₃ : 0 < b:= by -- linarith [h₀.2]
    linarith
  have h₄ : 0 < (a + b) / 2:= by
    have h₄₁ : 0 < a + b:= by -- linarith
      linarith
    have h₄₂ : 0 < (a + b) / 2:= by -- positivity
      linarith
    --  exact h₄₂
    linarith
  have h₅ : ∀ (k : ℕ), (a - b) * (a ^ k - b ^ k) ≥ 0:= by
    --  intro k
    have h₅₁ : a > 0:= by -- linarith
      linarith
    have h₅₂ : b > 0:= by -- linarith
      linarith
    --  by_cases h₅₃ : a ≥ b
    ·
      have h₅₄ : a - b ≥ 0:= by -- linarith
        linarith
      have h₅₅ : a ^ k ≥ b ^ k:= by -- exact pow_le_pow_of_le_left (by linarith) h₅₃ k
        hole
      have h₅₆ : a ^ k - b ^ k ≥ 0:= by -- linarith
        linarith
      have h₅₇ : (a - b) * (a ^ k - b ^ k) ≥ 0:= by -- nlinarith
        nlinarith
    --    exact h₅₇
    ·
      have h₅₄ : a - b < 0 := by sorry
      have h₅₅ : a ^ k ≤ b ^ k := by sorry
      have h₅₆ : a ^ k - b ^ k ≤ 0 := by sorry
      have h₅₇ : (a - b) * (a ^ k - b ^ k) ≥ 0 := by sorry
    --    exact h₅₇
    hole
  have h₆ : ((a + b) / 2) ^ n ≤ (a ^ n + b ^ n) / 2:=
    by
    have h₆₁ : ∀ n : ℕ, 0 < n → ((a + b) / 2) ^ n ≤ (a ^ n + b ^ n) / 2:=
      by
      --  intro n hn
      --  induction' hn with n hn IH
      --  · norm_num [pow_one] <;> (try ring_nf) <;> (try nlinarith)
      ·
        have h₆₂ : (a - b) * (a ^ n - b ^ n) ≥ 0 := h₅ n
        have h₆₃ : (a + b) / 2 > 0:= by positivity
          hole
        have h₆₄ : ((a + b) / 2) ^ (n + 1) = ((a + b) / 2) ^ n * ((a + b) / 2):= by ring_nf <;> field_simp <;> ring_nf
          hole
      --    rw [h₆₄]
        have h₆₅ : ((a + b) / 2) ^ n * ((a + b) / 2) ≤ ((a ^ n + b ^ n) / 2) * ((a + b) / 2):= by gcongr <;> linarith
          hole
        have h₆₆ : ((a ^ n + b ^ n) / 2) * ((a + b) / 2) = (a ^ n * a + a ^ n * b + b ^ n * a + b ^ n * b) / 4:= by
          ring_nf <;> field_simp <;> ring_nf
          hole
      --    rw [h₆₆] at h₆₅
        have h₆₇ : (a ^ (n + 1) + b ^ (n + 1)) / 2 ≥ (a ^ n * a + a ^ n * b + b ^ n * a + b ^ n * b) / 4:=
          by
          have h₆₈ : a ^ (n + 1) = a ^ n * a:= by ring_nf
            hole
          have h₆₉ : b ^ (n + 1) = b ^ n * b:= by ring_nf
            hole
          rw [h₆₈, h₆₉]
          have h₇₀ : a ^ n * a + b ^ n * b ≥ a ^ n * b + b ^ n * a:= by nlinarith [h₅ n]
            hole
          nlinarith [h₅ n]
          hole
        have h₆₈ : ((a + b) / 2) ^ (n + 1) ≤ (a ^ (n + 1) + b ^ (n + 1)) / 2:=
          by
          have h₆₉ : ((a + b) / 2) ^ (n + 1) ≤ (a ^ n * a + a ^ n * b + b ^ n * a + b ^ n * b) / 4:= by linarith
            hole
          have h₇₀ : (a ^ (n + 1) + b ^ (n + 1)) / 2 ≥ (a ^ n * a + a ^ n * b + b ^ n * a + b ^ n * b) / 4:= by exact h₆₇
            hole
          have h₇₁ : ((a + b) / 2) ^ (n + 1) ≤ (a ^ (n + 1) + b ^ (n + 1)) / 2:= by linarith
            hole
          exact h₇₁
          hole
      --    simpa [pow_succ] using h₆₈
      hole
    --  exact h₆₁ n h₁
    hole
  --  exact h₆
  linarith