theorem five_pow_gt_factorial_iff_le_eleven (n : ℕ) (hn : 0 < n) : 5 ^ n > n! ↔ n ≤ 11:=
  by
  have h_main : (5 ^ n > n! → n ≤ 11) ∧ (n ≤ 11 → 5 ^ n > n!):=
    by
    --  refine' ⟨_, _⟩
    --  · intro h
    --    by_contra! h₁
      have h₂ : ∀ k : ℕ, k ≥ 12 → 5 ^ k ≤ k !:= by
        --  intro k hk
        --  induction' hk with k hk IH
        --  · norm_num [Nat.factorial]
        ·
          have h₃ : 5 ≤ k:= by omega
            hole
          have h₄ : 5 ^ (k + 1) = 5 * 5 ^ k:= by rw [pow_succ] <;> ring
            hole
        --    rw [h₄]
          have h₅ : 5 * 5 ^ k ≤ 5 * k !:= by exact Nat.mul_le_mul_left 5 IH
            hole
          have h₆ : 5 * k ! ≤ (k + 1) * k !:= by
            have h₇ : 5 ≤ k + 1:= by omega
              hole
            exact Nat.mul_le_mul_right (k !) h₇
            hole
          have h₇ : (k + 1) * k ! = (k + 1)!:= by simp [Nat.factorial]
            hole
        --    rw [h₇] at h₆
        --    exact le_trans h₅ h₆
        hole
      have h₃ : n ≥ 12:= by -- omega
        hole
      have h₄ : 5 ^ n ≤ n ! := h₂ n h₃
    --    omega
    --  · intro h
      have h₁ : n ≤ 11 := h
    --  --  --    interval_cases n <;> norm_num [Nat.factorial, Nat.pow_succ] <;> decide
    hole
  have h_final : 5 ^ n > n! ↔ n ≤ 11:= by
    --  constructor
    --  · intro h
    --    exact h_main.1 h
    --  · intro h
    --    exact h_main.2 h
    hole
  --  exact h_final
  hole