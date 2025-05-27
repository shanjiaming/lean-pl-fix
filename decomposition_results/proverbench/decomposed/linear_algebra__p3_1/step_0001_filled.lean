theorem det_identity (n : Type) (inst✝¹ : Fintype n) (inst✝ : DecidableEq n) : det 1 = 1 :=
  by
  have h : det (1 : Matrix n n ℝ) = 1 := by sorry
  exact h
  hole