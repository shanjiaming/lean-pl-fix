theorem putnam_1982_b4
    (P : Finset ℤ → Prop)
    (P_def : ∀ n, P n ↔ n.Nonempty ∧ ∀ k, ∏ i in n, i ∣ ∏ i in n, (i + k)) :
    ((∀ n, P n → 1 ∈ n ∨ -1 ∈ n) ↔ ((True, True) : Prop × Prop ).1) ∧
    ((∀ n, P n → (∀ i ∈ n, 0 < i) → n = Finset.Icc (1 : ℤ) n.card) ↔ ((True, True) : Prop × Prop ).2) :=
  by