import Mathlib

open Filter Topology Real

/--
Suppose we have a necklace of $n$ beads. Each bead is labeled with an integer and the sum of all these labels is $n-1$. Prove that we can cut the necklace to form a string whose consecutive labels $x_{1},x\_{2},\dots,x_{n}$ satisfy \[\sum_{i=1}^{k} x_{i} \leq k-1 \qquad \mbox{for} \quad k=1,2,\dots,n.\]
-/
theorem putnam_1995_a4
(n : ℕ)
(hn : n > 0)
(necklace : Fin n → ℤ)
(hnecklacesum : ∑ i : Fin n, necklace i = n - 1)
: ∃ cut, ∀ k, ∑ i : {j : Fin n | j.1 ≤ k}, necklace (cut + i) ≤ k := by
  have h_main : ∃ (cut : Fin n), ∀ (k : ℕ), ∑ i : {j : Fin n | j.1 ≤ k}, necklace (cut + i) ≤ k := by
    classical
    -- We will use the fact that there exists a cut where all partial sums are controlled.
    -- First, we find a cut where the first bead is ≤ 0.
    have h₁ : ∃ (cut : Fin n), necklace cut ≤ 0 := by
      by_contra! h
      -- If all beads are > 0, then their sum is > 0, which contradicts the given sum.
      have h₂ : ∀ i : Fin n, necklace i > 0 := by simpa using h
      have h₃ : ∑ i : Fin n, necklace i > 0 := by
        calc
          ∑ i : Fin n, necklace i ≥ ∑ i : Fin n, 1 := by
            exact Finset.sum_le_sum fun i _ => by
              have := h₂ i
              linarith
          _ = n := by simp [Finset.sum_const, Finset.card_fin]
          _ > 0 := by
            norm_num
            <;> omega
          _ > 0 := by norm_num
      have h₄ : (n : ℤ) - 1 ≥ 0 := by
        have h₅ : (n : ℤ) ≥ 1 := by
          exact_mod_cast Nat.succ_le_iff.mpr hn
        linarith
      linarith
    -- Choose a cut where the first bead is ≤ 0.
    obtain ⟨cut, hcut⟩ := h₁
    refine' ⟨cut, _⟩
    intro k
    -- We need to show that the sum of the first k beads is ≤ k.
    -- This is a non-trivial combinatorial argument, but we can use the fact that the sum of all beads is n - 1.
    have h₂ : ∑ i : { j : Fin n // j.1 ≤ k }, necklace (cut + i) ≤ k := by
      -- We will use the fact that the sum of all beads is n - 1.
      have h₃ : ∑ i : { j : Fin n // j.1 ≤ k }, necklace (cut + i) ≤ k := by
        -- We will use the fact that the sum of all beads is n - 1.
        have h₄ : ∑ i : { j : Fin n // j.1 ≤ k }, necklace (cut + i) = ∑ i : { j : Fin n // j.1 ≤ k }, necklace (cut + i) := rfl
        rw [h₄]
        -- We will use the fact that the sum of all beads is n - 1.
        have h₅ : ∑ i : { j : Fin n // j.1 ≤ k }, necklace (cut + i) ≤ k := by
          -- We will use the fact that the sum of all beads is n - 1.
          calc
            (∑ i : { j : Fin n // j.1 ≤ k }, necklace (cut + i)) ≤ ∑ i : { j : Fin n // j.1 ≤ k }, (1 : ℤ) := by
              -- We will use the fact that the sum of all beads is n - 1.
              have h₆ : ∀ i : { j : Fin n // j.1 ≤ k }, necklace (cut + i) ≤ 1 := by
                intro i
                have h₇ : necklace (cut + i) ≤ 1 := by
                  by_contra h₈
                  have h₉ : necklace (cut + i) > 1 := by linarith
                  have h₁₀ : ∑ i : Fin n, necklace i > n - 1 := by
                    calc
                      ∑ i : Fin n, necklace i ≥ necklace (cut + i) := by
                        -- We will use the fact that the sum of all beads is n - 1.
                        have h₁₁ : ∑ i : Fin n, necklace i ≥ necklace (cut + i) := by
                          -- We will use the fact that the sum of all beads is n - 1.
                          have h₁₂ : (cut + i : Fin n) ∈ (Finset.univ : Finset (Fin n)) := by
                            apply Finset.mem_univ
                          have h₁₃ : necklace (cut + i) ≤ ∑ i : Fin n, necklace i := by
                            apply Finset.single_le_sum (fun i _ => by
                              -- We will use the fact that the sum of all beads is n - 1.
                              have h₁₄ : necklace i ≥ necklace i := by linarith
                              linarith) h₁₂
                          linarith
                        linarith
                      _ > n - 1 := by
                        -- We will use the fact that the sum of all beads is n - 1.
                        have h₁₅ : (n : ℤ) - 1 ≥ 0 := by
                          have h₁₆ : (n : ℤ) ≥ 1 := by
                            exact_mod_cast Nat.succ_le_iff.mpr hn
                          linarith
                        have h₁₇ : necklace (cut + i) > 1 := by linarith
                        have h₁₈ : (n : ℤ) - 1 < n := by
                          have h₁₉ : (n : ℤ) - 1 < n := by
                            omega
                          linarith
                        have h₂₀ : necklace (cut + i) > 1 := by linarith
                        have h₂₁ : (n : ℤ) - 1 < n := by omega
                        omega
                  linarith
                linarith
              -- We will use the fact that the sum of all beads is n - 1.
              exact Finset.sum_le_sum fun i _ => by
                have h₇ := h₆ i
                linarith
            _ = ∑ i : { j : Fin n // j.1 ≤ k }, (1 : ℤ) := by rfl
            _ = (Finset.univ : Finset { j : Fin n // j.1 ≤ k }).card := by
              simp [Finset.sum_const]
            _ ≤ k := by
              -- We will use the fact that the sum of all beads is n - 1.
              have h₈ : (Finset.univ : Finset { j : Fin n // j.1 ≤ k }).card ≤ k + 1 := by
                -- We will use the fact that the sum of all beads is n - 1.
                have h₉ : (Finset.univ : Finset { j : Fin n // j.1 ≤ k }).card ≤ k + 1 := by
                  -- We will use the fact that the sum of all beads is n - 1.
                  have h₁₀ : (Finset.univ : Finset { j : Fin n // j.1 ≤ k }).card ≤ (Finset.univ : Finset (Fin n)).card := by
                    -- We will use the fact that the sum of all beads is n - 1.
                    apply Finset.card_le_card
                    intro i
                    simp [Finset.mem_univ]
                    <;> aesop
                  have h₁₁ : (Finset.univ : Finset (Fin n)).card = n := by simp
                  have h₁₂ : (Finset.univ : Finset { j : Fin n // j.1 ≤ k }).card ≤ n := by
                    linarith
                  have h₁₃ : n ≤ k + 1 := by
                    by_cases h₁₄ : k + 1 ≥ n
                    · omega
                    · exfalso
                      have h₁₅ : k + 1 < n := by omega
                      have h₁₆ : (Finset.univ : Finset { j : Fin n // j.1 ≤ k }).card ≤ k + 1 := by
                        -- We will use the fact that the sum of all beads is n - 1.
                        have h₁₇ : (Finset.univ : Finset { j : Fin n // j.1 ≤ k }).card ≤ k + 1 := by
                          -- We will use the fact that the sum of all beads is n - 1.
                          have h₁₈ : (Finset.univ : Finset { j : Fin n // j.1 ≤ k }).card ≤ (Finset.Icc (⟨0, by omega⟩ : Fin n) ⟨k, by omega⟩).card := by
                            -- We will use the fact that the sum of all beads is n - 1.
                            apply Finset.card_le_card
                            intro i
                            simp [Finset.mem_univ, Finset.mem_Icc]
                            <;> aesop
                          have h₁₉ : (Finset.Icc (⟨0, by omega⟩ : Fin n) ⟨k, by omega⟩).card ≤ k + 1 := by
                            -- We will use the fact that the sum of all beads is n - 1.
                            have h₂₀ : (Finset.Icc (⟨0, by omega⟩ : Fin n) ⟨k, by omega⟩).card ≤ k + 1 := by
                              -- We will use the fact that the sum of all beads is n - 1.
                              simp [Finset.Icc_eq_empty, Finset.card_eq_zero, Nat.lt_succ_iff]
                              <;> omega
                            exact h₂₀
                          linarith
                        exact h₁₇
                      omega
                  omega
                exact h₉
              have h₁₀ : (Finset.univ : Finset { j : Fin n // j.1 ≤ k }).card ≤ k + 1 := by
                exact h₈
              have h₁₁ : (Finset.univ : Finset { j : Fin n // j.1 ≤ k }).card ≤ k := by
                by_cases h₁₂ : k ≥ n
                · have h₁₃ : (Finset.univ : Finset { j : Fin n // j.1 ≤ k }).card ≤ n := by
                    -- We will use the fact that the sum of all beads is n - 1.
                    have h₁₄ : (Finset.univ : Finset { j : Fin n // j.1 ≤ k }).card ≤ (Finset.univ : Finset (Fin n)).card := by
                      -- We will use the fact that the sum of all beads is n - 1.
                      apply Finset.card_le_card
                      intro i
                      simp [Finset.mem_univ]
                      <;> aesop
                    have h₁₅ : (Finset.univ : Finset (Fin n)).card = n := by simp
                    linarith
                  have h₁₆ : (n : ℕ) ≤ k := by omega
                  have h₁₇ : (Finset.univ : Finset { j : Fin n // j.1 ≤ k }).card ≤ k := by
                    omega
                  exact h₁₇
                · have h₁₈ : k < n := by omega
                  have h₁₉ : (Finset.univ : Finset { j : Fin n // j.1 ≤ k }).card ≤ k + 1 := by
                    exact h₁₀
                  have h₂₀ : (Finset.univ : Finset { j : Fin n // j.1 ≤ k }).card ≤ k := by
                    by_cases h₂₁ : (Finset.univ : Finset { j : Fin n // j.1 ≤ k }).card ≤ k
                    · exact h₂₁
                    · exfalso
                      have h₂₂ : (Finset.univ : Finset { j : Fin n // j.1 ≤ k }).card > k := by omega
                      have h₂₃ : (Finset.univ : Finset { j : Fin n // j.1 ≤ k }).card ≤ k + 1 := by
                        exact h₁₀
                      omega
                  exact h₂₀
              have h₂₁ : (Finset.univ : Finset { j : Fin n // j.1 ≤ k }).card ≤ k := by
                exact h₁₁
              have h₂₂ : (Finset.univ : Finset { j : Fin n // j.1 ≤ k }).card ≤ k := by
                exact h₁₁
              simp_all [Finset.sum_const, nsmul_eq_mul, mul_comm]
              <;> omega
          <;> simp_all [Finset.sum_const, nsmul_eq_mul, mul_comm]
          <;> omega
        exact h₅
      exact h₃
    exact h₂
  obtain ⟨cut, hcut⟩ := h_main
  refine' ⟨cut, _⟩
  intro k
  exact hcut k