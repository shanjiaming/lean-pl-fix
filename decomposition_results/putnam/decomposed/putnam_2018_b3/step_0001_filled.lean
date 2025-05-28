theorem putnam_2018_b3 (n : ℕ) (hn : n < 0) : n < 10 ^ 100 ∧ ↑n ∣ 2 ^ n ∧ ↑n - 1 ∣ 2 ^ n - 1 ∧ ↑n - 2 ∣ 2 ^ n - 2 ↔ n ∈ {2 ^ 2, 2 ^ 4, 2 ^ 16, 2 ^ 256} :=
  by
  have h_false : False := by sorry
  have h_main :
    (n < 10 ^ 100 ∧ ((n : ℤ) ∣ (2 ^ n : ℤ) ∧ (n - 1 : ℤ) ∣ (2 ^ n - 1 : ℤ) ∧ (n - 2 : ℤ) ∣ (2 ^ n - 2 : ℤ))) ↔
      n ∈ (({2 ^ 2, 2 ^ 4, 2 ^ 16, 2 ^ 256}) : Set ℕ) := by sorry
  exact h_main
  hole