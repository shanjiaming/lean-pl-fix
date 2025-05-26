theorem putnam_2006_b3
    (IsLinearPartition : Finset (Fin 2 → ℝ) → Finset (Finset (Fin 2 → ℝ)) → Prop)
    (IsLinearPartition_def : ∀ S AB, IsLinearPartition S AB ↔
      (AB.card = 2 ∧ ∃ A ∈ AB, ∃ B ∈ AB,
        A ≠ B ∧ (A ∪ B = S) ∧ (A ∩ B = ∅) ∧
        (∃ m b : ℝ,
          (∀ p ∈ A, p 1 > m * p 0 + b) ∧
          (∀ p ∈ B, p 1 < m * p 0 + b))))
    (L : Finset (Fin 2 → ℝ) → ℕ)
    (hL : ∀ S, L S = {AB | IsLinearPartition S AB}.encard)
    (n : ℕ) (npos : 0 < n) :
    IsGreatest {L S | (S) (hS : S.card = n)} (((fun n : ℕ => (Nat.choose n 2) + 1) : ℕ → ℕ ) n) :=
  by