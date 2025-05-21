lemma row_decomposition (A A' : Matrix (Fin n) (Fin n) R) (i : Fin n) :
  D1 A A' i = D2 A + D3 A A' i := by
  have h1 : D1 A A' i = det (updateRow A i (A i + A' i)) := by
    rfl
  
  have h2 : det (updateRow A i (A i + A' i)) = det (updateRow A i (A i)) + det (updateRow A i (A' i)) := by
    apply Matrix.det_updateRow_add
    <;> simp_all [Matrix.det_updateRow_add]
    <;> ring
    <;> aesop
  
  have h3 : updateRow A i (A i) = A := by
    apply Matrix.updateRow_eq_self
  
  have h4 : det (updateRow A i (A i)) = D2 A := by
    rw [h3]
    <;> rfl
  
  have h5 : det (updateRow A i (A' i)) = D3 A A' i := by
    rfl
  
  have h6 : D1 A A' i = D2 A + D3 A A' i := by
    rw [h1, h2, h4, h5]
    <;> simp [D2, D3]
    <;> ring
    <;> aesop
  
  apply h6