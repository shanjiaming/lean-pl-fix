theorem putnam_1990_a6  : {x |
        match x with
        | (S, T) => (∀ s ∈ S, T.card < (↑s : ℕ)) ∧ ∀ t ∈ T, S.card < (↑t : ℕ)}.card =
    17711 :=
  by
  have h_main :
    ((Finset.univ : Finset <| Finset (Set.Icc 1 10) × Finset (Set.Icc 1 10)).filter fun ⟨S, T⟩ ↦
          (∀ s ∈ S, T.card < s) ∧ (∀ t ∈ T, S.card < t)).card =
      17711 := by sorry
  exact h_main