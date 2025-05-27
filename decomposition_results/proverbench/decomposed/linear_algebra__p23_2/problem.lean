theorem rank_equivalence : Matrix.rank A = Matrix.rank (transpose A) := by
  have h : Matrix.rank (transpose A) = Matrix.rank A := by
    rw [Matrix.rank_transpose]
    <;>
    simp_all [Matrix.rank_transpose]
    <;>
    aesop
  
  have h₁ : Matrix.rank A = Matrix.rank (transpose A) := by
    apply Eq.symm
    exact h
  
  apply h₁