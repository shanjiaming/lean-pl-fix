theorem putnam_1990_a6 :
    ((Finset.univ : Finset <| Finset (Set.Icc 1 10) × Finset (Set.Icc 1 10)).filter
      fun ⟨S, T⟩ ↦ (∀ s ∈ S, T.card < s) ∧ (∀ t ∈ T, S.card < t)).card =
    ((17711) : ℕ ) := by
  have h_main : ((Finset.univ : Finset <| Finset (Set.Icc 1 10) × Finset (Set.Icc 1 10)).filter
      fun ⟨S, T⟩ ↦ (∀ s ∈ S, T.card < s) ∧ (∀ t ∈ T, S.card < t)).card = 17711 := by
    norm_num [Finset.card_univ, Fintype.card_finset, Fintype.card_subtype, Fintype.card_prod,
      Fintype.card_fun, Fintype.card_option]
    rfl
  exact h_main