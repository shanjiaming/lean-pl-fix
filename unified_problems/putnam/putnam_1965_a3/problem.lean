theorem putnam_1965_a3
(a : ℕ → ℝ)
(α : ℂ)
: Tendsto (fun n : ℕ => (∑ k in Finset.Icc 1 n, exp (I * a k))/n) atTop (𝓝 α) ↔
Tendsto (fun n : ℕ => (∑ k in Finset.Icc 1 (n^2), exp (I * a k))/n^2) atTop (𝓝 α) := by
  have h_imp : Tendsto (fun n : ℕ => (∑ k in Finset.Icc 1 n, exp (I * a k)) / n) atTop (𝓝 α) → Tendsto (fun n : ℕ => (∑ k in Finset.Icc 1 (n^2), exp (I * a k)) / n^2) atTop (𝓝 α) := by
    intro h
    have h₁ : Tendsto (fun n : ℕ => (∑ k in Finset.Icc 1 (n^2), exp (I * a k)) / n^2 : ℕ → ℂ) atTop (𝓝 α) := by
      have h₂ : Tendsto (fun n : ℕ => (∑ k in Finset.Icc 1 n, exp (I * a k)) / n : ℕ → ℂ) atTop (𝓝 α) := h
      have h₃ : Tendsto (fun n : ℕ => (n : ℕ)^2 : ℕ → ℕ) atTop atTop := by
        exact tendsto_pow_atTop_atTop_of_one_lt (by norm_num)
      have h₄ : Tendsto (fun n : ℕ => (∑ k in Finset.Icc 1 ((n : ℕ)^2), exp (I * a k)) / (n : ℕ)^2 : ℕ → ℂ) atTop (𝓝 α) := by
        have h₅ : Tendsto (fun n : ℕ => (∑ k in Finset.Icc 1 n, exp (I * a k)) / n : ℕ → ℂ) atTop (𝓝 α) := h₂
        have h₆ : Tendsto (fun n : ℕ => (∑ k in Finset.Icc 1 ((n : ℕ)^2), exp (I * a k)) / (n : ℕ)^2 : ℕ → ℂ) atTop (𝓝 α) := by
          have h₇ : (fun n : ℕ => (∑ k in Finset.Icc 1 ((n : ℕ)^2), exp (I * a k)) / (n : ℕ)^2 : ℕ → ℂ) = (fun n : ℕ => (∑ k in Finset.Icc 1 n, exp (I * a k)) / n : ℕ → ℂ) ∘ (fun n : ℕ => (n : ℕ)^2) := by
            funext n
            <;> simp [Finset.sum_Icc_succ_top, pow_two, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero]
            <;> field_simp [Nat.cast_ne_zero, pow_two, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero]
            <;> ring_nf
          rw [h₇]
          have h₈ : Tendsto (fun n : ℕ => (n : ℕ)^2) atTop atTop := h₃
          exact Tendsto.comp h₅ h₈
        exact h₆
      simpa using h₄
    exact h₁
  have h_converse : Tendsto (fun n : ℕ => (∑ k in Finset.Icc 1 (n^2), exp (I * a k)) / n^2) atTop (𝓝 α) → Tendsto (fun n : ℕ => (∑ k in Finset.Icc 1 n, exp (I * a k)) / n) atTop (𝓝 α) := by
    intro h
    have h₁ : Tendsto (fun n : ℕ => (∑ k in Finset.Icc 1 n, exp (I * a k)) / n : ℕ → ℂ) atTop (𝓝 α) := by
      have h₂ : Tendsto (fun n : ℕ => (∑ k in Finset.Icc 1 (n^2), exp (I * a k)) / n^2 : ℕ → ℂ) atTop (𝓝 α) := h
      have h₃ : Tendsto (fun n : ℕ => (∑ k in Finset.Icc 1 n, exp (I * a k)) / n : ℕ → ℂ) atTop (𝓝 α) := by
        -- Define a helper function to work with floor(sqrt(n))
        have h₄ : ∀ n : ℕ, ∃ m : ℕ, m^2 ≤ n ∧ n < (m + 1)^2 := by
          intro n
          use Nat.sqrt n
          have h₅ : (Nat.sqrt n : ℕ)^2 ≤ n := Nat.sqrt_le' n
          have h₆ : n < (Nat.sqrt n + 1 : ℕ)^2 := Nat.lt_succ_sqrt' n
          exact ⟨h₅, h₆⟩
        -- Use the helper function to split the sum
        have h₅ : Tendsto (fun n : ℕ => (∑ k in Finset.Icc 1 n, exp (I * a k)) / n : ℕ → ℂ) atTop (𝓝 α) := by
          -- Use the given condition to bound the sum
          have h₆ : ∀ ε : ℝ, 0 < ε → (∃ N : ℕ, ∀ n : ℕ, N ≤ n → ‖(∑ k in Finset.Icc 1 n, exp (I * a k)) / n - α‖ < ε) := by
            intro ε εpos
            have h₇ : Tendsto (fun n : ℕ => (∑ k in Finset.Icc 1 (n ^ 2), exp (I * a k)) / n ^ 2 : ℕ → ℂ) atTop (𝓝 α) := h₂
            have h₈ : ∀ ε : ℝ, 0 < ε → (∃ N : ℕ, ∀ n : ℕ, N ≤ n → ‖(∑ k in Finset.Icc 1 (n ^ 2), exp (I * a k)) / n ^ 2 - α‖ < ε) := by
              intro ε εpos
              have h₉ := Metric.tendsto_atTop.mp h₇ ε εpos
              obtain ⟨N, hN⟩ := h₉
              use N
              intro n hn
              apply hN
              <;> simp_all [Nat.cast_le]
              <;> nlinarith
            obtain ⟨N₁, hN₁⟩ := h₈ (ε / 2) (by linarith)
            use 4 * N₁ ^ 2 + 1
            intro n hn
            -- Use the definition of the limit to bound the sum
            have h₉ : ∃ m : ℕ, m ^ 2 ≤ n ∧ n < (m + 1) ^ 2 := h₄ n
            obtain ⟨m, hm₁, hm₂⟩ := h₉
            have h₁₀ : ‖(∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) / (m ^ 2 : ℂ) - α‖ < ε / 2 := by
              have h₁₁ : N₁ ≤ m := by
                by_contra h₁₁
                have h₁₂ : m < N₁ := by linarith
                have h₁₃ : (m : ℕ) ^ 2 < N₁ ^ 2 := by
                  have h₁₄ : (m : ℕ) < N₁ := by assumption
                  have h₁₅ : (m : ℕ) ^ 2 < N₁ ^ 2 := by
                    nlinarith
                  exact h₁₅
                have h₁₆ : 4 * N₁ ^ 2 + 1 ≤ n := by
                  nlinarith
                nlinarith
              have h₁₁' : N₁ ≤ m := h₁₀
              have h₁₂ := hN₁ m h₁₁'
              simp_all [Nat.cast_le]
              <;> norm_num at *
              <;> linarith
            have h₁₁ : ‖(∑ k in Finset.Icc 1 n, exp (I * a k)) / n - α‖ < ε := by
              have h₁₂ : ‖(∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) / (m ^ 2 : ℂ) - α‖ < ε / 2 := h₁₀
              have h₁₃ : ‖(∑ k in Finset.Icc 1 n, exp (I * a k)) / n - α‖ < ε := by
                -- Use the triangle inequality to bound the sum
                calc
                  ‖(∑ k in Finset.Icc 1 n, exp (I * a k)) / n - α‖ ≤ ‖(∑ k in Finset.Icc 1 n, exp (I * a k)) / n - (∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) / (m ^ 2 : ℂ)‖ + ‖(∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) / (m ^ 2 : ℂ) - α‖ := by
                    -- Use the triangle inequality to bound the sum
                    exact?
                  _ ≤ ‖(∑ k in Finset.Icc 1 n, exp (I * a k)) / n - (∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) / (m ^ 2 : ℂ)‖ + ε / 2 := by
                    -- Use the fact that the sum is bounded by ε/2
                    linarith
                  _ < ε := by
                    -- Use the fact that the sum is bounded by ε/2
                    have h₁₄ : ‖(∑ k in Finset.Icc 1 n, exp (I * a k)) / n - (∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) / (m ^ 2 : ℂ)‖ < ε / 2 := by
                      -- Use the fact that the sum is bounded by ε/2
                      have h₁₅ : (∑ k in Finset.Icc 1 n, exp (I * a k)) = (∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) + (∑ k in Finset.Icc (m ^ 2 + 1) n, exp (I * a k)) := by
                        have h₁₆ : (∑ k in Finset.Icc 1 n, exp (I * a k)) = (∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) + (∑ k in Finset.Icc (m ^ 2 + 1) n, exp (I * a k)) := by
                          have h₁₇ : m ^ 2 ≤ n := hm₁
                          have h₁₈ : n < (m + 1) ^ 2 := hm₂
                          have h₁₉ : ∑ k in Finset.Icc 1 n, exp (I * a k) = ∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k) + ∑ k in Finset.Icc (m ^ 2 + 1) n, exp (I * a k) := by
                            have h₂₀ : ∑ k in Finset.Icc 1 n, exp (I * a k) = ∑ k in Finset.Icc 1 (m ^ 2) ∪ Finset.Icc (m ^ 2 + 1) n, exp (I * a k) := by
                              have h₂₁ : Finset.Icc 1 (m ^ 2) ∪ Finset.Icc (m ^ 2 + 1) n = Finset.Icc 1 n := by
                                have h₂₂ : m ^ 2 ≤ n := hm₁
                                have h₂₃ : n < (m + 1) ^ 2 := hm₂
                                have h₂₄ : m ^ 2 + 1 ≤ n + 1 := by
                                  nlinarith
                                have h₂₅ : Finset.Icc 1 (m ^ 2) ∪ Finset.Icc (m ^ 2 + 1) n = Finset.Icc 1 n := by
                                  apply Finset.ext
                                  intro x
                                  simp [Finset.mem_union, Finset.mem_Icc]
                                  <;>
                                  by_cases h₂₆ : x ≤ m ^ 2 <;>
                                  by_cases h₂₇ : x ≤ n <;>
                                  by_cases h₂₈ : x ≥ m ^ 2 + 1 <;>
                                  by_cases h₂₉ : x ≥ 1 <;>
                                  simp_all [Nat.lt_succ_iff, Nat.le_of_lt_succ, Nat.succ_le_iff] <;>
                                  omega
                                exact h₂₅
                              rw [h₂₁]
                              <;> simp [Finset.sum_union]
                              <;>
                              (try omega) <;>
                              (try nlinarith) <;>
                              (try ring_nf at * <;> simp_all [Finset.sum_range_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow])
                            rw [h₂₀]
                            <;>
                            simp [Finset.sum_union]
                            <;>
                            (try omega) <;>
                            (try nlinarith) <;>
                            (try ring_nf at * <;> simp_all [Finset.sum_range_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow])
                          exact h₁₉
                        exact h₁₇
                      exact h₁₆
                      <;>
                      simp_all [Finset.sum_Icc_succ_top, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow]
                      <;>
                      (try omega) <;>
                      (try nlinarith) <;>
                      (try ring_nf at * <;> simp_all [Finset.sum_range_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow])
                    calc
                      ‖(∑ k in Finset.Icc 1 n, exp (I * a k)) / n - (∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) / (m ^ 2 : ℂ)‖ = ‖(∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) / n + (∑ k in Finset.Icc (m ^ 2 + 1) n, exp (I * a k)) / n - (∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) / (m ^ 2 : ℂ)‖ := by
                        field_simp [h₁₅]
                        <;> ring_nf
                        <;> simp_all [Complex.abs, Complex.normSq, Real.sqrt_lt, pow_two]
                        <;>
                        (try omega)
                        <;>
                        (try nlinarith)
                        <;>
                        (try ring_nf at * <;> simp_all [Finset.sum_range_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow])
                      _ = ‖(∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) / n + (∑ k in Finset.Icc (m ^ 2 + 1) n, exp (I * a k)) / n - (∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) / (m ^ 2 : ℂ)‖ := by rfl
                      _ = ‖((∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) / n - (∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) / (m ^ 2 : ℂ)) + (∑ k in Finset.Icc (m ^ 2 + 1) n, exp (I * a k)) / n‖ := by
                        ring_nf at *
                        <;> simp_all [Complex.abs, Complex.normSq, Real.sqrt_lt, pow_two]
                        <;>
                        (try omega)
                        <;>
                        (try nlinarith)
                        <;>
                        (try ring_nf at * <;> simp_all [Finset.sum_range_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow])
                      _ ≤ ‖(∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) / n - (∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) / (m ^ 2 : ℂ)‖ + ‖(∑ k in Finset.Icc (m ^ 2 + 1) n, exp (I * a k)) / n‖ := by
                        exact norm_add_le _ _
                      _ < ε / 2 := by
                        -- Use the fact that the sum is bounded by ε/2
                        have h₂₀ : ‖(∑ k in Finset.Icc (m ^ 2 + 1) n, exp (I * a k)) / n‖ ≤ 3 / m := by
                          have h₂₁ : ‖(∑ k in Finset.Icc (m ^ 2 + 1) n, exp (I * a k))‖ ≤ (n - (m ^ 2 + 1) + 1 : ℕ):= by
                            calc
                              ‖(∑ k in Finset.Icc (m ^ 2 + 1) n, exp (I * a k))‖ ≤ ∑ k in Finset.Icc (m ^ 2 + 1) n, ‖exp (I * a k)‖ := by
                                exact norm_sum_le _ _
                              _ = ∑ k in Finset.Icc (m ^ 2 + 1) n, (1 : ℝ) := by
                                simp [Complex.abs_exp, Complex.norm_eq_abs, Complex.abs_ofReal, Real.norm_eq_abs]
                              _ = (n - (m ^ 2 + 1) + 1 : ℕ) := by
                                simp_all [Finset.sum_Icc_succ_top, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow]
                                <;>
                                (try omega) <;>
                                (try nlinarith) <;>
                                (try ring_nf at * <;> simp_all [Finset.sum_range_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow])
                          calc
                            ‖(∑ k in Finset.Icc (m ^ 2 + 1) n, exp (I * a k)) / n‖ = ‖(∑ k in Finset.Icc (m ^ 2 + 1) n, exp (I * a k))‖ / n := by
                              simp [norm_div, Nat.cast_ne_zero]
                            _ ≤ ((n - (m ^ 2 + 1) + 1 : ℕ) : ℝ) / n := by
                              gcongr
                              <;> simp_all [Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow]
                              <;>
                              (try omega) <;>
                              (try nlinarith) <;>
                              (try ring_nf at * <;> simp_all [Finset.sum_range_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow])
                            _ ≤ 3 / m := by
                              have h₂₂ : (m : ℝ) ≥ 1 := by
                                have h₂₃ : m ≥ 1 := by
                                  by_contra h₂₄
                                  have h₂₅ : m = 0 := by
                                    omega
                                  simp_all [h₂₅, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow]
                                  <;>
                                  (try omega)
                                  <;>
                                  (try nlinarith)
                                  <;>
                                  (try ring_nf at * <;> simp_all [Finset.sum_range_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow])
                                exact_mod_cast h₂₃
                              have h₂₃ : (n : ℝ) ≥ m ^ 2 := by
                                exact_mod_cast hm₁
                              have h₂₄ : (n : ℝ) < (m + 1) ^ 2 := by
                                exact_mod_cast hm₂
                              have h₂₅ : (n : ℝ) - (m ^ 2 + 1 : ℝ) + 1 ≤ (n : ℝ):= by
                                nlinarith
                              have h₂₆ : (n : ℝ) - (m ^ 2 + 1 : ℝ) + 1 ≥ 0 := by
                                nlinarith
                              have h₂₇ : ((n - (m ^ 2 + 1) + 1 : ℕ) : ℝ) / n ≤ 1 := by
                                by_cases h₂₈ : (n : ℝ) = 0
                                · simp_all [Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow]
                                  <;>
                                  (try omega) <;>
                                  (try nlinarith) <;>
                                  (try ring_nf at * <;> simp_all [Finset.sum_range_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow])
                                · have h₂₉ : 0 < (n : ℝ) := by positivity
                                  have h₃₀ : ((n - (m ^ 2 + 1) + 1 : ℕ) : ℝ) / n ≤ 1 := by
                                    rw [div_le_iff h₂₉]
                                    have h₃₁ : ((n - (m ^ 2 + 1) + 1 : ℕ) : ℝ) ≤ n := by
                                      norm_cast
                                      <;>
                                      omega
                                    nlinarith
                                  exact h₃₀
                              have h₂₈ : (3 : ℝ) / m ≥ 1 := by
                                have h₂₉ : (m : ℝ) ≤ 3 := by
                                  nlinarith
                                have h₃₀ : (3 : ℝ) / m ≥ 1 := by
                                  have h₃₁ : (m : ℝ) ≤ 3 := h₂₉
                                  have h₃₂ : (3 : ℝ) / m ≥ 1 := by
                                    by_cases h₃₃ : (m : ℝ) = 0
                                    · simp_all [Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow]
                                      <;>
                                      (try omega) <;>
                                      (try nlinarith) <;>
                                      (try ring_nf at * <;> simp_all [Finset.sum_range_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow])
                                    · have h₃₄ : 0 < (m : ℝ) := by positivity
                                      field_simp [h₃₃]
                                      rw [le_div_iff (by positivity)]
                                      nlinarith
                                  exact h₃₂
                                exact h₃₀
                              have h₂₉ : ((n - (m ^ 2 + 1) + 1 : ℕ) : ℝ) / n ≤ 3 / m := by
                                have h₃₀ : ((n - (m ^ 2 + 1) + 1 : ℕ) : ℝ) / n ≤ 1 := by
                                  by_cases h₃₁ : (n : ℝ) = 0
                                  · simp_all [Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow]
                                    <;>
                                    (try omega) <;>
                                    (try nlinarith) <;>
                                    (try ring_nf at * <;> simp_all [Finset.sum_range_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow])
                                  · have h₃₂ : 0 < (n : ℝ) := by positivity
                                    have h₃₃ : ((n - (m ^ 2 + 1) + 1 : ℕ) : ℝ) / n ≤ 1 := by
                                      rw [div_le_iff h₃₂]
                                      have h₃₄ : ((n - (m ^ 2 + 1) + 1 : ℕ) : ℝ) ≤ n := by
                                        norm_cast
                                        <;>
                                        omega
                                      nlinarith
                                    exact h₃₃
                                have h₃₀ : (3 : ℝ) / m ≥ 1 := h₂₈
                                nlinarith
                              exact h₂₉
                        have h₂₁ : ‖(∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) / n - (∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) / (m ^ 2 : ℂ)‖ < ε / 2 := by
                          have h₂₂ : ‖(∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) / n - (∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) / (m ^ 2 : ℂ)‖ < ε / 2 := by
                            calc
                              ‖(∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) / n - (∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) / (m ^ 2 : ℂ)‖ = ‖(∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) * (1 / n - 1 / (m ^ 2 : ℂ))‖ := by
                                ring_nf
                                <;> simp [Complex.abs, Complex.normSq, Real.sqrt_lt, pow_two]
                                <;>
                                (try omega) <;>
                                (try nlinarith) <;>
                                (try ring_nf at * <;> simp_all [Finset.sum_range_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow])
                              _ = ‖(∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k))‖ * ‖(1 / n - 1 / (m ^ 2 : ℂ))‖ := by
                                simp [Complex.abs, Complex.normSq, Real.sqrt_lt, pow_two, Complex.norm_eq_abs]
                                <;>
                                ring_nf
                                <;>
                                (try omega) <;>
                                (try nlinarith) <;>
                                (try ring_nf at * <;> simp_all [Finset.sum_range_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow])
                              _ ≤ ‖(∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k))‖ * ‖(1 / n - 1 / (m ^ 2 : ℂ))‖ := by rfl
                              _ < ε / 2 := by
                                have h₂₃ : ‖(∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k))‖ ≤ (m ^ 2 : ℕ) := by
                                  calc
                                    ‖(∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k))‖ ≤ ∑ k in Finset.Icc 1 (m ^ 2), ‖exp (I * a k)‖ := by
                                      exact norm_sum_le _ _
                                    _ = ∑ k in Finset.Icc 1 (m ^ 2), (1 : ℝ) := by
                                      simp [Complex.abs_exp, Complex.norm_eq_abs, Complex.abs_ofReal, Real.norm_eq_abs]
                                    _ = (m ^ 2 : ℕ) := by
                                      simp_all [Finset.sum_Icc_succ_top, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow]
                                      <;>
                                      (try omega) <;>
                                      (try nlinarith) <;>
                                      (try ring_nf at * <;> simp_all [Finset.sum_range_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow])
                                have h₂₄ : ‖(1 / n - 1 / (m ^ 2 : ℂ))‖ < ε / 2 / (m ^ 2 : ℝ) := by
                                  have h₂₅ : ‖(1 / n - 1 / (m ^ 2 : ℂ))‖ = ‖(1 / (n : ℂ) - 1 / (m ^ 2 : ℂ))‖ := by simp [Complex.abs, Complex.normSq, Real.sqrt_lt, pow_two]
                                  rw [h₂₅]
                                  have h₂₆ : ‖(1 / (n : ℂ) - 1 / (m ^ 2 : ℂ))‖ < ε / 2 / (m ^ 2 : ℝ) := by
                                    by_cases h₂₇ : (m : ℝ) = 0
                                    · simp_all [Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow]
                                      <;>
                                      (try omega) <;>
                                      (try nlinarith) <;>
                                      (try ring_nf at * <;> simp_all [Finset.sum_range_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow])
                                    · have h₂₈ : 0 < (m : ℝ) := by positivity
                                      have h₂₉ : 0 < (m ^ 2 : ℝ) := by positivity
                                      have h₃₀ : (n : ℝ) ≥ m ^ 2 := by
                                        exact_mod_cast hm₁
                                      have h₃₁ : (n : ℝ) < (m + 1) ^ 2 := by
                                        exact_mod_cast hm₂
                                      have h₃₂ : ‖(1 / (n : ℂ) - 1 / (m ^ 2 : ℂ))‖ < ε / 2 / (m ^ 2 : ℝ) := by
                                        calc
                                          ‖(1 / (n : ℂ) - 1 / (m ^ 2 : ℂ))‖ = ‖(1 / (n : ℂ)) - (1 : ℂ) / (m ^ 2 : ℂ)‖ := by simp [Complex.abs, Complex.normSq, Real.sqrt_lt, pow_two]
                                          _ = ‖(1 / (n : ℂ)) - (1 : ℂ) / (m ^ 2 : ℂ)‖ := by rfl
                                          _ ≤ ‖(1 / (n : ℂ))‖ + ‖(1 : ℂ) / (m ^ 2 : ℂ)‖ := by
                                            exact?
                                          _ = 1 / (n : ℝ) + 1 / (m ^ 2 : ℝ) := by
                                            simp [Complex.abs, Complex.normSq, Real.sqrt_lt, pow_two, Complex.norm_eq_abs]
                                            <;> field_simp [Nat.cast_ne_zero, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow]
                                            <;>
                                            (try ring_nf) <;>
                                            (try norm_num) <;>
                                            (try linarith)
                                          _ < ε / 2 / (m ^ 2 : ℝ) := by
                                            have h₃₃ : (1 : ℝ) / (n : ℝ) < ε / 2 / (m ^ 2 : ℝ) / 2 := by
                                              have h₃₄ : (n : ℝ) ≥ m ^ 2 := by
                                                exact_mod_cast hm₁
                                              have h₃₅ : (n : ℝ) < (m + 1) ^ 2 := by
                                                exact_mod_cast hm₂
                                              have h₃₆ : 0 < (n : ℝ) := by positivity
                                              have h₃₇ : 0 < (m : ℝ) := by positivity
                                              have h₃₈ : 0 < (m ^ 2 : ℝ) := by positivity
                                              have h₃₉ : (m : ℝ) ≥ 1 := by
                                                by_contra h₃₉
                                                have h₄₀ : (m : ℝ) < 1 := by linarith
                                                have h₄₁ : m = 0 := by
                                                  by_contra h₄₁
                                                  have h₄₂ : m ≥ 1 := by
                                                    omega
                                                  have h₄₃ : (m : ℝ) ≥ 1 := by exact_mod_cast h₄₂
                                                  linarith
                                                simp_all [h₄₁, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow]
                                                <;>
                                                (try omega) <;>
                                                (try nlinarith) <;>
                                                (try ring_nf at * <;> simp_all [Finset.sum_range_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow])
                                              have h₄₀ : ε / 2 / (m ^ 2 : ℝ) > 0 := by positivity
                                              have h₄₁ : (1 : ℝ) / (n : ℝ) < ε / 2 / (m ^ 2 : ℝ) / 2 := by
                                                have h₄₂ : (1 : ℝ) / (n : ℝ) ≤ 1 / (m ^ 2 : ℝ) := by
                                                  have h₄₃ : (n : ℝ) ≥ m ^ 2 := by
                                                    exact_mod_cast hm₁
                                                  have h₄₄ : 0 < (n : ℝ) := by positivity
                                                  have h₄₅ : 0 < (m ^ 2 : ℝ) := by positivity
                                                  rw [div_le_div_iff (by positivity) (by positivity)]
                                                  nlinarith
                                                have h₄₆ : ε / 2 / (m ^ 2 : ℝ) / 2 > 1 / (m ^ 2 : ℝ) := by
                                                  have h₄₇ : ε / 2 / (m ^ 2 : ℝ) > 2 * (1 / (m ^ 2 : ℝ)) := by
                                                    have h₄₈ : ε > 0 := by linarith
                                                    have h₄₉ : (m : ℝ) ≥ 1 := by
                                                      by_contra h₄₉
                                                      have h₅₀ : (m : ℝ) < 1 := by linarith
                                                      have h₅₁ : m = 0 := by
                                                        by_contra h₅₁
                                                        have h₅₂ : m ≥ 1 := by
                                                          omega
                                                        have h₅₃ : (m : ℝ) ≥ 1 := by exact_mod_cast h₅₂
                                                        linarith
                                                      simp_all [h₅₁, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow]
                                                      <;>
                                                      (try omega) <;>
                                                      (try nlinarith) <;>
                                                      (try ring_nf at * <;> simp_all [Finset.sum_range_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow])
                                                    have h₅₀ : ε / 2 / (m ^ 2 : ℝ) > 2 * (1 / (m ^ 2 : ℝ)) := by
                                                      have h₅₁ : ε / 2 / (m ^ 2 : ℝ) = ε / (2 * (m ^ 2 : ℝ)) := by
                                                        field_simp
                                                        <;>
                                                        ring_nf
                                                      rw [h₅₁]
                                                      have h₅₂ : 2 * (1 / (m ^ 2 : ℝ)) = 2 / (m ^ 2 : ℝ) := by
                                                        field_simp
                                                      rw [h₅₂]
                                                      have h₅₃ : ε / (2 * (m ^ 2 : ℝ)) > 2 / (m ^ 2 : ℝ) := by
                                                        have h₅₄ : ε > 4 := by linarith
                                                        have h₅₅ : (m : ℝ) ≥ 1 := by
                                                          by_contra h₅₅
                                                          have h₅₆ : (m : ℝ) < 1 := by linarith
                                                          have h₅₇ : m = 0 := by
                                                            by_contra h₅₇
                                                            have h₅₈ : m ≥ 1 := by
                                                              omega
                                                            have h₅₉ : (m : ℝ) ≥ 1 := by exact_mod_cast h₅₈
                                                            linarith
                                                          simp_all [h₅₇, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow]
                                                          <;>
                                                          (try omega) <;>
                                                          (try nlinarith) <;>
                                                          (try ring_nf at * <;> simp_all [Finset.sum_range_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow])
                                                        have h₅₆ : ε / (2 * (m ^ 2 : ℝ)) > 2 / (m ^ 2 : ℝ) := by
                                                          have h₅₇ : ε > 4 := by linarith
                                                          have h₅₈ : (m : ℝ) ≥ 1 := by
                                                            by_contra h₅₈
                                                            have h₅₉ : (m : ℝ) < 1 := by linarith
                                                            have h₆₀ : m = 0 := by
                                                              by_contra h₆₀
                                                              have h₆₁ : m ≥ 1 := by
                                                                omega
                                                              have h₆₂ : (m : ℝ) ≥ 1 := by exact_mod_cast h₆₁
                                                              linarith
                                                            simp_all [h₆₀, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow]
                                                            <;>
                                                            (try omega) <;>
                                                            (try nlinarith) <;>
                                                            (try ring_nf at * <;> simp_all [Finset.sum_range_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow])
                                                          calc
                                                            ε / (2 * (m ^ 2 : ℝ)) > 4 / (2 * (m ^ 2 : ℝ)) := by gcongr
                                                            _ = 2 / (m ^ 2 : ℝ) := by
                                                              field_simp [h₂₇]
                                                              <;> ring_nf
                                                              <;> field_simp [h₂₇]
                                                              <;> ring_nf
                                                        exact h₅₆
                                                      exact h₅₃
                                                    exact h₅₀
                                                  linarith
                                                linarith
                                              linarith
                                            have h₃₄ : (1 : ℝ) / (m ^ 2 : ℝ) < ε / 2 / (m ^ 2 : ℝ) := by
                                              have h₃₅ : (m : ℝ) ≥ 1 := by
                                                by_contra h₃₅
                                                have h₃₆ : (m : ℝ) < 1 := by linarith
                                                have h₃₇ : m = 0 := by
                                                  by_contra h₃₇
                                                  have h₃₈ : m ≥ 1 := by
                                                    omega
                                                  have h₃₉ : (m : ℝ) ≥ 1 := by exact_mod_cast h₃₈
                                                  linarith
                                                simp_all [h₃₇, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow]
                                                <;>
                                                (try omega) <;>
                                                (try nlinarith) <;>
                                                (try ring_nf at * <;> simp_all [Finset.sum_range_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow])
                                              have h₃₅ : ε / 2 / (m ^ 2 : ℝ) > 1 / (m ^ 2 : ℝ) := by
                                                have h₃₆ : ε / 2 / (m ^ 2 : ℝ) = ε / (2 * (m ^ 2 : ℝ)) := by
                                                  field_simp
                                                  <;>
                                                  ring_nf
                                                rw [h₃₆]
                                                have h₃₇ : 1 / (m ^ 2 : ℝ) = 1 / (m ^ 2 : ℝ) := by rfl
                                                rw [h₃₇]
                                                have h₃₈ : ε / (2 * (m ^ 2 : ℝ)) > 1 / (m ^ 2 : ℝ) := by
                                                  have h₃₉ : ε > 2 := by linarith
                                                  have h₄₀ : (m : ℝ) ≥ 1 := by
                                                    by_contra h₄₀
                                                    have h₄₁ : (m : ℝ) < 1 := by linarith
                                                    have h₄₂ : m = 0 := by
                                                      by_contra h₄₂
                                                      have h₄₃ : m ≥ 1 := by
                                                        omega
                                                      have h₄₄ : (m : ℝ) ≥ 1 := by exact_mod_cast h₄₃
                                                      linarith
                                                    simp_all [h₄₂, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow]
                                                    <;>
                                                    (try omega) <;>
                                                    (try nlinarith) <;>
                                                    (try ring_nf at * <;> simp_all [Finset.sum_range_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow])
                                                  have h₄₁ : ε / (2 * (m ^ 2 : ℝ)) > 1 / (m ^ 2 : ℝ) := by
                                                    have h₄₂ : ε > 2 := by linarith
                                                    calc
                                                      ε / (2 * (m ^ 2 : ℝ)) > 2 / (2 * (m ^ 2 : ℝ)) := by gcongr
                                                      _ = 1 / (m ^ 2 : ℝ) := by
                                                        field_simp [h₂₇]
                                                        <;> ring_nf
                                                        <;> field_simp [h₂₇]
                                                        <;> ring_nf
                                                    <;> linarith
                                                  exact h₄₁
                                                exact h₃₈
                                              linarith
                                            have h₃₅ : 1 / (n : ℝ) + 1 / (m ^ 2 : ℝ) < ε / 2 / (m ^ 2 : ℝ) := by
                                              linarith
                                            simpa [Complex.abs, Complex.normSq, Real.sqrt_lt, pow_two, Complex.norm_eq_abs] using h₃₅
                                          <;>
                                          simp_all [Complex.abs, Complex.normSq, Real.sqrt_lt, pow_two, Complex.norm_eq_abs]
                                          <;>
                                          norm_num
                                          <;>
                                          linarith
                                      exact h₃₂
                                  exact h₂₆
                                calc
                                  ‖(∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k))‖ * ‖(1 / n - 1 / (m ^ 2 : ℂ))‖ ≤ (m ^ 2 : ℕ) * (ε / 2 / (m ^ 2 : ℝ)) := by
                                    gcongr
                                    <;>
                                    simp_all [Complex.abs, Complex.normSq, Real.sqrt_lt, pow_two, Complex.norm_eq_abs]
                                    <;>
                                    (try ring_nf) <;>
                                    (try norm_num) <;>
                                    (try linarith)
                                  _ = (m ^ 2 : ℝ) * (ε / 2 / (m ^ 2 : ℝ)) := by
                                    simp [Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow]
                                  _ = ε / 2 := by
                                    by_cases h₃₆ : (m : ℝ) = 0
                                    · simp_all [Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow]
                                      <;>
                                      (try omega) <;>
                                      (try nlinarith) <;>
                                      (try ring_nf at * <;> simp_all [Finset.sum_range_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow])
                                    · have h₃₇ : 0 < (m : ℝ) := by positivity
                                      have h₃₈ : 0 < (m ^ 2 : ℝ) := by positivity
                                      field_simp [h₃₆]
                                      <;> ring_nf
                                      <;> field_simp [h₃₆]
                                      <;> ring_nf
                                  _ < ε / 2 := by linarith
                              <;> linarith
                            <;>
                            linarith
                          exact h₂₂
                        have h₂₂ : ‖(∑ k in Finset.Icc (m ^ 2 + 1) n, exp (I * a k)) / n‖ ≤ 3 / m := h₂₀
                        have h₂₃ : ‖(∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) / n - (∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) / (m ^ 2 : ℂ)‖ < ε / 2 := h₂₁
                        have h₂₄ : ‖(∑ k in Finset.Icc 1 n, exp (I * a k)) / n - α‖ < ε := by
                          calc
                            ‖(∑ k in Finset.Icc 1 n, exp (I * a k)) / n - α‖ ≤ ‖(∑ k in Finset.Icc 1 n, exp (I * a k)) / n - (∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) / (m ^ 2 : ℂ)‖ + ‖(∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) / (m ^ 2 : ℂ) - α‖ := by
                              exact?
                            _ ≤ ‖(∑ k in Finset.Icc 1 n, exp (I * a k)) / n - (∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) / (m ^ 2 : ℂ)‖ + ‖(∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) / (m ^ 2 : ℂ) - α‖ := by rfl
                            _ < ε / 2 + ε / 2 := by
                              have h₂₅ : ‖(∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) / (m ^ 2 : ℂ) - α‖ < ε / 2 := by
                                exact?
                              have h₂₆ : ‖(∑ k in Finset.Icc 1 n, exp (I * a k)) / n - (∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) / (m ^ 2 : ℂ)‖ < ε / 2 := by
                                have h₂₇ : (∑ k in Finset.Icc 1 n, exp (I * a k)) = (∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) + (∑ k in Finset.Icc (m ^ 2 + 1) n, exp (I * a k)) := by
                                  have h₂₈ : m ^ 2 ≤ n := hm₁
                                  have h₂₉ : n < (m + 1) ^ 2 := hm₂
                                  have h₃₀ : ∑ k in Finset.Icc 1 n, exp (I * a k) = ∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k) + ∑ k in Finset.Icc (m ^ 2 + 1) n, exp (I * a k) := by
                                    have h₃₁ : ∑ k in Finset.Icc 1 n, exp (I * a k) = ∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k) + ∑ k in Finset.Icc (m ^ 2 + 1) n, exp (I * a k) := by
                                      have h₃₂ : Finset.Icc 1 n = Finset.Icc 1 (m ^ 2) ∪ Finset.Icc (m ^ 2 + 1) n := by
                                        have h₃₃ : m ^ 2 ≤ n := hm₁
                                        have h₃₄ : n < (m + 1) ^ 2 := hm₂
                                        have h₃₅ : Finset.Icc 1 n = Finset.Icc 1 (m ^ 2) ∪ Finset.Icc (m ^ 2 + 1) n := by
                                          apply Finset.ext
                                          intro x
                                          simp [Finset.mem_Icc, hm₁, hm₂]
                                          <;>
                                          by_cases h₃₆ : x ≤ m ^ 2 <;>
                                          by_cases h₃₇ : x ≤ n <;>
                                          by_cases h₃₈ : x ≥ m ^ 2 + 1 <;>
                                          by_cases h₃₉ : x ≥ 1 <;>
                                          simp_all [Nat.le_of_lt_succ, Nat.succ_le_iff, Nat.lt_succ_self]
                                          <;>
                                          (try omega)
                                          <;>
                                          (try nlinarith)
                                          <;>
                                          (try ring_nf at * <;> simp_all [Finset.sum_range_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow])
                                        exact h₃₅
                                      rw [h₃₂]
                                      rw [Finset.sum_union]
                                      <;>
                                      simp_all [Finset.disjoint_left, Finset.mem_Icc, hm₁, hm₂]
                                      <;>
                                      omega
                                    exact h₃₁
                                  exact h₃₀
                                rw [h₂₇]
                                calc
                                  ‖((∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) + ∑ k in Finset.Icc (m ^ 2 + 1) n, exp (I * a k)) / n - (∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) / (m ^ 2 : ℂ)‖ = ‖(∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) / n + (∑ k in Finset.Icc (m ^ 2 + 1) n, exp (I * a k)) / n - (∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) / (m ^ 2 : ℂ)‖ := by
                                    field_simp [add_comm]
                                    <;> ring_nf
                                    <;> simp_all [Complex.abs, Complex.normSq, Real.sqrt_lt, pow_two, Complex.norm_eq_abs]
                                    <;>
                                    (try omega)
                                    <;>
                                    (try nlinarith)
                                    <;>
                                    (try ring_nf at * <;> simp_all [Finset.sum_range_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow])
                                  _ = ‖((∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) / n - (∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) / (m ^ 2 : ℂ)) + (∑ k in Finset.Icc (m ^ 2 + 1) n, exp (I * a k)) / n‖ := by
                                    ring_nf
                                    <;> simp_all [Complex.abs, Complex.normSq, Real.sqrt_lt, pow_two, Complex.norm_eq_abs]
                                    <;>
                                    (try omega)
                                    <;>
                                    (try nlinarith)
                                    <;>
                                    (try ring_nf at * <;> simp_all [Finset.sum_range_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow])
                                  _ ≤ ‖(∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) / n - (∑ k in Finset.Icc 1 (m ^ 2), exp (I * a k)) / (m ^ 2 : ℂ)‖ + ‖(∑ k in Finset.Icc (m ^ 2 + 1) n, exp (I * a k)) / n‖ := by
                                    exact?
                                  _ < ε / 2 + 3 / m := by
                                    linarith
                                  _ ≤ ε / 2 + ε / 2 := by
                                    have h₃₁ : (m : ℝ) ≥ 1 := by
                                      by_contra h₃₁
                                      have h₃₂ : (m : ℝ) < 1 := by linarith
                                      have h₃₃ : m = 0 := by
                                        by_contra h₃₃
                                        have h₃₄ : m ≥ 1 := by omega
                                        have h₃₅ : (m : ℝ) ≥ 1 := by exact_mod_cast h₃₄
                                        linarith
                                      simp_all [h₃₃, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow]
                                      <;>
                                      (try omega) <;>
                                      (try nlinarith) <;>
                                      (try ring_nf at * <;> simp_all [Finset.sum_range_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_pow])
                                    have h₃₂ : (3 : ℝ) / m ≤ ε / 2 := by
                                      have h₃₃ : (m : ℝ) ≥ 1 := h₃₁
                                      have h₃₄ : (3 : ℝ) / m ≤ ε / 2 := by
                                        have h₃₅ : ε > 0 := by linarith
                                        have h₃₆ : (m : ℝ) ^ 2 ≥ 1 := by nlinarith
                                        have h₃₇ : (3 : ℝ) / m ≤ ε / 2 := by
                                          have h₃₈ : (m : ℝ) ≥ 1 := h₃₁
                                          have h₃₉ : (3 : ℝ) / m ≤ 3 := by
                                            rw [div_le_iff (by positivity)]
                                            nlinarith
                                          have h₄₀ : ε > 6 := by linarith
                                          have h₄₁ : (3 : ℝ) / m ≤ ε / 2 := by
                                            have h₄₂ : (m : ℝ) ≥ 1 := h₃₁
                                            have h₄₃ : (3 : ℝ) / m ≤ 3 := by
                                              rw [div_le_iff (by positivity)]
                                              nlinarith
                                            nlinarith
                                          exact h₄₁
                                        exact h₃₇
                                      exact h₃₄
                                    linarith
                                  _ ≤ ε / 2 + ε / 2 := by linarith
                              linarith
                            _ = ε := by linarith
                        have h₂₅ : ‖(∑ k in Finset.Icc 1 n, exp (I * a k)) / n - α‖ < ε := h₂₄
                        exact h₂₅
                    exact h₁₄
                  <;> simp_all [Complex.abs, Complex.normSq, Real.sqrt_lt, pow_two, Complex.norm_eq_abs]
                  <;>
                  norm_num at *
                  <;>
                  linarith
                <;>
                omega
              <;>
              linarith
            <;>
            linarith
          <;>
          omega
        <;>
        linarith
      <;>
      omega
    exact h₃
  have h_main : Tendsto (fun n : ℕ => (∑ k in Finset.Icc 1 n, exp (I * a k))/n) atTop (𝓝 α) ↔ Tendsto (fun n : ℕ => (∑ k in Finset.Icc 1 (n^2), exp (I * a k))/n^2) atTop (𝓝 α) := by
    constructor
    · intro h
      exact h_imp h
    · intro h
      exact h_converse h
  exact h_main