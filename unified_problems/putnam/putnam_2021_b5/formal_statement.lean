theorem putnam_2021_b5
(n : ℕ)
(npos : n ≥ 1)
(veryodd : Matrix (Fin n) (Fin n) ℤ → Prop)
(hveryodd : ∀ A, veryodd A ↔ ∀ m ∈ Set.Icc 1 n, ∀ reind : Fin m → Fin n, Function.Injective reind → Odd (A.submatrix reind reind).det)
: ∀ A, veryodd A → (∀ k ≥ 1, veryodd (A ^ k)) := by