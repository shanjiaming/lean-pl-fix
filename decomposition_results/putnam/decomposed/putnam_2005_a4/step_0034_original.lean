theorem h14 (n : ℕ) (H : Matrix (Fin n) (Fin n) ℝ) (a b : ℕ) (S : Matrix (Fin a) (Fin b) ℝ) (npos : n ≥ 1) (Hentries : ∀ (i j : Fin n), H i j = 1 ∨ H i j = -1) (Hortho : H.HasOrthogonalRows) (hab : 1 ≤ a ∧ a ≤ n ∧ 1 ≤ b ∧ b ≤ n) (Sentries : ∀ (i : Fin a) (j : Fin b), S i j = 1) (rri : Fin a → Fin n) (cri : Fin b → Fin n) (hrri : Function.Injective rri) (hcri : Function.Injective cri) (hS : S = H.submatrix rri cri) (this : Fact (1 ≤ n)) (h2 : a ≤ n) (h3 : b ≤ n) (h4 : 1 ≤ a) (h5 : 1 ≤ b) (h6 : ∀ (i : Fin a) (j : Fin b), H (rri i) (cri j) = 1) (h7 : ∀ (i : Fin a), ∑ k, H (rri i) k * H (rri i) k = (↑n : ℝ)) (h8 : ∀ (i j : Fin a), i ≠ j → ∑ k, H (rri i) k * H (rri j) k = 0) (h9 : (∑ k, if k ∈ Set.range cri then 1 else 0) = (↑b : ℝ)) (i : Fin a) (h11 :  ∑ k, (if k ∈ Set.range cri then 1 else 0) * H (rri i) k =    ∑ k, if k ∈ Set.range cri then 1 * H (rri i) k else 0 * H (rri i) k) (h12 :  (∑ k, if k ∈ Set.range cri then 1 * H (rri i) k else 0 * H (rri i) k) =    ∑ k, if k ∈ Set.range cri then H (rri i) k else 0) (h13 : (∑ k, if k ∈ Set.range cri then H (rri i) k else 0) = ∑ k ∈ {k | k ∈ Set.range cri}, H (rri i) k) : ∑ k ∈ {k | k ∈ Set.range cri}, H (rri i) k = (↑b : ℝ) :=
  by
  have h15 : ∀ k, k ∈ Finset.univ.filter (fun k => (k : Fin n) ∈ Set.range cri) → H (rri i) k = 1 := by sorry
  calc
    (∑ k in Finset.univ.filter (fun k => (k : Fin n) ∈ Set.range cri), H (rri i) k : ℝ) =
        ∑ k in Finset.univ.filter (fun k => (k : Fin n) ∈ Set.range cri), (1 : ℝ) :=
      by
      apply Finset.sum_congr rfl
      intro k hk
      rw [h15 k hk]
    _ = ∑ k in Finset.univ.filter (fun k => (k : Fin n) ∈ Set.range cri), (1 : ℝ) := rfl
    _ = (Finset.card (Finset.univ.filter (fun k => (k : Fin n) ∈ Set.range cri)) : ℝ) := by simp [Finset.sum_const]
    _ = (b : ℝ) :=
      by
      have h17 : Finset.card (Finset.univ.filter (fun k => (k : Fin n) ∈ Set.range cri)) = b :=
        by
        have h18 : Fintype.card (Set.range cri) = b :=
          by
          have h19 : Fintype.card (Set.range cri) = b :=
            by
            have h20 : Fintype.card (Set.range cri) = b :=
              by
              have h21 : Set.Injective cri := by simpa using hcri
              have h22 : Fintype.card (Set.range cri) = Fintype.card (Fin b) :=
                by
                apply Fintype.card_congr
                exact Equiv.ofInjective _ h21
              simp at h22 ⊢ <;> simp_all [Fintype.card_fin] <;> aesop
            exact h20
          exact h19
        have h20 :
          Finset.card (Finset.univ.filter (fun k => (k : Fin n) ∈ Set.range cri)) = Fintype.card (Set.range cri) := by
          rw [Fintype.card_ofFinset] <;> simp [Set.ext_iff] <;> aesop
        rw [h20]
        exact_mod_cast h18
      rw [h17] <;> simp [Nat.cast_inj]