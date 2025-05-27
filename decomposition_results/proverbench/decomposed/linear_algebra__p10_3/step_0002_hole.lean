theorem h_main (K : Type u_1) (inst✝² : Field K) (m : Type u_2) (n : Type u_3) (inst✝¹ : Fintype m) (inst✝ : Fintype n) (A : Matrix m n K) (h_rank_eq_card_n : A.rank = Fintype.card n) : column_full_rank A := by
  rw [column_full_rank_iff_rank_eq_card] at *
  exact h_rank_eq_card_n
  hole