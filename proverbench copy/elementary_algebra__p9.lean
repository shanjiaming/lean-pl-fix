theorem five_pow_gt_factorial_iff_le_eleven (n : ℕ) (hn : 0 < n) : 5^n > n! ↔ n ≤ 11 := by
  have h_main : (5^n > n! → n ≤ 11) ∧ (n ≤ 11 → 5^n > n!) := by
    refine' ⟨_, _⟩
    · -- Prove that if 5^n > n!, then n ≤ 11.
      intro h
      by_contra! h₁
      -- We will show that for n ≥ 12, 5^n ≤ n!.
      have h₂ : ∀ k : ℕ, k ≥ 12 → 5^k ≤ k ! := by
        intro k hk
        induction' hk with k hk IH
        · -- Base case: k = 12
          norm_num [Nat.factorial]
        · -- Inductive step: assume the statement holds for k, prove for k + 1.
          have h₃ : 5 ≤ k := by omega
          have h₄ : 5 ^ (k + 1) = 5 * 5 ^ k := by
            rw [pow_succ]
            <;> ring
          rw [h₄]
          have h₅ : 5 * 5 ^ k ≤ 5 * k ! := by
            exact Nat.mul_le_mul_left 5 IH
          have h₆ : 5 * k ! ≤ (k + 1) * k ! := by
            have h₇ : 5 ≤ k + 1 := by omega
            exact Nat.mul_le_mul_right (k !) h₇
          have h₇ : (k + 1) * k ! = (k + 1)! := by
            simp [Nat.factorial]
          rw [h₇] at h₆
          exact le_trans h₅ h₆
      -- Since n ≥ 12, we have 5^n ≤ n!.
      have h₃ : n ≥ 12 := by omega
      have h₄ : 5 ^ n ≤ n ! := h₂ n h₃
      -- But this contradicts the assumption that 5^n > n!.
      omega
    · -- Prove that if n ≤ 11, then 5^n > n!.
      intro h
      have h₁ : n ≤ 11 := h
      interval_cases n <;> norm_num [Nat.factorial, Nat.pow_succ]
      <;> decide
  
  have h_final : 5^n > n! ↔ n ≤ 11 := by
    constructor
    · -- Prove the forward direction: if 5^n > n!, then n ≤ 11.
      intro h
      exact h_main.1 h
    · -- Prove the backward direction: if n ≤ 11, then 5^n > n!.
      intro h
      exact h_main.2 h
  
  exact h_final