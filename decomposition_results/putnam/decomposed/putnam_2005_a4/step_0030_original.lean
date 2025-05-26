theorem h10 (n : ℕ) (H : Matrix (Fin n) (Fin n) ℝ) (a b : ℕ) (S : Matrix (Fin a) (Fin b) ℝ) (npos : n ≥ 1) (Hentries : ∀ (i j : Fin n), H i j = 1 ∨ H i j = -1) (Hortho : H.HasOrthogonalRows) (hab : 1 ≤ a ∧ a ≤ n ∧ 1 ≤ b ∧ b ≤ n) (Sentries : ∀ (i : Fin a) (j : Fin b), S i j = 1) (rri : Fin a → Fin n) (cri : Fin b → Fin n) (hrri : Function.Injective rri) (hcri : Function.Injective cri) (hS : S = H.submatrix rri cri) (this : Fact (1 ≤ n)) (h2 : a ≤ n) (h3 : b ≤ n) (h4 : 1 ≤ a) (h5 : 1 ≤ b) (h6 : ∀ (i : Fin a) (j : Fin b), H (rri i) (cri j) = 1) (h7 : ∀ (i : Fin a), ∑ k, H (rri i) k * H (rri i) k = (↑n : ℝ)) (h8 : ∀ (i j : Fin a), i ≠ j → ∑ k, H (rri i) k * H (rri j) k = 0) (h9 : (∑ k, if k ∈ Set.range cri then 1 else 0) = (↑b : ℝ)) : ∀ (i : Fin a), ∑ k, (if k ∈ Set.range cri then 1 else 0) * H (rri i) k = (↑b : ℝ) :=
  by
  intro i
  have h11 :
    (∑ k : Fin n, (if (k : Fin n) ∈ Set.range cri then (1 : ℝ) else 0) * H (rri i) k : ℝ) =
      ∑ k : Fin n, if (k : Fin n) ∈ Set.range cri then (1 : ℝ) * H (rri i) k else 0 * H (rri i) k := by sorry
  rw [h11]
  have h12 :
    (∑ k : Fin n, if (k : Fin n) ∈ Set.range cri then (1 : ℝ) * H (rri i) k else 0 * H (rri i) k : ℝ) =
      ∑ k : Fin n, if (k : Fin n) ∈ Set.range cri then H (rri i) k else 0 := by sorry
  rw [h12]
  have h13 :
    (∑ k : Fin n, if (k : Fin n) ∈ Set.range cri then H (rri i) k else 0 : ℝ) =
      ∑ k in Finset.univ.filter (fun k => (k : Fin n) ∈ Set.range cri), H (rri i) k := by sorry
  rw [h13]
  have h14 : (∑ k in Finset.univ.filter (fun k => (k : Fin n) ∈ Set.range cri), H (rri i) k : ℝ) = (b : ℝ) := by sorry
  rw [h14] <;> simp [Nat.cast_inj]