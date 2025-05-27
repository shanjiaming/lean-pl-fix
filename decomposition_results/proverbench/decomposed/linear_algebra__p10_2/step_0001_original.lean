theorem column_full_rank_implies_rank_eq_card (K : Type u_1) (inst✝² : Field K) (m : Type u_2) (n : Type u_3) (inst✝¹ : Fintype m) (inst✝ : Fintype n) (A : Matrix m n K) : column_full_rank A → A.rank = Fintype.card n :=
  by
  intro h_column_full_rank
  have h_main : Matrix.rank A = Fintype.card n := by sorry
  exact h_main