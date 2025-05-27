i < m - 1 ∧ j < n - 1 ∧ coins1 i j ∧ ¬coins1 (i + 1) j ∧ ¬coins1 i (j + 1) ∧ ¬coins1 (i + 1) (j + 1) ∧
¬coins2 i j ∧ ¬coins2 (i + 1) j ∧ ¬coins2 i (j + 1) ∧ coins2 (i + 1) (j + 1) ∧
(∀ i' j', ((i', j') ≠ (i, j) ∧ (i', j') ≠ (i + 1, j) ∧ (i', j') ≠ (i, j + 1) ∧ (i', j') ≠ (i + 1, j + 1))  → coins1 i' j' = coins2 i' j')