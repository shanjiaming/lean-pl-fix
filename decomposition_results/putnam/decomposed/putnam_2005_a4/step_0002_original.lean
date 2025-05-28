theorem h_main (n : ℕ) (H : Matrix (Fin n) (Fin n) ℝ) (a b : ℕ) (S : Matrix (Fin a) (Fin b) ℝ) (npos : n ≥ 1) (Hentries : ∀ (i j : Fin n), H i j = 1 ∨ H i j = -1) (Hortho : H.HasOrthogonalRows) (hab : 1 ≤ a ∧ a ≤ n ∧ 1 ≤ b ∧ b ≤ n) (Ssub : ∃ rri cri, Function.Injective rri ∧ Function.Injective cri ∧ S = H.submatrix rri cri) (Sentries : ∀ (i : Fin a) (j : Fin b), S i j = 1) : a * b ≤ n := by
  obtain ⟨rri, cri, hrri, hcri, hS⟩ := Ssub
  have h1 : a * b ≤ n := by sorry
  exact h1