lemma transpose_space_equivalence :
row_space A = column_space (transpose A) ∧ column_space A = row_space (transpose A) := by
  have h1 : row_space A = column_space (transpose A) := by
    dsimp [row_space, column_space, Matrix.transpose]
    <;> congr
    <;> ext x
    <;> simp [Set.ext_iff]
    <;>
    (try
      constructor <;>
      simp_all [Function.funext_iff]
      <;>
      aesop)
    <;>
    aesop
  
  have h2 : column_space A = row_space (transpose A) := by
    dsimp [row_space, column_space, Matrix.transpose]
    <;> congr
    <;> ext x
    <;> simp [Set.ext_iff]
    <;>
    (try
      constructor <;>
      simp_all [Function.funext_iff]
      <;>
      aesop)
    <;>
    aesop
  
  exact ⟨h1, h2⟩