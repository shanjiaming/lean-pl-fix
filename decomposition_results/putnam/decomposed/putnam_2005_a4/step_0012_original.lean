theorem h9 (n : ℕ) (H : Matrix (Fin n) (Fin n) ℝ) (a b : ℕ) (S : Matrix (Fin a) (Fin b) ℝ) (npos : n ≥ 1) (Hentries : ∀ (i j : Fin n), H i j = 1 ∨ H i j = -1) (Hortho : H.HasOrthogonalRows) (hab : 1 ≤ a ∧ a ≤ n ∧ 1 ≤ b ∧ b ≤ n) (Sentries : ∀ (i : Fin a) (j : Fin b), S i j = 1) (rri : Fin a → Fin n) (cri : Fin b → Fin n) (hrri : Function.Injective rri) (hcri : Function.Injective cri) (hS : S = H.submatrix rri cri) (this : Fact (1 ≤ n)) (h2 : a ≤ n) (h3 : b ≤ n) (h4 : 1 ≤ a) (h5 : 1 ≤ b) (h6 : ∀ (i : Fin a) (j : Fin b), H (rri i) (cri j) = 1) (i : Fin a) (h8 : ∑ k, H (rri i) k * H (rri i) k = ∑ k, H (rri i) k * H (rri i) k) : ∀ (k : Fin n), H (rri i) k * H (rri i) k = 1 :=
  by
  intro k
  have h10 : H (rri i) k = 1 ∨ H (rri i) k = -1 := Hentries (rri i) k
  cases h10 with
  | inl h10 =>
    rw [h10]
    norm_num
  | inr h10 =>
    rw [h10]
    norm_num