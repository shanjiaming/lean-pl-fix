theorem det_product_eq (n : Type u) (inst✝² : Fintype n) (inst✝¹ : DecidableEq n) (K : Type u_1) (inst✝ : Field K) (X Y : Matrix n n K) : (X * Y).det = X.det * Y.det :=
  by
  have h : det (X * Y) = det X * det Y := by sorry
  exact h
  hole