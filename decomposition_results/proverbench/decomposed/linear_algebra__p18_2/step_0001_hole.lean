theorem homogeneous_system_solution_scalar_multiplication (R : Type u_1) (inst✝² : Field R) (n : Type u_2) (inst✝¹ : Fintype n) (inst✝ : DecidableEq n) (A : Matrix n n R) (ξ : n → R) (k✝ : R) (h : HomogeneousSystem A ξ) (k : R) : HomogeneousSystem A (k • ξ) :=
  by
  have h1 : A.mulVec (k • ξ) = k • A.mulVec ξ := by sorry
  have h2 : A.mulVec (k • ξ) = k • (0 : n → R) := by sorry
  have h3 : A.mulVec (k • ξ) = 0 := by sorry
  have h4 : HomogeneousSystem A (k • ξ) := by sorry
  exact h4
  hole