theorem amc12a_2002_p6 (n : ℕ) (h₀ : 0 < n) : ∃ m, m > n ∧ ∃ p, m * p ≤ m + p:=
  by
  have h₁ : ∃ (m : ℕ), m > n ∧ ∃ (p : ℕ), m * p ≤ m + p:=
    by
    --  use n + 1
    --  constructor
    --  · omega
    --  --  · use 0 <;> simp [Nat.mul_zero, Nat.add_zero] <;> omega
    hole
  --  exact h₁
  simpa