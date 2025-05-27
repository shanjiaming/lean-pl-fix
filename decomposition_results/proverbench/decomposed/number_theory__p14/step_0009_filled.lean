theorem h₂ (p : ℤ) (hp : Prime p) (hp_mod_6 : p % 6 = 1) (h_main : p > 0) (h_nat_prime : Nat.Prime p.natAbs) (h₁ : p > 0) : p = ↑p.natAbs := by -- -- rw [Int.natAbs_of_nonneg] <;> linarith
  omega