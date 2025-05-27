theorem h4 (R : Type u_1) (inst✝² : Field R) (n : Type u_2) (inst✝¹ : Fintype n) (inst✝ : DecidableEq n) (A : Matrix n n R) (ξ : n → R) (k✝ : R) (h : HomogeneousSystem A ξ) (k : R) (h1 : A.mulVec (k • ξ) = k • A.mulVec ξ) (h2 : A.mulVec (k • ξ) = k • 0) (h3 : A.mulVec (k • ξ) = 0) : HomogeneousSystem A (k • ξ) := by
  rw [HomogeneousSystem]
  exact h3