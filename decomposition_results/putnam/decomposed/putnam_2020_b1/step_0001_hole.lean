theorem putnam_2020_b1 (d : ℕ → ℕ) (S : ℤ) (hd : d = fun n => ∑ i, (Nat.digits 2 n)[i]!) (hS : S = ∑ k, (-1) ^ d ↑k * ↑↑k ^ 3) : S % 2020 = ↑1990 :=
  by
  have h₁ : S % 2020 = ((1990) : ℕ) := by sorry
  --  exact h₁
  hole