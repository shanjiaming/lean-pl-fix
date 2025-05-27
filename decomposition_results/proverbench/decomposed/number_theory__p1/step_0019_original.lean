theorem h₆ (n p : ℕ) (hp : Nat.Prime p) (hdiv : p ∣ polynomial n) (h₁ : p ≠ 3) (h₂ : ¬p ∣ n) (this : Fact (Nat.Prime p)) (h₄ : ↑n ≠ 0) (h₅ : ↑n ^ (p - 1) = 1) : ↑n ^ (p - 1) ≡ 1 [ZMOD ↑p] :=
  by
  rw [← ZMod.int_cast_eq_int_cast_iff]
  simpa [ZMod.int_cast_eq_int_cast_iff] using h₅