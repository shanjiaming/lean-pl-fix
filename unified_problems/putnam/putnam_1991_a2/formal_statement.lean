theorem putnam_1991_a2
  (n : ℕ) (hn : 1 ≤ n) :
  ((False) : Prop ) ↔ (∃ A B : Matrix (Fin n) (Fin n) ℝ,
    A ≠ B ∧ A ^ 3 = B ^ 3 ∧
    A ^ 2 * B = B ^ 2 * A ∧
    Nonempty (Invertible (A ^ 2 + B ^ 2))) := by