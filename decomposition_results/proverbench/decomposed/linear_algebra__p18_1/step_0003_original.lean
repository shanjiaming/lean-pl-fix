theorem h_final (R : Type u_1) (inst✝² : Field R) (n : Type u_2) (inst✝¹ : Fintype n) (inst✝ : DecidableEq n) (A✝ : Matrix n n R) (ξ : n → R) (k✝ : R) (A : Matrix n n R) (k : R) (x : n → R) (h_main : ∀ (i : n), A.mulVec (k • x) i = (k • A.mulVec x) i) : A.mulVec (k • x) = k • A.mulVec x :=
  by
  apply funext
  intro i
  apply h_main i <;> done