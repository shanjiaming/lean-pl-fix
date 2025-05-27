theorem rankConditionIfSolutionExists (A : Matrix m n R) (B : Matrix m p R) :
  (∃ X : Matrix n p R, A * X = B) → rank A = rank (fromColumns A B):=
  by
  intro h
  have h₁ : ∃ (X : Matrix n p R), A * X = B := h
  have h₂ :
    LinearMap.range (Matrix.toLin (Pi.basisFun R n) (Pi.basisFun R m) A) =
      LinearMap.range (Matrix.toLin (Pi.basisFun R (Sum n p)) (Pi.basisFun R m) (fromColumns A B)) := by sorry
  have h₃ : rank A = rank (fromColumns A B):= by
    rw [rank, rank, h₂] <;>
        simp [fromColumns_apply₁, fromColumns_apply₂, Matrix.toLin_apply, Matrix.mul_apply, Finset.sum_comm,
          Function.comp_apply, Pi.add_apply] <;>
      aesop
    hole
  exact h₃
  hole