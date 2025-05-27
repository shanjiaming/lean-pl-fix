theorem h₃ (m n p : Type) (inst✝³ : Fintype m) (inst✝² : Fintype n) (inst✝¹ : Fintype p) (R : Type) (inst✝ : CommRing R) (A : Matrix m n R) (B : Matrix m p R) (h h₁ : ∃ X, A * X = B) (h₂ : LinearMap.range sorry = LinearMap.range sorry) : A.rank = (A.fromColumns B).rank := by
  rw [rank, rank, h₂] <;>
      simp [fromColumns_apply₁, fromColumns_apply₂, Matrix.toLin_apply, Matrix.mul_apply, Finset.sum_comm,
        Function.comp_apply, Pi.add_apply] <;>
    aesop