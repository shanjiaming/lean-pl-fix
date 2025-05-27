theorem rank_eq_card_implies_column_full_rank (A : Matrix m n K) : Matrix.rank A = Fintype.card n → column_full_rank A:=
  by
  intro h_rank_eq_card_n
  have h_main : column_full_rank A:= by
    rw [column_full_rank_iff_rank_eq_card] at *
    exact h_rank_eq_card_n
    hole
  exact h_main
  hole