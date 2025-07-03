import Mathlib

open Nat Set

/--
Let $H$ be an $n \times n$ matrix all of whose entries are $\pm 1$ and whose rows are mutually orthogonal. Suppose $H$ has an $a \times b$ submatrix whose entries are all $1$. Show that $ab \leq n$.
-/
theorem putnam_2005_a4
(n : ℕ)
(H : Matrix (Fin n) (Fin n) ℝ)
(a b : ℕ)
(S : Matrix (Fin a) (Fin b) ℝ)
(npos : n ≥ 1)
(Hentries : ∀ i j : Fin n, H i j = 1 ∨ H i j = -1)
(Hortho : H.HasOrthogonalRows)
(hab : 1 ≤ a ∧ a ≤ n ∧ 1 ≤ b ∧ b ≤ n)
(Ssub : ∃ (rri : Fin a → Fin n) (cri : Fin b → Fin n), rri.Injective ∧ cri.Injective ∧ S = H.submatrix rri cri)
(Sentries : ∀ (i : Fin a) (j : Fin b), S i j = 1)
: a * b ≤ n := by
  have h_main : a * b ≤ n := by
    obtain ⟨rri, cri, hrri, hcri, hS⟩ := Ssub
    have h1 : a * b ≤ n := by
      haveI : Fact (1 ≤ n) := ⟨npos⟩
      have h2 : (a : ℕ) ≤ n := by linarith
      have h3 : (b : ℕ) ≤ n := by linarith
      have h4 : 1 ≤ a := by linarith
      have h5 : 1 ≤ b := by linarith
      have h6 : ∀ i : Fin a, ∀ j : Fin b, H (rri i) (cri j) = 1 := by
        intro i j
        have h7 : S i j = 1 := Sentries i j
        have h8 : S = H.submatrix rri cri := hS
        have h9 : S i j = H.submatrix rri cri i j := by rw [h8]
        rw [h9] at h7
        simp [Matrix.submatrix_apply] at h7 ⊢
        <;> aesop
      -- Define the vectors `u_i` and `v`
      have h7 : ∀ i : Fin a, (∑ k : Fin n, H (rri i) k * H (rri i) k : ℝ) = n := by
        intro i
        have h8 : (∑ k : Fin n, H (rri i) k * H (rri i) k : ℝ) = ∑ k : Fin n, (H (rri i) k : ℝ) * (H (rri i) k : ℝ) := by simp [Finset.sum_congr]
        rw [h8]
        have h9 : ∀ k : Fin n, (H (rri i) k : ℝ) * (H (rri i) k : ℝ) = 1 := by
          intro k
          have h10 : H (rri i) k = 1 ∨ H (rri i) k = -1 := Hentries (rri i) k
          cases h10 with
          | inl h10 =>
            rw [h10]
            norm_num
          | inr h10 =>
            rw [h10]
            norm_num
        calc
          (∑ k : Fin n, (H (rri i) k : ℝ) * (H (rri i) k : ℝ)) = ∑ k : Fin n, (1 : ℝ) := by
            apply Finset.sum_congr rfl
            intro k _
            rw [h9 k]
          _ = n := by simp [Finset.sum_const, Finset.card_fin]
      have h8 : ∀ (i j : Fin a), i ≠ j → (∑ k : Fin n, H (rri i) k * H (rri j) k : ℝ) = 0 := by
        intro i j h
        have h9 : rri i ≠ rri j := by
          intro h9
          apply h
          exact hrri h9
        have h10 : (∑ k : Fin n, H (rri i) k * H (rri j) k : ℝ) = 0 := by
          have h11 : (∑ k : Fin n, H (rri i) k * H (rri j) k : ℝ) = 0 := by
            have h12 : Matrix.dotProduct (H (rri i)) (H (rri j)) = 0 := by
              have h13 : rri i ≠ rri j := h9
              have h14 : Matrix.dotProduct (H (rri i)) (H (rri j)) = 0 := by
                apply Hortho
                exact h13
              exact h14
            simpa [Matrix.dotProduct, Finset.sum_mul, Finset.mul_sum] using h12
          exact h11
        exact h10
      have h9 : (∑ k : Fin n, if (k : Fin n) ∈ Set.range cri then (1 : ℝ) else 0) = (b : ℝ) := by
        have h10 : (∑ k : Fin n, if (k : Fin n) ∈ Set.range cri then (1 : ℝ) else 0 : ℝ) = ∑ k in Finset.univ.filter (fun k => (k : Fin n) ∈ Set.range cri), (1 : ℝ) := by
          simp [Finset.sum_ite, Finset.filter_eq']
          <;>
          simp_all [Set.mem_range]
          <;>
          aesop
        rw [h10]
        have h11 : ∑ k in Finset.univ.filter (fun k => (k : Fin n) ∈ Set.range cri), (1 : ℝ) = (Finset.card (Finset.univ.filter (fun k => (k : Fin n) ∈ Set.range cri)) : ℝ) := by
          simp [Finset.sum_const]
        rw [h11]
        have h12 : Finset.card (Finset.univ.filter (fun k => (k : Fin n) ∈ Set.range cri)) = b := by
          have h13 : Fintype.card (Set.range cri) = b := by
            have h14 : Fintype.card (Set.range cri) = b := by
              have h15 : Fintype.card (Set.range cri) = b := by
                have h16 : Set.Injective cri := by simpa using hcri
                have h17 : Fintype.card (Set.range cri) = Fintype.card (Fin b) := by
                  apply Fintype.card_congr
                  exact Equiv.ofInjective _ h16
                simp at h17 ⊢
                <;> simp_all [Fintype.card_fin]
                <;> aesop
              exact h15
            exact h14
          have h15 : Finset.card (Finset.univ.filter (fun k => (k : Fin n) ∈ Set.range cri)) = b := by
            have h16 : Finset.card (Finset.univ.filter (fun k => (k : Fin n) ∈ Set.range cri)) = Fintype.card (Set.range cri) := by
              rw [Fintype.card_ofFinset]
              <;> simp [Set.ext_iff]
              <;> aesop
            rw [h16]
            exact_mod_cast h13
          exact h15
        rw [h12]
        <;> simp [Nat.cast_inj]
      have h10 : ∀ i : Fin a, (∑ k : Fin n, (if (k : Fin n) ∈ Set.range cri then (1 : ℝ) else 0) * H (rri i) k : ℝ) = (b : ℝ) := by
        intro i
        have h11 : (∑ k : Fin n, (if (k : Fin n) ∈ Set.range cri then (1 : ℝ) else 0) * H (rri i) k : ℝ) = ∑ k : Fin n, if (k : Fin n) ∈ Set.range cri then (1 : ℝ) * H (rri i) k else 0 * H (rri i) k := by
          apply Finset.sum_congr rfl
          intro k _
          split_ifs <;> simp [mul_comm]
          <;>
          aesop
        rw [h11]
        have h12 : (∑ k : Fin n, if (k : Fin n) ∈ Set.range cri then (1 : ℝ) * H (rri i) k else 0 * H (rri i) k : ℝ) = ∑ k : Fin n, if (k : Fin n) ∈ Set.range cri then H (rri i) k else 0 := by
          apply Finset.sum_congr rfl
          intro k _
          split_ifs <;> simp [mul_comm]
          <;>
          aesop
        rw [h12]
        have h13 : (∑ k : Fin n, if (k : Fin n) ∈ Set.range cri then H (rri i) k else 0 : ℝ) = ∑ k in Finset.univ.filter (fun k => (k : Fin n) ∈ Set.range cri), H (rri i) k := by
          simp [Finset.sum_ite, Finset.filter_eq']
          <;>
          aesop
        rw [h13]
        have h14 : (∑ k in Finset.univ.filter (fun k => (k : Fin n) ∈ Set.range cri), H (rri i) k : ℝ) = (b : ℝ) := by
          have h15 : ∀ k, k ∈ Finset.univ.filter (fun k => (k : Fin n) ∈ Set.range cri) → H (rri i) k = 1 := by
            intro k hk
            have h16 : (k : Fin n) ∈ Set.range cri := by
              simpa using hk
            obtain ⟨s, hs⟩ := h16
            have h17 : H (rri i) (cri s) = 1 := h6 i s
            have h18 : H (rri i) k = 1 := by
              rw [← hs]
              exact h17
            exact h18
          calc
            (∑ k in Finset.univ.filter (fun k => (k : Fin n) ∈ Set.range cri), H (rri i) k : ℝ) = ∑ k in Finset.univ.filter (fun k => (k : Fin n) ∈ Set.range cri), (1 : ℝ) := by
              apply Finset.sum_congr rfl
              intro k hk
              rw [h15 k hk]
            _ = ∑ k in Finset.univ.filter (fun k => (k : Fin n) ∈ Set.range cri), (1 : ℝ) := rfl
            _ = (Finset.card (Finset.univ.filter (fun k => (k : Fin n) ∈ Set.range cri)) : ℝ) := by
              simp [Finset.sum_const]
            _ = (b : ℝ) := by
              have h17 : Finset.card (Finset.univ.filter (fun k => (k : Fin n) ∈ Set.range cri)) = b := by
                have h18 : Fintype.card (Set.range cri) = b := by
                  have h19 : Fintype.card (Set.range cri) = b := by
                    have h20 : Fintype.card (Set.range cri) = b := by
                      have h21 : Set.Injective cri := by simpa using hcri
                      have h22 : Fintype.card (Set.range cri) = Fintype.card (Fin b) := by
                        apply Fintype.card_congr
                        exact Equiv.ofInjective _ h21
                      simp at h22 ⊢
                      <;> simp_all [Fintype.card_fin]
                      <;> aesop
                    exact h20
                  exact h19
                have h20 : Finset.card (Finset.univ.filter (fun k => (k : Fin n) ∈ Set.range cri)) = Fintype.card (Set.range cri) := by
                  rw [Fintype.card_ofFinset]
                  <;> simp [Set.ext_iff]
                  <;> aesop
                rw [h20]
                exact_mod_cast h18
              rw [h17]
              <;> simp [Nat.cast_inj]
        rw [h14]
        <;> simp [Nat.cast_inj]
      have h11 : (a : ℝ) * (b : ℝ) ≤ (n : ℝ) := by
        have h12 : ∀ i : Fin a, (b : ℝ) ^ 2 / (n : ℝ) ≤ (b : ℝ) := by
          intro i
          have h13 : (b : ℝ) ^ 2 / (n : ℝ) ≤ (b : ℝ) := by
            have h14 : (b : ℝ) ≤ (n : ℝ) := by exact_mod_cast h3
            have h15 : 0 < (n : ℝ) := by exact_mod_cast (by linarith)
            have h16 : (b : ℝ) ≥ 1 := by exact_mod_cast h5
            have h17 : (b : ℝ) ^ 2 / (n : ℝ) ≤ (b : ℝ) := by
              rw [div_le_iff h15]
              nlinarith
            exact h17
          exact h13
        have h18 : (a : ℝ) * (b : ℝ) ≤ (n : ℝ) := by
          have h19 : (a : ℝ) * (b : ℝ) ≤ (n : ℝ) := by
            have h20 : (a : ℝ) * ((b : ℝ) ^ 2 / (n : ℝ)) ≤ (a : ℝ) * (b : ℝ) := by
              have h21 : ∀ i : Fin a, (b : ℝ) ^ 2 / (n : ℝ) ≤ (b : ℝ) := h12
              have h22 : (a : ℝ) * ((b : ℝ) ^ 2 / (n : ℝ)) ≤ (a : ℝ) * (b : ℝ) := by
                have h23 : (b : ℝ) ^ 2 / (n : ℝ) ≤ (b : ℝ) := h12 ⟨0, by linarith⟩
                have h24 : (a : ℝ) ≥ 1 := by exact_mod_cast (by linarith)
                nlinarith
              exact h22
            have h21 : (a : ℝ) * ((b : ℝ) ^ 2 / (n : ℝ)) ≤ (a : ℝ) * (b : ℝ) := h20
            have h22 : (a : ℝ) * (b : ℝ) ≤ (n : ℝ) := by
              have h23 : (a : ℝ) * ((b : ℝ) ^ 2 / (n : ℝ)) ≤ (a : ℝ) * (b : ℝ) := h21
              have h24 : (a : ℝ) * ((b : ℝ) ^ 2 / (n : ℝ)) = (a : ℝ) * (b : ℝ) ^ 2 / (n : ℝ) := by ring
              rw [h24] at h23
              have h25 : (a : ℝ) * (b : ℝ) ^ 2 / (n : ℝ) ≤ (a : ℝ) * (b : ℝ) := h23
              have h26 : (a : ℝ) * (b : ℝ) ≤ (n : ℝ) := by
                by_contra h27
                have h28 : (n : ℝ) < (a : ℝ) * (b : ℝ) := by linarith
                have h29 : (a : ℝ) * (b : ℝ) ^ 2 / (n : ℝ) > (a : ℝ) * (b : ℝ) := by
                  have h30 : (a : ℝ) * (b : ℝ) ^ 2 / (n : ℝ) > (a : ℝ) * (b : ℝ) := by
                    have h31 : 0 < (n : ℝ) := by exact_mod_cast (by linarith)
                    have h32 : 0 < (a : ℝ) := by exact_mod_cast (by linarith)
                    have h33 : 0 < (b : ℝ) := by exact_mod_cast (by linarith)
                    have h34 : 0 < (a : ℝ) * (b : ℝ) := by positivity
                    have h35 : 0 < (a : ℝ) * (b : ℝ) ^ 2 := by positivity
                    rw [gt_iff_lt]
                    rw [lt_div_iff h31]
                    nlinarith
                  exact h30
                linarith
              exact h26
            exact h22
          exact h19
        exact h18
      have h12 : (a : ℕ) * (b : ℕ) ≤ n := by
        have h13 : (a : ℝ) * (b : ℝ) ≤ (n : ℝ) := h11
        have h14 : (a : ℕ) * (b : ℕ) ≤ n := by
          norm_cast at h13 ⊢
          <;>
          nlinarith
        exact h14
      exact h12
    exact h1
  exact h_main