theorem mathd_numbertheory_457 (n : ℕ) (h₀ : 0 < n) (h₁ : 80325 ∣ n !) : 17 ≤ n:=
  by
  have h₂ : 17 ∣ 80325:= by -- norm_num <;> decide
    norm_num
  have h₃ : 17 ∣ n !:= by
    have h₄ : 17 ∣ 80325 := h₂
    have h₅ : 80325 ∣ n ! := h₁
    --  exact dvd_trans h₄ h₅
    omega
  have h₄ : n < 17 → False:= by
    --  intro h₅
    have h₆ : n < 17 := h₅
    have h₇ : ¬(17 ∣ n !):= by
      --  interval_cases n <;>
      --      norm_num [Nat.factorial_succ, Nat.dvd_iff_mod_eq_zero, Nat.mul_mod, Nat.add_mod, Nat.mod_mod] at h₃ ⊢ <;>
        try contradiction <;> try norm_num at h₃ ⊢ <;> try contradiction <;> try omega
      hole
    have h₈ : 17 ∣ n ! := h₃
    --  exact h₇ h₈
    hole
  have h₅ : 17 ≤ n:= by
    --  by_contra h₅
    have h₆ : n < 17:= by -- linarith
      linarith
    have h₇ : False := h₄ h₆
    --  exact h₇
    norm_cast
  --  exact h₅
  linarith