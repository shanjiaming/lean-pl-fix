theorem h₁ (m : Type u_1) (n : Type u_2) (inst✝² : Fintype m) (inst✝¹ : Fintype n) (F : Type u_3) (inst✝ : Field F) (A : Matrix m n F) (h : Aᵀ.rank = A.rank) : A.rank = Aᵀ.rank :=
  by
  apply Eq.symm
  exact h