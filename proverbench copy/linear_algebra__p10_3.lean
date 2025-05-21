theorem rank_eq_card_implies_column_full_rank (A : Matrix m n K) :
Matrix.rank A = Fintype.card n → column_full_rank A := by
  intro h_rank_eq_card_n
  have h_main : column_full_rank A := by
    rw [column_full_rank_iff_rank_eq_card] at *
    -- Using the given axiom `column_full_rank_iff_rank_eq_card`, we rewrite the goal to use the equality `Matrix.rank A = Fintype.card n`.
    exact h_rank_eq_card_n
  exact h_main