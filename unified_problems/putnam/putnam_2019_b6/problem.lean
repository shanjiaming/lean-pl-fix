theorem putnam_2019_b6
  (n : ℕ)
  (neighbors : (Fin n → ℤ) → (Fin n → ℤ) → Prop)
  (neighbors_def : ∀ p q, neighbors p q ↔ (∃ i : Fin n, abs (p i - q i) = 1 ∧ ∀ j ≠ i, p j = q j)) :
  (1 ≤ n ∧ ∃ S : Set (Fin n → ℤ),
    (∀ p ∈ S, ∀ q, neighbors p q → q ∉ S) ∧ (∀ p ∉ S, {q ∈ S | neighbors p q}.encard = 1))
  ↔ n ∈ ((Set.Ici 1) : Set ℕ ) := by