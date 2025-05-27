theorem h₂ (p : ℤ) (hp : Prime p) (hp_mod_6 : p % 6 = 1) (h_main h₁ : p > 0) : Nat.Prime p.natAbs :=
  by
  have h₃ : Int.Prime p := by sorry
  exact Int.prime_iff_natAbs_prime.mp h₃