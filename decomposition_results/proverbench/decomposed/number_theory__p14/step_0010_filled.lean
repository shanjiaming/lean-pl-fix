theorem h_exists_rep (p : ℤ) (hp : Prime p) (hp_mod_6 : p % 6 = 1) (h_main : p > 0) (h_nat_prime : Nat.Prime p.natAbs) (h_p_eq_natAbs : p = ↑p.natAbs) : ∃ a b, p = a ^ 2 - a * b + b ^ 2 :=
  by
  have h₁ : p > 0 := h_main
  have h₂ : Nat.Prime (Int.natAbs p) := h_nat_prime
  have h₃ : p = (Int.natAbs p : ℤ) := h_p_eq_natAbs
  have h₄ : ∃ (a b : ℤ), p = a ^ 2 - a * b + b ^ 2 := by sorry
  --  simpa using h₄
  simpa