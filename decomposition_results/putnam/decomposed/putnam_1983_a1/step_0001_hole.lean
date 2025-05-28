theorem putnam_1983_a1  : {n | n > 0 ∧ (n ∣ 10 ^ 40 ∨ n ∣ 20 ^ 30)}.encard = ↑2301 :=
  by
  have h_main : {n : ℤ | n > 0 ∧ (n ∣ 10 ^ 40 ∨ n ∣ 20 ^ 30)}.encard = (2301 : ℕ) := by sorry
  --  exact h_main
  hole