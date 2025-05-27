theorem h₇ (p a : ℕ) (h₀ : 0 < a) (h₁ : Nat.Prime p) (h₂ : a ≤ a ^ p) (h₃ : (↑a : ZMod p) ^ p = (↑a : ZMod p)) (this : Fact (Nat.Prime p)) (h₆ : (↑a : ZMod p) ^ p = (↑a : ZMod p)) : p ∣ a ^ p - a := by
  rw [← ZMod.nat_cast_zmod_eq_zero_iff_dvd]
  simp_all [ZMod.nat_cast_self, pow_succ, mul_comm] <;> ring_nf at * <;>
    simp_all [ZMod.nat_cast_zmod_eq_zero_iff_dvd, pow_succ, mul_comm]