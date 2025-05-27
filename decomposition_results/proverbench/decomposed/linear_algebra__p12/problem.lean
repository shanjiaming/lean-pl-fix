theorem eigenvector_preserved_under_commuting_matrix
(lambda : ℂ) (hB : IsEigenvector B u lambda) :
∃ (lambda' : ℂ), IsEigenvector B (A.mulVec u) lambda' := by
  have h_main : B.mulVec (A.mulVec u) = lambda • A.mulVec u := by
    have h1 : B.mulVec (A.mulVec u) = (B * A).mulVec u := by
      rw [Matrix.mulVec_mulVec]
      <;> simp [Matrix.mul_assoc]
    rw [h1]
    have h2 : (B * A).mulVec u = (A * B).mulVec u := by rw [hAB]
    rw [h2]
    have h3 : (A * B).mulVec u = A.mulVec (B.mulVec u) := by
      rw [Matrix.mulVec_mulVec]
      <;> simp [Matrix.mul_assoc]
    rw [h3]
    have h4 : B.mulVec u = lambda • u := hB
    rw [h4]
    have h5 : A.mulVec (lambda • u) = lambda • A.mulVec u := by
      apply Matrix.mulVec_smul
    rw [h5]
    <;> simp [Matrix.mul_assoc]
  
  have h_final : ∃ (lambda' : ℂ), IsEigenvector B (A.mulVec u) lambda' := by
    refine' ⟨lambda, _⟩
    rw [IsEigenvector]
    exact h_main
  
  exact h_final