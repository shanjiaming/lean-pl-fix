theorem h₃ (a b c : ℕ) (h₀ : a ≤ 9 ∧ b ≤ 9 ∧ c ≤ 9) (h₁ : digits 10 (5 ^ 100 % 1000) = [c, b, a]) (h₂ : 5 ^ 100 % 1000 = 625) : digits 10 (5 ^ 100 % 1000) = [5, 2, 6] := by
  --  --  rw [h₂] <;> norm_num [Nat.digits_zero, Nat.div_eq_of_lt] <;> rfl
  norm_num