theorem h_p_eq_natAbs (p : ℤ) (hp : Prime p) (hp_mod_6 : p % 6 = 1) (h_main : p > 0) (h_nat_prime : Nat.Prime p.natAbs) : p = ↑p.natAbs := by
  have h₁ : p > 0 := h_main
  have h₂ : p = (Int.natAbs p : ℤ) := by sorry
  exact h₂