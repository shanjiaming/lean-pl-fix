theorem eigenvector_preserved_under_commuting_matrix (n : Type) (inst✝¹ : Fintype n) (inst✝ : DecidableEq n) (A B : Matrix n n ℂ) (u : n → ℂ) (hu : u ≠ 0) (hAB : A * B = B * A) (lambda : ℂ) (hB : IsEigenvector B u lambda) : ∃ lambda', IsEigenvector B (A *ᵥ u) lambda' :=
  by
  have h_main : B.mulVec (A.mulVec u) = lambda • A.mulVec u := by sorry
  have h_final : ∃ (lambda' : ℂ), IsEigenvector B (A.mulVec u) lambda' := by sorry
  exact h_final
  hole