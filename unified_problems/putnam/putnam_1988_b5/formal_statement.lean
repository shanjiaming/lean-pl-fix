theorem putnam_1988_b5
    (n : ℕ) (hn : n > 0)
    (Mn : Matrix (Fin (2 * n + 1)) (Fin (2 * n + 1)) ℝ)
    (Mnskewsymm : ∀ i j, Mn i j = -(Mn j i))
    (hMn1 : ∀ i j, (1 ≤ (i.1 : ℤ) - j.1 ∧ (i.1 : ℤ) - j.1 ≤ n) → Mn i j = 1)
    (hMnn1 : ∀ i j, (i.1 : ℤ) - j.1 > n → Mn i j = -1) :
    Mn.rank = ((fun n : ℕ => 2 * n) : ℕ → ℕ ) n :=
  by