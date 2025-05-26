theorem h_main  : {x |
        match x with
        | (S, T) => (∀ s ∈ S, T.card < (↑s : ℕ)) ∧ ∀ t ∈ T, S.card < (↑t : ℕ)}.card =
    17711 :=
  by
  norm_num [Finset.card_univ, Fintype.card_finset, Fintype.card_subtype, Fintype.card_prod, Fintype.card_fun,
    Fintype.card_option]
  rfl