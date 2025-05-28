theorem h14 (n : ℕ) (H : Matrix (Fin n) (Fin n) ℝ) (a b : ℕ) (S : Matrix (Fin a) (Fin b) ℝ) (npos : n ≥ 1) (Hentries : ∀ (i j : Fin n), H i j = 1 ∨ H i j = -1) (Hortho : H.HasOrthogonalRows) (hab : 1 ≤ a ∧ a ≤ n ∧ 1 ≤ b ∧ b ≤ n) (Sentries : ∀ (i : Fin a) (j : Fin b), S i j = 1) (rri : Fin a → Fin n) (cri : Fin b → Fin n) (hrri : Function.Injective rri) (hcri : Function.Injective cri) (hS : S = H.submatrix rri cri) (this : Fact (1 ≤ n)) (h2 : a ≤ n) (h3 : b ≤ n) (h4 : 1 ≤ a) (h5 : 1 ≤ b) (h6 : ∀ (i : Fin a) (j : Fin b), H (rri i) (cri j) = 1) (h7 : ∀ (i : Fin a), ∑ k, H (rri i) k * H (rri i) k = ↑n) (i j : Fin a) (h : i ≠ j) (h9 h13 : rri i ≠ rri j) : Matrix.dotProduct (H (rri i)) (H (rri j)) = 0 :=
  by
  --  apply Hortho
  --  exact h13
  hole