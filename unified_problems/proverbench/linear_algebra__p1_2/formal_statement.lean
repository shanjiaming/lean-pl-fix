/-- The main theorem: D1 = D2 + D3 for matrices A and A' differing only in the i-th row. -/
theorem determinant_decomposition (A A' : Matrix (Fin n) (Fin n) R) (i : Fin n) :
  det (updateRow A i (λ j => A i j + A' i j)) = det A + det (updateRow A i (A' i)) :=