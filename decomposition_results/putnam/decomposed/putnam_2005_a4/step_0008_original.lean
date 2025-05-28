theorem h6 (n : ℕ) (H : Matrix (Fin n) (Fin n) ℝ) (a b : ℕ) (S : Matrix (Fin a) (Fin b) ℝ) (npos : n ≥ 1) (Hentries : ∀ (i j : Fin n), H i j = 1 ∨ H i j = -1) (Hortho : H.HasOrthogonalRows) (hab : 1 ≤ a ∧ a ≤ n ∧ 1 ≤ b ∧ b ≤ n) (Sentries : ∀ (i : Fin a) (j : Fin b), S i j = 1) (rri : Fin a → Fin n) (cri : Fin b → Fin n) (hrri : Function.Injective rri) (hcri : Function.Injective cri) (hS : S = H.submatrix rri cri) (this : Fact (1 ≤ n)) (h2 : a ≤ n) (h3 : b ≤ n) (h4 : 1 ≤ a) (h5 : 1 ≤ b) : ∀ (i : Fin a) (j : Fin b), H (rri i) (cri j) = 1 :=
  by
  intro i j
  have h7 : S i j = 1 := Sentries i j
  have h8 : S = H.submatrix rri cri := hS
  have h9 : S i j = H.submatrix rri cri i j := by sorry
  rw [h9] at h7
  simp [Matrix.submatrix_apply] at h7 ⊢ <;> aesop