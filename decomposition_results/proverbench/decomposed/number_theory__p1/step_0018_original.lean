theorem h₅ (n p : ℕ) (hp : Nat.Prime p) (hdiv : p ∣ polynomial n) (h₁ : p ≠ 3) (h₂ : ¬p ∣ n) (this : Fact (Nat.Prime p)) (h₄ : ↑n ≠ 0) : ↑n ^ (p - 1) = 1 :=
  by
  apply ZMod.pow_card_sub_one_eq_one
  exact h₄