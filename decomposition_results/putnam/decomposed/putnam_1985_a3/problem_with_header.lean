import Mathlib

open Set Filter Topology Real

-- fun d ↦ exp d - 1
/--
Let $d$ be a real number. For each integer $m \geq 0$, define a sequence $\{a_m(j)\}$, $j=0,1,2,\dots$ by the condition
\begin{align*}
a_m(0) &= d/2^m, \\
a_m(j+1) &= (a_m(j))^2 + 2a_m(j), \qquad j \geq 0.
\end{align*}
Evaluate $\lim_{n \to \infty} a_n(n)$.
-/
theorem putnam_1985_a3
(d : ℝ)
(a : ℕ → ℕ → ℝ)
(ha0 : ∀ m : ℕ, a m 0 = d / 2 ^ m)
(ha : ∀ m : ℕ, ∀ j : ℕ, a m (j + 1) = (a m j) ^ 2 + 2 * a m j)
: Tendsto (fun n ↦ a n n) atTop (𝓝 (((fun d ↦ exp d - 1) : ℝ → ℝ ) d)) := by
  have h_main : ∀ m j : ℕ, a m j = (d / (2 : ℝ) ^ m + 1) ^ (2 ^ j : ℕ) - 1 := by
    intro m j
    have h₁ : ∀ j : ℕ, a m j + 1 = (d / (2 : ℝ) ^ m + 1) ^ (2 ^ j : ℕ) := by
      intro j
      induction j with
      | zero =>
        -- Base case: when j = 0
        have h₂ : a m 0 = d / (2 : ℝ) ^ m := by simpa using ha0 m
        norm_num [h₂, pow_zero, pow_one]
        <;> ring_nf
        <;> field_simp
        <;> ring_nf
      | succ j ih =>
        -- Inductive step: assume the statement holds for j, prove for j + 1
        have h₂ := ha m j
        have h₃ : a m (j + 1) = (a m j) ^ 2 + 2 * a m j := by simpa using ha m j
        have h₄ : a m (j + 1) + 1 = (a m j + 1) ^ 2 := by
          calc
            a m (j + 1) + 1 = (a m j) ^ 2 + 2 * a m j + 1 := by rw [h₃]
            _ = (a m j + 1) ^ 2 := by ring
            _ = (a m j + 1) ^ 2 := by ring
        calc
          a m (j + 1) + 1 = (a m j + 1) ^ 2 := by rw [h₄]
          _ = ((d / (2 : ℝ) ^ m + 1) ^ (2 ^ j : ℕ)) ^ 2 := by rw [ih]
          _ = (d / (2 : ℝ) ^ m + 1) ^ (2 ^ (j + 1) : ℕ) := by
            simp [pow_succ, pow_mul, mul_comm]
            <;> ring_nf
            <;> field_simp
            <;> ring_nf
            <;> simp_all [pow_succ, pow_mul, mul_comm]
            <;> ring_nf
            <;> field_simp
            <;> ring_nf
    have h₂ : a m j + 1 = (d / (2 : ℝ) ^ m + 1) ^ (2 ^ j : ℕ) := h₁ j
    have h₃ : a m j = (d / (2 : ℝ) ^ m + 1) ^ (2 ^ j : ℕ) - 1 := by
      linarith
    exact h₃
  
  have h_limit : Tendsto (fun n ↦ a n n) atTop (𝓝 (exp d - 1)) := by
    have h₁ : (fun n ↦ a n n) = (fun n ↦ (d / (2 : ℝ) ^ n + 1) ^ (2 ^ n : ℕ) - 1) := by
      funext n
      rw [h_main]
      <;> simp [h_main]
    rw [h₁]
    have h₂ : Tendsto (fun n ↦ (d / (2 : ℝ) ^ n + 1 : ℝ) ^ (2 ^ n : ℕ) - 1) atTop (𝓝 (exp d - 1)) := by
      -- Use the fact that the limit of (1 + d / 2^n)^(2^n) is exp(d)
      have h₃ : Tendsto (fun n ↦ (d / (2 : ℝ) ^ n + 1 : ℝ) ^ (2 ^ n : ℕ)) atTop (𝓝 (exp d)) := by
        -- Use the fact that the limit of (1 + d / 2^n)^(2^n) is exp(d)
        have h₄ : Tendsto (fun n : ℕ ↦ (d / (2 : ℝ) ^ n + 1 : ℝ) ^ (2 ^ n : ℕ)) atTop (𝓝 (exp d)) := by
          -- Use the fact that the limit of (1 + d / 2^n)^(2^n) is exp(d)
          have h₅ : Tendsto (fun n : ℕ ↦ (d / (2 : ℝ) ^ n + 1 : ℝ) ^ (2 ^ n : ℕ)) atTop (𝓝 (exp d)) := by
            -- Use the fact that the limit of (1 + d / 2^n)^(2^n) is exp(d)
            have h₆ : Tendsto (fun n : ℕ ↦ (d / (2 : ℝ) ^ n + 1 : ℝ) ^ (2 ^ n : ℕ)) atTop (𝓝 (exp d)) := by
              -- Use the fact that the limit of (1 + d / 2^n)^(2^n) is exp(d)
              have h₇ : Tendsto (fun n : ℕ ↦ (1 + d / (2 : ℝ) ^ n : ℝ)) atTop (𝓝 1) := by
                -- Prove that (1 + d / 2^n) tends to 1
                have h₈ : Tendsto (fun n : ℕ ↦ (d / (2 : ℝ) ^ n : ℝ)) atTop (𝓝 0) := by
                  -- Prove that d / 2^n tends to 0
                  have h₉ : Tendsto (fun n : ℕ ↦ (d / (2 : ℝ) ^ n : ℝ)) atTop (𝓝 0) := by
                    -- Prove that d / 2^n tends to 0
                    have h₁₀ : Tendsto (fun n : ℕ ↦ (d / (2 : ℝ) ^ n : ℝ)) atTop (𝓝 0) := by
                      -- Prove that d / 2^n tends to 0
                      have h₁₁ : Tendsto (fun n : ℕ ↦ (d : ℝ) / (2 : ℝ) ^ n) atTop (𝓝 0) := by
                        -- Prove that d / 2^n tends to 0
                        have h₁₂ : Tendsto (fun n : ℕ ↦ (2 : ℝ) ^ n) atTop atTop := by
                          -- Prove that 2^n tends to infinity
                          exact tendsto_pow_atTop_atTop_of_one_lt (by norm_num)
                        -- Use the fact that d / 2^n tends to 0
                        have h₁₃ : Tendsto (fun n : ℕ ↦ (d : ℝ) / (2 : ℝ) ^ n) atTop (𝓝 0) := by
                          -- Use the fact that d / 2^n tends to 0
                          have h₁₄ : Tendsto (fun n : ℕ ↦ (d : ℝ) / (2 : ℝ) ^ n) atTop (𝓝 0) := by
                            -- Use the fact that d / 2^n tends to 0
                            simpa [div_eq_mul_inv] using
                              tendsto_const_nhds.div_atTop h₁₂
                          exact h₁₄
                        exact h₁₃
                      exact h₁₁
                    exact h₁₀
                  exact h₉
                -- Prove that (1 + d / 2^n) tends to 1
                have h₁₀ : Tendsto (fun n : ℕ ↦ (1 + d / (2 : ℝ) ^ n : ℝ)) atTop (𝓝 1) := by
                  -- Prove that (1 + d / 2^n) tends to 1
                  have h₁₁ : Tendsto (fun n : ℕ ↦ (1 : ℝ)) atTop (𝓝 1) := by
                    -- Prove that 1 tends to 1
                    exact tendsto_const_nhds
                  have h₁₂ : Tendsto (fun n : ℕ ↦ (d / (2 : ℝ) ^ n : ℝ)) atTop (𝓝 0) := h₈
                  -- Prove that (1 + d / 2^n) tends to 1
                  have h₁₃ : Tendsto (fun n : ℕ ↦ (1 + d / (2 : ℝ) ^ n : ℝ)) atTop (𝓝 (1 + 0)) := by
                    -- Prove that (1 + d / 2^n) tends to 1
                    exact Tendsto.add h₁₁ h₁₂
                  -- Prove that (1 + d / 2^n) tends to 1
                  have h₁₄ : Tendsto (fun n : ℕ ↦ (1 + d / (2 : ℝ) ^ n : ℝ)) atTop (𝓝 1) := by
                    simpa using h₁₃
                  exact h₁₄
                exact h₁₀
              -- Prove that the limit of (1 + d / 2^n)^(2^n) is exp(d)
              have h₈ : Tendsto (fun n : ℕ ↦ ((1 + d / (2 : ℝ) ^ n : ℝ) ^ (2 ^ n : ℕ))) atTop (𝓝 (exp d)) := by
                -- Prove that the limit of (1 + d / 2^n)^(2^n) is exp(d)
                have h₉ : Tendsto (fun n : ℕ ↦ ((1 + d / (2 : ℝ) ^ n : ℝ) ^ (2 ^ n : ℕ))) atTop (𝓝 (exp d)) := by
                  -- Prove that the limit of (1 + d / 2^n)^(2^n) is exp(d)
                  have h₁₀ : Tendsto (fun n : ℕ ↦ (1 + d / (2 : ℝ) ^ n : ℝ)) atTop (𝓝 1) := h₇
                  have h₁₁ : Tendsto (fun n : ℕ ↦ ((1 + d / (2 : ℝ) ^ n : ℝ) ^ (2 ^ n : ℕ))) atTop (𝓝 (exp d)) := by
                    -- Prove that the limit of (1 + d / 2^n)^(2^n) is exp(d)
                    have h₁₂ : Tendsto (fun n : ℕ ↦ ((1 + d / (2 : ℝ) ^ n : ℝ) ^ (2 ^ n : ℕ))) atTop (𝓝 (exp d)) := by
                      -- Prove that the limit of (1 + d / 2^n)^(2^n) is exp(d)
                      have h₁₃ : Tendsto (fun n : ℕ ↦ ((1 + d / (2 : ℝ) ^ n : ℝ) ^ (2 ^ n : ℕ))) atTop (𝓝 (exp d)) := by
                        -- Prove that the limit of (1 + d / 2^n)^(2^n) is exp(d)
                        have h₁₄ : Tendsto (fun n : ℕ ↦ ((1 + d / (2 : ℝ) ^ n : ℝ) ^ (2 ^ n : ℕ))) atTop (𝓝 (exp d)) := by
                          -- Prove that the limit of (1 + d / 2^n)^(2^n) is exp(d)
                          convert tendsto_one_plus_div_pow_exp d using 1
                          <;> simp [add_comm]
                          <;> field_simp
                          <;> ring_nf
                          <;> simp_all [add_comm]
                          <;> field_simp
                          <;> ring_nf
                          <;> simp_all [add_comm]
                        exact h₁₄
                      exact h₁₃
                    exact h₁₂
                  exact h₁₁
                exact h₉
              -- Prove that the limit of (1 + d / 2^n)^(2^n) is exp(d)
              have h₉ : Tendsto (fun n : ℕ ↦ (d / (2 : ℝ) ^ n + 1 : ℝ) ^ (2 ^ n : ℕ)) atTop (𝓝 (exp d)) := by
                -- Prove that the limit of (1 + d / 2^n)^(2^n) is exp(d)
                have h₁₀ : Tendsto (fun n : ℕ ↦ (d / (2 : ℝ) ^ n + 1 : ℝ) ^ (2 ^ n : ℕ)) atTop (𝓝 (exp d)) := by
                  -- Prove that the limit of (1 + d / 2^n)^(2^n) is exp(d)
                  have h₁₁ : Tendsto (fun n : ℕ ↦ (d / (2 : ℝ) ^ n + 1 : ℝ) ^ (2 ^ n : ℕ)) atTop (𝓝 (exp d)) := by
                    -- Prove that the limit of (1 + d / 2^n)^(2^n) is exp(d)
                    have h₁₂ : Tendsto (fun n : ℕ ↦ (d / (2 : ℝ) ^ n + 1 : ℝ) ^ (2 ^ n : ℕ)) atTop (𝓝 (exp d)) := by
                      -- Prove that the limit of (1 + d / 2^n)^(2^n) is exp(d)
                      convert h₈ using 1
                      <;> simp [add_comm]
                      <;> field_simp
                      <;> ring_nf
                      <;> simp_all [add_comm]
                      <;> field_simp
                      <;> ring_nf
                      <;> simp_all [add_comm]
                    exact h₁₂
                  exact h₁₁
                exact h₁₀
              exact h₉
            exact h₆
          exact h₅
        exact h₄
      -- Use the fact that the limit of (1 + d / 2^n)^(2^n) is exp(d)
      have h₅ : Tendsto (fun n ↦ (d / (2 : ℝ) ^ n + 1 : ℝ) ^ (2 ^ n : ℕ) - 1) atTop (𝓝 (exp d - 1)) := by
        -- Use the fact that the limit of (1 + d / 2^n)^(2^n) is exp(d)
        have h₆ : Tendsto (fun n ↦ (d / (2 : ℝ) ^ n + 1 : ℝ) ^ (2 ^ n : ℕ)) atTop (𝓝 (exp d)) := h₃
        have h₇ : Tendsto (fun n ↦ (d / (2 : ℝ) ^ n + 1 : ℝ) ^ (2 ^ n : ℕ) - 1) atTop (𝓝 (exp d - 1)) := by
          -- Use the fact that the limit of (1 + d / 2^n)^(2^n) is exp(d)
          have h₈ : Tendsto (fun n ↦ (d / (2 : ℝ) ^ n + 1 : ℝ) ^ (2 ^ n : ℕ) - 1) atTop (𝓝 (exp d - 1)) := by
            -- Use the fact that the limit of (1 + d / 2^n)^(2^n) is exp(d)
            convert h₆.sub (tendsto_const_nhds : Tendsto (fun n : ℕ ↦ (1 : ℝ)) atTop (𝓝 1)) using 1
            <;> simp [sub_eq_add_neg]
            <;> ring_nf
            <;> simp_all [sub_eq_add_neg]
            <;> field_simp
            <;> ring_nf
            <;> simp_all [sub_eq_add_neg]
          exact h₈
        exact h₇
      exact h₅
    exact h₂
  
  simpa using h_limit