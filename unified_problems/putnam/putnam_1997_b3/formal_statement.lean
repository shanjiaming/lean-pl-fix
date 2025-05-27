theorem putnam_1997_b3
(n : ℕ)
(hn : n > 0)
: n ∈ (({n | (1 ≤ n ∧ n ≤ 4) ∨ (20 ≤ n ∧ n ≤ 24) ∨ (100 ≤ n ∧ n ≤ 104) ∨ (120 ≤ n ∧ n ≤ 124)}) : Set ℕ ) ↔ ¬5 ∣ (∑ m in Finset.Icc 1 n, 1/m : ℚ).den := by