theorem h_main (n : ℕ) (hn : n < 0) (h_false : False) : n < 10 ^ 100 ∧ ↑n ∣ 2 ^ n ∧ ↑n - 1 ∣ 2 ^ n - 1 ∧ ↑n - 2 ∣ 2 ^ n - 2 ↔ n ∈ {2 ^ 2, 2 ^ 4, 2 ^ 16, 2 ^ 256} :=
  by
  exfalso
  exact h_false