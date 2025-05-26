theorem h₆ (h_main :  ∀ (n : ℕ),    ∑ k ∈ Finset.Icc 1 n, 6 ^ k / ((3 ^ (k + 1) - 2 ^ (k + 1)) * (3 ^ k - 2 ^ k)) =      2 - 2 ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) (h₂ : ∀ (n : ℕ), 2 ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) = 2 ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) (n : ℕ) (hn : n ≥ 1) : 3 ^ n ≥ 2 ^ n + 1 :=
  by
  have h₇ : ∀ n : ℕ, n ≥ 1 → (3 : ℚ) ^ n ≥ 2 ^ n + 1 :=
    by
    intro n hn
    induction' hn with n hn IH
    · norm_num
    ·
      cases n with
      | zero => norm_num at hn ⊢
      | succ n =>
        simp_all [pow_succ] <;> nlinarith [pow_pos (by norm_num : (0 : ℚ) < 2) n, pow_pos (by norm_num : (0 : ℚ) < 3) n]
  have h₇ : ∀ n : ℕ, n ≥ 1 → (3 : ℚ) ^ n ≥ 2 ^ n + 1 := by sorry
have h₆ : (3 : ℚ) ^ n ≥ 2 ^ n + 1 :=
  by
  have h₇ : ∀ n : ℕ, n ≥ 1 → (3 : ℚ) ^ n ≥ 2 ^ n + 1 :=
    by
    intro n hn
    induction' hn with n hn IH
    · norm_num
    ·
      cases n with
      | zero => norm_num at hn ⊢
      | succ n =>
        simp_all [pow_succ] <;> nlinarith [pow_pos (by norm_num : (0 : ℚ) < 2) n, pow_pos (by norm_num : (0 : ℚ) < 3) n]
  exact h₇ n hn
  hole