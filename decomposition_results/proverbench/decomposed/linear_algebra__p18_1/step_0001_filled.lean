theorem mulVec_smul (R : Type u_1) (inst✝² : Field R) (n : Type u_2) (inst✝¹ : Fintype n) (inst✝ : DecidableEq n) (A✝ : Matrix n n R) (ξ : n → R) (k✝ : R) (A : Matrix n n R) (k : R) (x : n → R) : A.mulVec (k • x) = k • A.mulVec x :=
  by
  have h_main : ∀ (i : n), (A.mulVec (k • x)) i = (k • (A.mulVec x)) i := by sorry
  have h_final : A.mulVec (k • x) = k • (A.mulVec x) := by sorry
  exact h_final
  hole