theorem h_main (K : Type u_1) (inst✝² : Field K) (m : Type u_2) (n : Type u_3) (inst✝¹ : Fintype m) (inst✝ : Fintype n) (A : Matrix m n K) (h_column_full_rank : column_full_rank A) : A.rank = Fintype.card n :=
  by
  rw [column_full_rank_iff_rank_eq_card] at h_column_full_rank
  exact h_column_full_rank
  hole