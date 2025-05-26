theorem putnam_1985_a1 :
  let (a, b, c, d) := ((10, 10, 0, 0) : ℕ × ℕ × ℕ × ℕ );
  {(A1, A2, A3) : Set ℤ × Set ℤ × Set ℤ | A1 ∪ A2 ∪ A3 = Icc 1 10 ∧ A1 ∩ A2 ∩ A3 = ∅}.ncard = 2 ^ a * 3 ^ b * 5 ^ c * 7 ^ d := by