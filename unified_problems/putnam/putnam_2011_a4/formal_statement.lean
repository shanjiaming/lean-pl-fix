theorem putnam_2011_a4
    (nmat : ℕ → Prop)
    (hnmat : ∀ n, nmat n ↔
      ∃ A : Matrix (Fin n) (Fin n) ℤ,
        (∀ r, Even ((A r) ⬝ᵥ (A r))) ∧
        Pairwise fun r1 r2 ↦ Odd ((A r1) ⬝ᵥ (A r2)))
    (n : ℕ) (npos : 0 < n) :
    nmat n ↔ n ∈ (({n : ℕ | Odd n}) : Set ℕ ) :=
  by