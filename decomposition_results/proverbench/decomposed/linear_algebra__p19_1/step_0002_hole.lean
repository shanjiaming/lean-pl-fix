theorem h₂ (m n p : Type) (inst✝³ : Fintype m) (inst✝² : Fintype n) (inst✝¹ : Fintype p) (R : Type) (inst✝ : CommRing R) (A : Matrix m n R) (B : Matrix m p R) (h h₁ : ∃ X, A * X = B) : LinearMap.range sorry = LinearMap.range sorry :=
  by
  obtain ⟨X, hX⟩ := h₁
  have h₂₁ :
    LinearMap.range (Matrix.toLin (Pi.basisFun R n) (Pi.basisFun R m) A) ≤
      LinearMap.range (Matrix.toLin (Pi.basisFun R (Sum n p)) (Pi.basisFun R m) (fromColumns A B)) := by sorry
  have h₂₂ :
    LinearMap.range (Matrix.toLin (Pi.basisFun R (Sum n p)) (Pi.basisFun R m) (fromColumns A B)) ≤
      LinearMap.range (Matrix.toLin (Pi.basisFun R n) (Pi.basisFun R m) A) := by sorry
  exact le_antisymm h₂₁ h₂₂
  hole