theorem prime_divisors_of_polynomial_congruence  : (p : ℕ) → Nat.Prime p → p ∣ sorry → sorry :=
  by
  --  intro p hp hdiv
  have h₁ : p ≠ 3 := by sorry
  have h₂ : ¬(p ∣ n) := by sorry
  have h₃ : ∃ (d : ℕ), 0 < d ∧ (n ^ d : ℤ) ≡ 1 [ZMOD p] := by sorry
  have h₄ : (n ^ 12 : ℤ) ≡ -1 [ZMOD p] := by sorry
  have h₅ : (n ^ 24 : ℤ) ≡ 1 [ZMOD p] := by sorry
  have h₆ : p % 24 = 1 := by sorry
  have h₇ : is24kPlus1 p := by sorry
  --  exact h₇
  hole