theorem h_nat_prime (p : ℤ) (hp : Prime p) (hp_mod_6 : p % 6 = 1) (h_main : p > 0) : Nat.Prime p.natAbs :=
  by
  have h₁ : (p : ℤ) > 0 := h_main
  have h₂ : Nat.Prime (Int.natAbs p) := by sorry
  --  exact h₂
  simpa