theorem putnam_2021_b4
(F : ℕ → ℕ)
(hF : ∀ n, F (n + 2) = F (n + 1) + F n)
(F01 : F 0 = 0 ∧ F 1 = 1)
: ∀ m, m > 2 → (∃ p, (∏ k : Set.Icc 1 (F m - 1),  (k.1 ^ k.1)) % F m = F p) := by