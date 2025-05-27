theorem h_main (n : Type) (inst✝¹ : Fintype n) (inst✝ : DecidableEq n) (A B : Matrix n n ℂ) (u : n → ℂ) (hu : u ≠ 0) (hAB : A * B = B * A) (lambda : ℂ) (hB : IsEigenvector B u lambda) : B *ᵥ A *ᵥ u = lambda • A *ᵥ u :=
  by
  have h1 : B.mulVec (A.mulVec u) = (B * A).mulVec u := by sorry
  rw [h1]
  have h2 : (B * A).mulVec u = (A * B).mulVec u := by sorry
  rw [h2]
  have h3 : (A * B).mulVec u = A.mulVec (B.mulVec u) := by sorry
  rw [h3]
  have h4 : B.mulVec u = lambda • u := hB
  rw [h4]
  have h5 : A.mulVec (lambda • u) = lambda • A.mulVec u := by sorry
  rw [h5] <;> simp [Matrix.mul_assoc]