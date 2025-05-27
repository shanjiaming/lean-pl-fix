theorem det_similar (n : Type u) (inst✝² : Fintype n) (inst✝¹ : DecidableEq n) (K : Type u_1) (inst✝ : Field K) (A B : Matrix n n K) (h : similar A B) : A.det = B.det :=
  by
  have h_main : det A = det B := by sorry
  exact h_main
  hole