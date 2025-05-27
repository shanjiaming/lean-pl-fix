theorem putnam_2021_a5
  (j : ℕ)
  (A : Finset ℕ)
  (S : ℕ → ℕ)
  (hA : A = {n | 1 ≤ n ∧ n ≤ 2021 ∧ Nat.gcd n 2021 = 1})
  (hS : ∀ j' : ℕ, S j' = ∑ n in A, n ^ j') :
  (2021 ∣ S j) ↔ j ∈ (({j : ℕ | ¬(42 ∣ j) ∧ ¬(46 ∣ j)}) : Set ℕ ) := by