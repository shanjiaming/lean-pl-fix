theorem putnam_1969_a6
(x : ℕ → ℝ)
(y : ℕ → ℝ)
(hy1 : ∀ n ≥ 2, y n = x (n-1) + 2 * (x n))
(hy2 : ∃ c : ℝ, Tendsto y atTop (𝓝 c))
: ∃ C : ℝ, Tendsto x atTop (𝓝 C) := by
  have h_main : ∃ (C : ℝ), Tendsto x atTop (𝓝 C) := by
    obtain ⟨c, hc⟩ := hy2
    have h₁ : Tendsto x atTop (𝓝 (c / 3)) := by
      -- Define z_n = x_n - c / 3
      have h₂ : ∀ n ≥ 2, y n - c = (x (n - 1) - c / 3) + 2 * (x n - c / 3) := by
        intro n hn
        have h₃ : y n = x (n - 1) + 2 * x n := hy1 n hn
        rw [h₃]
        ring_nf
        <;>
        linarith
      -- Show that z_n → 0
      have h₃ : Tendsto (fun n => x n - c / 3) atTop (𝓝 0) := by
        -- Use the recurrence to show that z_n → 0
        have h₄ : Tendsto (fun n => y n - c) atTop (𝓝 0) := by
          simpa using hc.sub_const c
        -- Use the recurrence to show that z_n → 0
        have h₅ : ∀ n ≥ 2, x n - c / 3 = (-1 / 2 : ℝ) * (x (n - 1) - c / 3) + (y n - c) / 2 := by
          intro n hn
          have h₅₁ : y n - c = (x (n - 1) - c / 3) + 2 * (x n - c / 3) := h₂ n hn
          have h₅₂ : x n - c / 3 = (-1 / 2 : ℝ) * (x (n - 1) - c / 3) + (y n - c) / 2 := by
            linarith
          exact h₅₂
        -- Use the recurrence to show that z_n → 0
        have h₆ : Tendsto (fun n => x n - c / 3) atTop (𝓝 0) := by
          -- Use the recurrence to show that z_n → 0
          have h₇ : ∀ n ≥ 2, x n - c / 3 = (-1 / 2 : ℝ) ^ (n - 1 : ℕ) * (x 1 - c / 3) + ∑ k in Finset.Icc 2 n, (-1 / 2 : ℝ) ^ (n - k : ℕ) * ((y k - c) / 2 : ℝ) := by
            intro n hn
            have h₇₁ : ∀ n ≥ 2, x n - c / 3 = (-1 / 2 : ℝ) ^ (n - 1 : ℕ) * (x 1 - c / 3) + ∑ k in Finset.Icc 2 n, (-1 / 2 : ℝ) ^ (n - k : ℕ) * ((y k - c) / 2 : ℝ) := by
              intro n hn
              induction' hn with n hn IH
              · norm_num [Finset.sum_Icc_succ_top, Finset.sum_range_one, h₅]
                <;>
                simp_all [h₅]
                <;>
                ring_nf at *
                <;>
                linarith
              · cases n with
                | zero =>
                  contradiction
                | succ n =>
                  cases n with
                  | zero =>
                    norm_num [Finset.sum_Icc_succ_top, Finset.sum_range_one, h₅] at *
                    <;>
                    simp_all [h₅]
                    <;>
                    ring_nf at *
                    <;>
                    linarith
                  | succ n =>
                    simp_all [Finset.sum_Icc_succ_top, h₅, pow_add, mul_add, mul_comm]
                    <;>
                    ring_nf at *
                    <;>
                    field_simp at *
                    <;>
                    ring_nf at *
                    <;>
                    nlinarith
            exact h₇₁ n hn
          have h₈ : Tendsto (fun n => x n - c / 3) atTop (𝓝 0) := by
            have h₉ : Tendsto (fun n => (-1 / 2 : ℝ) ^ (n - 1 : ℕ) * (x 1 - c / 3)) atTop (𝓝 0) := by
              have h₁₀ : Tendsto (fun n : ℕ => (-1 / 2 : ℝ) ^ (n - 1 : ℕ) * (x 1 - c / 3)) atTop (𝓝 0) := by
                have h₁₁ : Tendsto (fun n : ℕ => (-1 / 2 : ℝ) ^ (n - 1 : ℕ)) atTop (𝓝 0) := by
                  have h₁₂ : Tendsto (fun n : ℕ => ((-1 / 2 : ℝ) : ℝ) ^ n) atTop (𝓝 0) := by
                    apply tendsto_pow_atTop_nhds_0_of_lt_1
                    · norm_num
                    · norm_num
                  have h₁₃ : Tendsto (fun n : ℕ => (-1 / 2 : ℝ) ^ (n - 1 : ℕ)) atTop (𝓝 0) := by
                    convert h₁₂.comp (tendsto_add_atTop_nat 1) using 1 with n
                    <;> simp [pow_succ, mul_assoc]
                    <;> ring_nf
                    <;> field_simp
                    <;> ring_nf
                  exact h₁₃
                have h₁₄ : Tendsto (fun n : ℕ => (-1 / 2 : ℝ) ^ (n - 1 : ℕ) * (x 1 - c / 3)) atTop (𝓝 0) := by
                  have h₁₅ : Tendsto (fun n : ℕ => (-1 / 2 : ℝ) ^ (n - 1 : ℕ)) atTop (𝓝 0) := h₁₁
                  have h₁₆ : Tendsto (fun n : ℕ => (x 1 - c / 3 : ℝ)) atTop (𝓝 (x 1 - c / 3)) := by
                    apply tendsto_const_nhds
                  have h₁₇ : Tendsto (fun n : ℕ => (-1 / 2 : ℝ) ^ (n - 1 : ℕ) * (x 1 - c / 3)) atTop (𝓝 (0 * (x 1 - c / 3))) := by
                    exact h₁₅.mul h₁₆
                  simpa using h₁₇
                exact h₁₄
              exact h₁₀
            have h₁₀ : Tendsto (fun n => ∑ k in Finset.Icc 2 n, (-1 / 2 : ℝ) ^ (n - k : ℕ) * ((y k - c) / 2 : ℝ)) atTop (𝓝 0) := by
              have h₁₁ : Tendsto (fun n => y n - c) atTop (𝓝 0) := h₄
              have h₁₂ : Tendsto (fun n => ∑ k in Finset.Icc 2 n, (-1 / 2 : ℝ) ^ (n - k : ℕ) * ((y k - c) / 2 : ℝ)) atTop (𝓝 0) := by
                -- Use the fact that y_n - c → 0 to show that the sum tends to 0
                have h₁₃ : ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |∑ k in Finset.Icc 2 n, (-1 / 2 : ℝ) ^ (n - k : ℕ) * ((y k - c) / 2 : ℝ)| < ε := by
                  intro ε εpos
                  have h₁₄ : ∃ N : ℕ, ∀ n ≥ N, |y n - c| < ε := by
                    have h₁₅ : Tendsto (fun n => y n - c) atTop (𝓝 0) := h₄
                    have h₁₆ : ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |y n - c| < ε := by
                      rw [Metric.tendsto_atTop] at h₁₅
                      intro ε εpos
                      obtain ⟨N, hN⟩ := h₁₅ ε εpos
                      exact ⟨N, fun n hn => by simpa using hN n hn⟩
                    exact h₁₆ ε εpos
                  obtain ⟨N, hN⟩ := h₁₄
                  use N + 2
                  intro n hn
                  have h₁₇ : n ≥ N + 2 := by linarith
                  have h₁₈ : ∀ k ∈ Finset.Icc 2 n, |(-1 / 2 : ℝ) ^ (n - k : ℕ) * ((y k - c) / 2 : ℝ)| ≤ (1 / 2 : ℝ) ^ (n - k : ℕ) * (ε / 2) := by
                    intro k hk
                    have h₁₉ : k ≥ 2 := by
                      simp only [Finset.mem_Icc] at hk
                      linarith
                    have h₂₀ : k ≤ n := by
                      simp only [Finset.mem_Icc] at hk
                      linarith
                    have h₂₁ : |y k - c| < ε := hN k (by
                      have h₂₂ : k ≥ N := by
                        have h₂₃ : k ≥ 2 := h₁₉
                        have h₂₄ : N + 2 ≤ n := h₁₇
                        have h₂₅ : k ≤ n := h₂₀
                        omega
                      linarith)
                    have h₂₂ : |(-1 / 2 : ℝ) ^ (n - k : ℕ) * ((y k - c) / 2 : ℝ)| = (1 / 2 : ℝ) ^ (n - k : ℕ) * |(y k - c) / 2| := by
                      have h₂₃ : |(-1 / 2 : ℝ) ^ (n - k : ℕ)| = (1 / 2 : ℝ) ^ (n - k : ℕ) := by
                        simp [abs_mul, abs_pow, abs_div, abs_of_nonneg, abs_of_nonpos, pow_nonneg, show (0 : ℝ) ≤ 1 / 2 by norm_num]
                        <;>
                        cases' Nat.even_or_odd (n - k) with h h <;> simp_all [Nat.even_iff, Nat.odd_iff, pow_add, pow_one, mul_assoc]
                        <;>
                        norm_num <;>
                        linarith
                      calc
                        |(-1 / 2 : ℝ) ^ (n - k : ℕ) * ((y k - c) / 2 : ℝ)| = |(-1 / 2 : ℝ) ^ (n - k : ℕ)| * |(y k - c) / 2| := by
                          simp [abs_mul]
                        _ = (1 / 2 : ℝ) ^ (n - k : ℕ) * |(y k - c) / 2| := by rw [h₂₃]
                    have h₂₃ : |(y k - c) / 2| < ε / 2 := by
                      have h₂₄ : |y k - c| < ε := h₂₁
                      have h₂₅ : |(y k - c) / 2| = |y k - c| / 2 := by
                        simp [abs_div, abs_of_nonneg, abs_of_nonpos, show (0 : ℝ) ≤ 2 by norm_num]
                      rw [h₂₅]
                      linarith
                    calc
                      |(-1 / 2 : ℝ) ^ (n - k : ℕ) * ((y k - c) / 2 : ℝ)| = (1 / 2 : ℝ) ^ (n - k : ℕ) * |(y k - c) / 2| := by rw [h₂₂]
                      _ ≤ (1 / 2 : ℝ) ^ (n - k : ℕ) * (ε / 2) := by
                        gcongr
                        <;>
                        linarith
                  have h₂₄ : |∑ k in Finset.Icc 2 n, (-1 / 2 : ℝ) ^ (n - k : ℕ) * ((y k - c) / 2 : ℝ)| ≤ ∑ k in Finset.Icc 2 n, (1 / 2 : ℝ) ^ (n - k : ℕ) * (ε / 2) := by
                    calc
                      |∑ k in Finset.Icc 2 n, (-1 / 2 : ℝ) ^ (n - k : ℕ) * ((y k - c) / 2 : ℝ)| ≤ ∑ k in Finset.Icc 2 n, |(-1 / 2 : ℝ) ^ (n - k : ℕ) * ((y k - c) / 2 : ℝ)| := by
                        exact Finset.abs_sum_le_sum_abs _ _
                      _ ≤ ∑ k in Finset.Icc 2 n, (1 / 2 : ℝ) ^ (n - k : ℕ) * (ε / 2) := by
                        exact Finset.sum_le_sum h₁₈
                  have h₂₅ : ∑ k in Finset.Icc 2 n, (1 / 2 : ℝ) ^ (n - k : ℕ) * (ε / 2) = (∑ k in Finset.Icc 2 n, (1 / 2 : ℝ) ^ (n - k : ℕ)) * (ε / 2) := by
                    calc
                      ∑ k in Finset.Icc 2 n, (1 / 2 : ℝ) ^ (n - k : ℕ) * (ε / 2) = ∑ k in Finset.Icc 2 n, ((1 / 2 : ℝ) ^ (n - k : ℕ) * (ε / 2)) := by rfl
                      _ = (∑ k in Finset.Icc 2 n, (1 / 2 : ℝ) ^ (n - k : ℕ)) * (ε / 2) := by
                        simp [Finset.sum_mul]
                        <;>
                        ring_nf
                        <;>
                        field_simp
                        <;>
                        ring_nf
                  have h₂₆ : ∑ k in Finset.Icc 2 n, (1 / 2 : ℝ) ^ (n - k : ℕ) ≤ 2 := by
                    calc
                      ∑ k in Finset.Icc 2 n, (1 / 2 : ℝ) ^ (n - k : ℕ) ≤ ∑ k in Finset.Icc 2 n, (1 / 2 : ℝ) ^ 0 := by
                        apply Finset.sum_le_sum
                        intro i hi
                        have h₂₇ : i ∈ Finset.Icc 2 n := hi
                        have h₂₈ : 2 ≤ i := by
                          simp only [Finset.mem_Icc] at h₂₇
                          linarith
                        have h₂₉ : i ≤ n := by
                          simp only [Finset.mem_Icc] at h₂₇
                          linarith
                        have h₃₀ : (n - i : ℕ) ≥ 0 := by omega
                        have h₃₁ : (1 / 2 : ℝ) ^ (n - i : ℕ) ≤ (1 / 2 : ℝ) ^ 0 := by
                          apply pow_le_pow_of_le_one
                          · norm_num
                          · norm_num
                          · omega
                        simpa using h₃₁
                      _ = ∑ k in Finset.Icc 2 n, (1 : ℝ) := by
                        simp
                      _ ≤ ∑ k in Finset.Icc 2 n, 1 := by simp
                      _ = (n - 1 : ℕ) := by
                        simp [Finset.sum_Icc_succ_top]
                        <;>
                        cases n <;> simp_all [Finset.sum_range_succ, Nat.cast_add, Nat.cast_one, Nat.cast_zero, Nat.cast_succ]
                        <;>
                        ring_nf at *
                        <;>
                        norm_num at *
                        <;>
                        linarith
                      _ ≤ 2 := by
                        have h₃₂ : n ≥ N + 2 := h₁₇
                        have h₃₃ : (n : ℕ) ≥ N + 2 := by exact_mod_cast h₃₂
                        have h₃₄ : (n - 1 : ℕ) ≤ n := by omega
                        have h₃₅ : (n - 1 : ℕ) ≥ 0 := by omega
                        have h₃₆ : (n - 1 : ℕ) ≤ n := by omega
                        have h₃₇ : (n - 1 : ℕ) ≥ 0 := by omega
                        have h₃₈ : (n - 1 : ℕ) ≤ n := by omega
                        have h₃₉ : (n - 1 : ℕ) ≥ 0 := by omega
                        norm_num at *
                        <;>
                        ring_nf at *
                        <;>
                        norm_num at *
                        <;>
                        omega
                  have h₂₇ : (∑ k in Finset.Icc 2 n, (1 / 2 : ℝ) ^ (n - k : ℕ)) * (ε / 2) ≤ 2 * (ε / 2) := by
                    have h₂₈ : ∑ k in Finset.Icc 2 n, (1 / 2 : ℝ) ^ (n - k : ℕ) ≤ 2 := h₂₆
                    have h₂₉ : (∑ k in Finset.Icc 2 n, (1 / 2 : ℝ) ^ (n - k : ℕ)) * (ε / 2) ≤ 2 * (ε / 2) := by
                      have h₃₀ : 0 ≤ ε / 2 := by linarith
                      have h₃₁ : 0 ≤ ∑ k in Finset.Icc 2 n, (1 / 2 : ℝ) ^ (n - k : ℕ) := by
                        apply Finset.sum_nonneg
                        intro i hi
                        exact pow_nonneg (by norm_num) _
                      nlinarith
                    exact h₂₉
                  have h₂₈ : |∑ k in Finset.Icc 2 n, (-1 / 2 : ℝ) ^ (n - k : ℕ) * ((y k - c) / 2 : ℝ)| ≤ 2 * (ε / 2) := by
                    calc
                      |∑ k in Finset.Icc 2 n, (-1 / 2 : ℝ) ^ (n - k : ℕ) * ((y k - c) / 2 : ℝ)| ≤ ∑ k in Finset.Icc 2 n, (1 / 2 : ℝ) ^ (n - k : ℕ) * (ε / 2) := h₂₄
                      _ = (∑ k in Finset.Icc 2 n, (1 / 2 : ℝ) ^ (n - k : ℕ)) * (ε / 2) := by rw [h₂₅]
                      _ ≤ 2 * (ε / 2) := h₂₇
                  have h₂₉ : 2 * (ε / 2) = ε := by ring
                  have h₃₀ : |∑ k in Finset.Icc 2 n, (-1 / 2 : ℝ) ^ (n - k : ℕ) * ((y k - c) / 2 : ℝ)| < ε := by
                    linarith
                  exact h₃₀
                exact h₁₃
              have h₁₄ : Tendsto (fun n => ∑ k in Finset.Icc 2 n, (-1 / 2 : ℝ) ^ (n - k : ℕ) * ((y k - c) / 2 : ℝ)) atTop (𝓝 0) := by
                have h₁₅ : ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |∑ k in Finset.Icc 2 n, (-1 / 2 : ℝ) ^ (n - k : ℕ) * ((y k - c) / 2 : ℝ)| < ε := h₁₃
                have h₁₆ : Tendsto (fun n => ∑ k in Finset.Icc 2 n, (-1 / 2 : ℝ) ^ (n - k : ℕ) * ((y k - c) / 2 : ℝ)) atTop (𝓝 0) := by
                  rw [Metric.tendsto_atTop]
                  intro ε εpos
                  obtain ⟨N, hN⟩ := h₁₅ ε εpos
                  refine' ⟨N, fun n hn => _⟩
                  have h₁₇ : |∑ k in Finset.Icc 2 n, (-1 / 2 : ℝ) ^ (n - k : ℕ) * ((y k - c) / 2 : ℝ)| < ε := hN n hn
                  simpa using h₁₇
                exact h₁₆
              exact h₁₄
            have h₁₁ : Tendsto (fun n => x n - c / 3) atTop (𝓝 0) := by
              have h₁₂ : ∀ n ≥ 2, x n - c / 3 = (-1 / 2 : ℝ) ^ (n - 1 : ℕ) * (x 1 - c / 3) + ∑ k in Finset.Icc 2 n, (-1 / 2 : ℝ) ^ (n - k : ℕ) * ((y k - c) / 2 : ℝ) := h₇
              have h₁₃ : Tendsto (fun n => x n - c / 3) atTop (𝓝 0) := by
                have h₁₄ : Tendsto (fun n => (-1 / 2 : ℝ) ^ (n - 1 : ℕ) * (x 1 - c / 3)) atTop (𝓝 0) := h₉
                have h₁₅ : Tendsto (fun n => ∑ k in Finset.Icc 2 n, (-1 / 2 : ℝ) ^ (n - k : ℕ) * ((y k - c) / 2 : ℝ)) atTop (𝓝 0) := h₁₀
                have h₁₆ : Tendsto (fun n => x n - c / 3) atTop (𝓝 0) := by
                  have h₁₇ : Tendsto (fun n => (-1 / 2 : ℝ) ^ (n - 1 : ℕ) * (x 1 - c / 3) + ∑ k in Finset.Icc 2 n, (-1 / 2 : ℝ) ^ (n - k : ℕ) * ((y k - c) / 2 : ℝ)) atTop (𝓝 (0 + 0)) := by
                    exact Tendsto.add h₁₄ h₁₅
                  have h₁₈ : Tendsto (fun n => (-1 / 2 : ℝ) ^ (n - 1 : ℕ) * (x 1 - c / 3) + ∑ k in Finset.Icc 2 n, (-1 / 2 : ℝ) ^ (n - k : ℕ) * ((y k - c) / 2 : ℝ)) atTop (𝓝 0) := by
                    simpa using h₁₇
                  have h₁₉ : ∀ n ≥ 2, x n - c / 3 = (-1 / 2 : ℝ) ^ (n - 1 : ℕ) * (x 1 - c / 3) + ∑ k in Finset.Icc 2 n, (-1 / 2 : ℝ) ^ (n - k : ℕ) * ((y k - c) / 2 : ℝ) := h₇
                  have h₂₀ : Tendsto (fun n => x n - c / 3) atTop (𝓝 0) := by
                    have h₂₁ : ∀ n ≥ 2, x n - c / 3 = (-1 / 2 : ℝ) ^ (n - 1 : ℕ) * (x 1 - c / 3) + ∑ k in Finset.Icc 2 n, (-1 / 2 : ℝ) ^ (n - k : ℕ) * ((y k - c) / 2 : ℝ) := h₇
                    have h₂₂ : Tendsto (fun n => x n - c / 3) atTop (𝓝 0) := by
                      -- Use the fact that the sum tends to 0 and the first term tends to 0
                      have h₂₃ : Tendsto (fun n => x n - c / 3) atTop (𝓝 0) := by
                        -- Use the fact that the sum tends to 0 and the first term tends to 0
                        have h₂₄ : ∀ n ≥ 2, x n - c / 3 = (-1 / 2 : ℝ) ^ (n - 1 : ℕ) * (x 1 - c / 3) + ∑ k in Finset.Icc 2 n, (-1 / 2 : ℝ) ^ (n - k : ℕ) * ((y k - c) / 2 : ℝ) := h₇
                        have h₂₅ : Tendsto (fun n => x n - c / 3) atTop (𝓝 0) := by
                          -- Use the fact that the sum tends to 0 and the first term tends to 0
                          have h₂₆ : Tendsto (fun n => x n - c / 3) atTop (𝓝 0) := by
                            -- Use the fact that the sum tends to 0 and the first term tends to 0
                            convert h₁₈ using 1
                            · ext n
                              by_cases hn : n ≥ 2
                              · rw [h₁₂ n hn]
                              · have hn' : n = 0 ∨ n = 1 := by
                                  omega
                                cases hn' with
                                | inl hn' =>
                                  subst hn'
                                  norm_num [Finset.sum_Icc_succ_top, Finset.sum_range_one, h₅] at *
                                  <;>
                                  simp_all [h₅]
                                  <;>
                                  ring_nf at *
                                  <;>
                                  linarith
                                | inr hn' =>
                                  subst hn'
                                  norm_num [Finset.sum_Icc_succ_top, Finset.sum_range_one, h₅] at *
                                  <;>
                                  simp_all [h₅]
                                  <;>
                                  ring_nf at *
                                  <;>
                                  linarith
                          exact h₂₆
                        exact h₂₅
                      exact h₂₃
                    exact h₂₂
                  exact h₂₀
                exact h₁₆
              exact h₁₃
            exact h₁₁
          exact h₆
        have h₄ : Tendsto x atTop (𝓝 (c / 3)) := by
          have h₅ : Tendsto (fun n => x n - c / 3) atTop (𝓝 0) := h₃
          have h₆ : Tendsto (fun n => x n - c / 3 + c / 3) atTop (𝓝 (0 + c / 3)) := by
            apply Tendsto.add h₅
            apply tendsto_const_nhds
          have h₇ : Tendsto (fun n => x n - c / 3 + c / 3) atTop (𝓝 (c / 3)) := by
            simpa using h₆
          have h₈ : Tendsto x atTop (𝓝 (c / 3)) := by
            convert h₇ using 1
            <;> ext n
            <;> ring
          exact h₈
        exact h₄
      exact ⟨c / 3, h₁⟩
    exact h_main
  <;> simp_all