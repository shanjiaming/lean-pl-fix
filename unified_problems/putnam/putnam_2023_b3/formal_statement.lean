theorem putnam_2023_b3
    (IsZigZag : {k : ℕ} → (Fin k → ℝ) → Prop)
    (IsZigZag_def : ∀ (k : ℕ) [NeZero k] (y : Fin k → ℝ),
      IsZigZag y ↔ k = 1 ∨ ((∀ i, i + 1 < k → y (i + 1) ≠ y i)) ∧
        (∀ i, i + 2 < k → (y (i + 2) < y (i + 1) ↔ y i < y (i + 1))))
    (n : ℕ)
    (hn : 2 ≤ n)
    (a : (Fin n → Icc (0 : ℝ) 1) → ℕ)
    (ha : ∀ x, IsGreatest {k | ∃ i : Fin k ↪o Fin n, IsZigZag ((↑) ∘ x ∘ i)} (a x)) :
    𝔼[(↑) ∘ a] = ((fun n : ℕ ↦ (2 * (n : ℝ) + 2) / 3) : ℕ → ℝ ) n :=
  by