theorem h₂ (n : ℕ) : ∀ (n : ℕ), 4 ^ (n + 1) % 12 = 4 := by
  --  intro n
  --  induction n with
  --  | zero => norm_num
  --  | succ n ih => simp [pow_succ, Nat.mul_mod, ih, Nat.pow_mod] <;> norm_num <;> omega
  hole