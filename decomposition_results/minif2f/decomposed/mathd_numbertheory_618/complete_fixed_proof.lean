theorem mathd_numbertheory_618 (n : ℕ) (hn : n > 0) (p : ℕ → ℕ) (h₀ : ∀ x, p x = x ^ 2 - x + 41)
  (h₁ : 1 < Nat.gcd (p n) (p (n + 1))) : 41 ≤ n:=
  by
  have h₂ : p (n + 1) = p n + 2 * n:= by
    --  simp only [h₀]
    have h₃ : (n + 1 : ℕ) ^ 2 - (n + 1) + 41 = (n ^ 2 - n + 41) + 2 * n:= by
      --  cases n with
      --  | zero => contradiction
      --  | succ n =>
      --    cases n with
      --    | zero => norm_num
      --    | succ n => simp [Nat.mul_succ, Nat.add_assoc, Nat.pow_succ, Nat.mul_add, Nat.add_mul] <;> ring_nf at * <;> omega
      hole
    --  omega
    hole
  have h₃ : Nat.gcd (p n) (p (n + 1)) = Nat.gcd (p n) (2 * n):=
    by
    --  rw [h₂]
    have h₄ : Nat.gcd (p n) (p n + 2 * n) = Nat.gcd (p n) (2 * n):= by
      --  --  rw [← Nat.add_zero (p n), Nat.gcd_comm] <;> simp [Nat.gcd_add_mul_right_right, Nat.gcd_comm]
      norm_num
    --  rw [h₄] <;> simp [h₀] <;> ring_nf <;> omega
    hole
  have h₄ : 1 < Nat.gcd (p n) (2 * n):= by
    --  rw [h₃] at h₁
    --  exact h₁
    linarith
  have h₅ : 41 ≤ n:= by
    --  by_contra h
    have h₆ : n ≤ 40:= by -- linarith
      linarith
    have h₇ : n ≤ 40:= by -- linarith
      linarith
    --  --  interval_cases n <;> norm_num [h₀, Nat.gcd_eq_right, Nat.gcd_eq_left, Nat.gcd_eq_right] at h₄ ⊢ <;> (try omega) <;>
              (try contradiction) <;>
            (try norm_num) <;>
          (try {
              ring_nf at h₄ ⊢
              norm_num at h₄ ⊢ <;> (try omega) <;> (try contradiction)
            }) <;>
        (try omega) <;>
      (try contradiction)
    hole
  --  exact h₅
  linarith