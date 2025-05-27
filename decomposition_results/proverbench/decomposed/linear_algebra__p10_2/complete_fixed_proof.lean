theorem column_full_rank_implies_rank_eq_card (A : Matrix m n K) : column_full_rank A → Matrix.rank A = Fintype.card n:=
  by
  intro h_column_full_rank
  have h_main : Matrix.rank A = Fintype.card n:=
    by
    rw [column_full_rank_iff_rank_eq_card] at h_column_full_rank
    exact h_column_full_rank
    hole
  exact h_main
  hole