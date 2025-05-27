theorem prime_divisibility_condition (p : ℤ) (hp : Prime p) (x y : ℤ) : (∃ x, p ∣ x ^ 2 - x + 3) ↔ ∃ y, p ∣ y ^ 2 - y + 25 :=
  by
  have h_main : (∃ (x : ℤ), p ∣ x ^ 2 - x + 3) ↔ (∃ (y : ℤ), p ∣ y ^ 2 - y + 25) := by sorry
  --  exact h_main
  hole