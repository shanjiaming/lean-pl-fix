theorem determinant_decomposition (A A' : Matrix (Fin n) (Fin n) R) (i : Fin n) :
  det (updateRow A i (λ j => A i j + A' i j)) = det A + det (updateRow A i (A' i)):=
  by
  have h_main : D1 A A' i = D2 A + D3 A A' i:= by apply row_decomposition <;> simp [D1, D2, D3] <;> aesop
    hole
  have h_final : det (updateRow A i (λ j => A i j + A' i j)) = det A + det (updateRow A i (A' i)):= by
    calc
      det (updateRow A i (λ j => A i j + A' i j)) = D1 A A' i := by rfl
      _ = D2 A + D3 A A' i := by rw [h_main]
      _ = det A + det (updateRow A i (A' i)) := by rfl
    hole
  apply h_final
  hole