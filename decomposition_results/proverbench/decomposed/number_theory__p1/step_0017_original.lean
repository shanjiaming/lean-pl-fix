theorem h₅ (n p : ℕ) (hp : Nat.Prime p) (hdiv : p ∣ polynomial n) (h₁ : p ≠ 3) (h₂ : ¬p ∣ n) (this : Fact (Nat.Prime p)) (h₄ : ↑n = 0) : p ∣ n := by
  rw [← ZMod.nat_cast_zmod_eq_zero_iff_dvd]
  simpa using h₄