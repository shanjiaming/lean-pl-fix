∃ (n : ℕ) (t : Fin n → Fin k),
    (∀ i j, i ≠ j → (ball (c (t i)) (r (t i)) ∩ ball (c (t j)) (r (t j)) = ∅)) ∧
    E ⊆ ⋃ i : Fin n, ball (c (t i)) (3 * (r (t i)))