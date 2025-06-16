theorem putnam_1974_b5
    : ∀ n ≥ 0, ∑ i in Finset.Icc (0 : ℕ) n, (n^i : ℝ)/(Nat.factorial i) > (Real.exp n)/2 := by
  have h_main : ∀ (n : ℕ), ∑ i in Finset.Icc (0 : ℕ) n, (n^i : ℝ)/(Nat.factorial i) > (Real.exp n)/2 := by
    intro n
    have h₁ : ∑ i in Finset.Icc (0 : ℕ) n, ((n : ℝ) ^ i / Nat.factorial i : ℝ) > (Real.exp n) / 2 := by
      have h₂ : n ≤ 11 ∨ n ≥ 12 := by
        by_cases h : n ≤ 11
        · exact Or.inl h
        · exact Or.inr (by omega)
      cases h₂ with
      | inl h₂ =>
        -- For n ≤ 11, we use explicit calculations
        have h₃ : n ≤ 11 := h₂
        interval_cases n <;> norm_num [Finset.sum_Icc_succ_top, Nat.factorial_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Real.exp_pos] at * <;>
          (try norm_num) <;>
          (try linarith [Real.add_one_lt_exp (by norm_num : (1 : ℝ) ≠ 0)]) <;>
          (try linarith [Real.add_one_lt_exp (by norm_num : (2 : ℝ) ≠ 0)]) <;>
          (try linarith [Real.add_one_lt_exp (by norm_num : (3 : ℝ) ≠ 0)]) <;>
          (try linarith [Real.add_one_lt_exp (by norm_num : (4 : ℝ) ≠ 0)]) <;>
          (try linarith [Real.add_one_lt_exp (by norm_num : (5 : ℝ) ≠ 0)]) <;>
          (try linarith [Real.add_one_lt_exp (by norm_num : (6 : ℝ) ≠ 0)]) <;>
          (try linarith [Real.add_one_lt_exp (by norm_num : (7 : ℝ) ≠ 0)]) <;>
          (try linarith [Real.add_one_lt_exp (by norm_num : (8 : ℝ) ≠ 0)]) <;>
          (try linarith [Real.add_one_lt_exp (by norm_num : (9 : ℝ) ≠ 0)]) <;>
          (try linarith [Real.add_one_lt_exp (by norm_num : (10 : ℝ) ≠ 0)]) <;>
          (try linarith [Real.add_one_lt_exp (by norm_num : (11 : ℝ) ≠ 0)]) <;>
          (try norm_num [Real.exp_ne_zero])
      | inr h₂ =>
        -- For n ≥ 12, we use the bound on the remainder term
        have h₃ : n ≥ 12 := h₂
        have h₄ : ∑ i in Finset.Icc (0 : ℕ) n, ((n : ℝ) ^ i / Nat.factorial i : ℝ) > (Real.exp n) / 2 := by
          have h₅ : Real.exp n = ∑ i in Finset.range (n + 1), ((n : ℝ) ^ i / Nat.factorial i : ℝ) := by
            -- Use the Taylor series expansion of the exponential function
            have h₅₁ : Real.exp n = ∑' i : ℕ, (n : ℝ) ^ i / Nat.factorial i := by
              rw [Real.exp_eq_tsum]
              <;> field_simp
            have h₅₂ : (∑' i : ℕ, (n : ℝ) ^ i / ↑(Nat.factorial i)) = ∑' i : ℕ, (n : ℝ) ^ i / ↑(Nat.factorial i) := rfl
            rw [h₅₁, h₅₂]
            -- Use the fact that the series converges to the exponential function
            have h₅₃ : (∑' i : ℕ, (n : ℝ) ^ i / ↑(Nat.factorial i)) = ∑' i : ℕ, (n : ℝ) ^ i / ↑(Nat.factorial i) := rfl
            have h₅₄ : ∑ i in Finset.range (n + 1), ((n : ℝ) ^ i / Nat.factorial i : ℝ) = ∑ i in Finset.range (n + 1), ((n : ℝ) ^ i / Nat.factorial i : ℝ) := rfl
            -- Use the fact that the series converges to the exponential function
            have h₅₅ : (∑' i : ℕ, (n : ℝ) ^ i / ↑(Nat.factorial i)) = ∑' i : ℕ, (n : ℝ) ^ i / ↑(Nat.factorial i) := rfl
            -- Use the fact that the series converges to the exponential function
            rw [tsum_eq_sum (fun i _ => by
              have h₅₅₁ : i ≥ n + 1 → (n : ℝ) ^ i / ↑(Nat.factorial i) = 0 := by
                intro h₅₅₁
                have h₅₅₂ : i ≥ n + 1 := h₅₅₁
                have h₅₅₃ : (n : ℝ) ^ i / ↑(Nat.factorial i) = 0 := by
                  have h₅₅₄ : i ≥ n + 1 := h₅₅₂
                  have h₅₅₅ : (n : ℕ) < i := by omega
                  have h₅₅₆ : (n : ℝ) ^ i / ↑(Nat.factorial i) = 0 := by
                    have h₅₅₇ : (n : ℕ) < i := h₅₅₅
                    have h₅₅₈ : (n : ℝ) ^ i / ↑(Nat.factorial i) = 0 := by
                      have h₅₅₉ : (n : ℕ) < i := h₅₅₇
                      have h₅₅₁₀ : (n : ℕ) < i := h₅₅₉
                      have h₅₅₁₁ : (n : ℝ) ^ i / ↑(Nat.factorial i) = 0 := by
                        -- Prove that the term is zero when i > n
                        have h₅₅₁₂ : (n : ℕ) < i := h₅₅₁₀
                        have h₅₅₁₃ : (n : ℝ) ^ i / ↑(Nat.factorial i) = 0 := by
                          -- Prove that the term is zero when i > n
                          have h₅₅₁₄ : i > n := by omega
                          have h₅₅₁₅ : (n : ℝ) ^ i = 0 := by
                            have h₅₅₁₆ : i ≥ n + 1 := by omega
                            have h₅₅₁₇ : (n : ℕ) < i := by omega
                            have h₅₅₁₈ : (n : ℝ) ^ i = 0 := by
                              -- Prove that the term is zero when i > n
                              norm_cast
                              have h₅₅₁₉ : n < i := by omega
                              have h₅₅₂₀ : n ^ i = 0 := by
                                -- Prove that the term is zero when i > n
                                have h₅₅₂₁ : n < i := by omega
                                have h₅₅₂₂ : n ^ i = 0 := by
                                  -- Prove that the term is zero when i > n
                                  exact Nat.pow_eq_zero (by omega)
                                exact h₅₅₂₂
                              simp [h₅₅₂₀]
                            exact h₅₅₁₈
                          have h₅₅₁₉ : (n : ℝ) ^ i = 0 := h₅₅₁₅
                          have h₅₅₂₀ : (n : ℝ) ^ i / ↑(Nat.factorial i) = 0 := by
                            rw [h₅₅₁₉]
                            simp
                          exact h₅₅₂₀
                        exact h₅₅₁₃
                      exact h₅₅₁₁
                    exact h₅₅₈
                  exact h₅₅₆
                exact h₅₅₃
              exact by
                by_cases h₅₅₁ : i ≥ n + 1
                · have h₅₅₂ := h₅₅₁
                  have h₅₅₃ := h₅₅₅₁ h₅₅₁
                  simp_all
                · have h₅₅₂ : i < n + 1 := by omega
                  have h₅₅₃ : i ≤ n := by omega
                  have h₅₅₄ : i ≤ n := h₅₅₃
                  simp_all [Finset.mem_range]
                  <;> aesop
            )]
            <;> simp_all [Finset.sum_range_succ]
            <;> aesop
          have h₆ : ∑ i in Finset.Icc (0 : ℕ) n, ((n : ℝ) ^ i / Nat.factorial i : ℝ) = ∑ i in Finset.range (n + 1), ((n : ℝ) ^ i / Nat.factorial i : ℝ) := by
            have h₇ : ∑ i in Finset.Icc (0 : ℕ) n, ((n : ℝ) ^ i / Nat.factorial i : ℝ) = ∑ i in Finset.range (n + 1), ((n : ℝ) ^ i / Nat.factorial i : ℝ) := by
              apply Finset.sum_subset
              · intro x hx
                simp only [Finset.mem_Icc, Finset.mem_range] at hx ⊢
                omega
              · intro x hx hx'
                simp only [Finset.mem_Icc, Finset.mem_range] at hx hx'
                have h₈ : x ≤ n := by
                  by_contra h
                  have h₉ : x ≥ n + 1 := by omega
                  have h₁₀ : x ∈ Finset.Icc (0 : ℕ) n := by
                    simp_all [Finset.mem_Icc]
                    <;> omega
                  contradiction
                have h₉ : x < n + 1 := by omega
                simp_all [Finset.mem_Icc, Finset.mem_range]
                <;> omega
            rw [h₇]
          rw [h₆] at *
          have h₇ : Real.exp n = ∑ i in Finset.range (n + 1), ((n : ℝ) ^ i / Nat.factorial i : ℝ) := h₅
          have h₈ : ∑ i in Finset.range (n + 1), ((n : ℝ) ^ i / Nat.factorial i : ℝ) > (Real.exp n) / 2 := by
            have h₉ : (n : ℕ) ≥ 12 := by exact_mod_cast h₃
            have h₁₀ : ∑ i in Finset.range (n + 1), ((n : ℝ) ^ i / Nat.factorial i : ℝ) = Real.exp n := by
              linarith
            rw [h₁₀]
            have h₁₁ : Real.exp n > (Real.exp n) / 2 := by
              have h₁₂ : (Real.exp n : ℝ) > 0 := Real.exp_pos n
              linarith
            linarith
          linarith
        exact h₄
      <;> norm_num at *
    exact h₁
  intro n hn
  have h₁ : ∑ i in Finset.Icc (0 : ℕ) n, (n^i : ℝ)/(Nat.factorial i) > (Real.exp n)/2 := h_main n
  simpa using h₁