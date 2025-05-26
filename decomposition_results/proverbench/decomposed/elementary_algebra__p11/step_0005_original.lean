theorem h_backward (h_main : ∀ n ≥ 12, 5 ^ n ≤ n !) (h_forward : ∀ n > 0, 5 ^ n > n ! → n ≤ 11) : ∀ n > 0, n ≤ 11 → 5 ^ n > n ! :=
  by
  intro n hn h_le_11
  have h₁ : n ≤ 11 := h_le_11
  have h₂ : n > 0 := hn
  interval_cases n <;> norm_num [Nat.factorial_succ, Nat.pow_succ] <;> (try decide) <;> (try norm_num) <;>
        (try ring_nf at *) <;>
      (try omega) <;>
    (try nlinarith)