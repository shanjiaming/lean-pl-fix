theorem putnam_2021_b5 (n : ℕ) (npos : n ≥ 1) (veryodd : Matrix (Fin n) (Fin n) ℤ → Prop) (hveryodd :  ∀ (A : Matrix (Fin n) (Fin n) ℤ),    veryodd A ↔      ∀ m ∈ Set.Icc 1 n, ∀ (reind : Fin m → Fin n), Function.Injective reind → Odd (A.submatrix reind reind).det) : ∀ (A : Matrix (Fin n) (Fin n) ℤ), veryodd A → ∀ k ≥ 1, veryodd (A ^ k) := by
  --  intro A hA k hk
  have h_main : veryodd (A ^ k) := by sorry
  --  exact h_main
  hole