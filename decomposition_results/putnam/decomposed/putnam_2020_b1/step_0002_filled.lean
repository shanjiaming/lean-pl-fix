theorem h₁ (d : ℕ → ℕ) (S : ℤ) (hd : d = fun n => ∑ i, (Nat.digits 2 n)[i]!) (hS : S = ∑ k, (-1) ^ d ↑k * ↑↑k ^ 3) : S % 2020 = ↑1990 :=
  by
  have h₂ : False := by sorry
  --  exfalso
  --  exact h₂
  hole