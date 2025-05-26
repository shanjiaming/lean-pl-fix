theorem integer_representation_theorem (l : ℤ) (hl : 1 ≤ l ∧ l ≤ n) :
  ∃ (a b : ℤ), a < n ∧ b < n ∧
  Nat.gcd (a.natAbs) n.natAbs = 1 ∧
  Nat.gcd (b.natAbs) n.natAbs = 1 ∧
  (l = a + b ∨ l = a - b) :=