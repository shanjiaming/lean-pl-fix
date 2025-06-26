import Mathlib

open Filter Topology Nat

-- True
/--
Is $\sqrt{2}$ the limit of a sequence of numbers of the form $\sqrt[3]{n}-\sqrt[3]{m}$ ($n,m=0,1,2,\dots$)?
-/
theorem putnam_1990_a2
  (numform : ℝ → Prop)
  (hnumform : ∀ x : ℝ, numform x ↔ ∃ n m : ℕ, x = n ^ ((1 : ℝ) / 3) - m ^ ((1 : ℝ) / 3)) :
  ((True) : Prop ) ↔
  (∃ s : ℕ → ℝ,
    (∀ i : ℕ, numform (s i)) ∧
    Tendsto s atTop (𝓝 (Real.sqrt 2))) := by
  have h_main : ∃ (s : ℕ → ℝ), (∀ i : ℕ, numform (s i)) ∧ Tendsto s atTop (𝓝 (Real.sqrt 2)) := by
    use fun k => (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ)
    constructor
    · -- Prove that each term in the sequence is of the form n^(1/3) - m^(1/3)
      intro k
      rw [hnumform]
      refine' ⟨⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊, k ^ 3, _⟩
      -- Simplify the expression to match the form n^(1/3) - m^(1/3)
      have h₁ : (k : ℝ) = ((k : ℕ) ^ 3 : ℝ) ^ ((1 : ℝ) / 3) := by
        rw [← Real.rpow_nat_cast]
        rw [← Real.rpow_mul] <;> ring_nf <;> field_simp <;>
          simp [Nat.cast_nonneg]
        <;> norm_num
        <;> linarith
      rw [h₁]
      <;> simp [sub_eq_add_neg]
      <;> ring_nf
      <;> field_simp
      <;> simp [Nat.cast_nonneg]
      <;> ring_nf
      <;> field_simp
      <;> simp [Nat.cast_nonneg]
    · -- Prove that the sequence tends to √2
      have h₁ : Tendsto (fun k : ℕ => (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ)) atTop (𝓝 (Real.sqrt 2)) := by
        have h₂ : Tendsto (fun k : ℕ => (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ)) atTop (𝓝 (Real.sqrt 2)) := by
          have h₃ : Tendsto (fun k : ℕ => (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ)) atTop (𝓝 (Real.sqrt 2)) := by
            -- Use the fact that the floor function is within 1 of its argument
            have h₄ : ∀ k : ℕ, (Real.sqrt 2 + k : ℝ) ^ 3 - 1 < (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) := by
              intro k
              exact Nat.sub_one_lt_floor _
            have h₅ : ∀ k : ℕ, (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ≤ (Real.sqrt 2 + k : ℝ) ^ 3 := by
              intro k
              exact Nat.floor_le (by
                positivity
                <;>
                positivity
                <;>
                positivity
              )
            have h₆ : ∀ k : ℕ, ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) < (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) := by
              intro k
              have h₇ : (Real.sqrt 2 + k : ℝ) ^ 3 - 1 < (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) := h₄ k
              have h₈ : 0 < (Real.sqrt 2 + k : ℝ) ^ 3 - 1 := by
                have h₉ : (Real.sqrt 2 + k : ℝ) ^ 3 ≥ 1 := by
                  have h₁₀ : (Real.sqrt 2 + k : ℝ) ≥ 1 := by
                    have h₁₁ : (k : ℝ) ≥ 0 := by positivity
                    have h₁₂ : Real.sqrt 2 ≥ 0 := Real.sqrt_nonneg 2
                    nlinarith [Real.sqrt_nonneg 2, Real.sq_sqrt (show 0 ≤ 2 by norm_num)]
                  have h₁₃ : (Real.sqrt 2 + k : ℝ) ^ 3 ≥ 1 := by
                    have h₁₄ : (Real.sqrt 2 + k : ℝ) ≥ 1 := h₁₀
                    have h₁₅ : (Real.sqrt 2 + k : ℝ) ^ 3 ≥ 1 := by
                      calc
                        (Real.sqrt 2 + k : ℝ) ^ 3 ≥ 1 ^ 3 := by gcongr <;> nlinarith [Real.sqrt_nonneg 2, Real.sq_sqrt (show 0 ≤ 2 by norm_num)]
                        _ = 1 := by norm_num
                    exact h₁₅
                  exact h₁₃
                nlinarith
              have h₉ : 0 < (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) := by
                have h₁₀ : (Real.sqrt 2 + k : ℝ) ^ 3 - 1 < (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) := h₄ k
                have h₁₁ : 0 < (Real.sqrt 2 + k : ℝ) ^ 3 - 1 := by
                  have h₁₂ : (Real.sqrt 2 + k : ℝ) ^ 3 ≥ 1 := by
                    have h₁₃ : (Real.sqrt 2 + k : ℝ) ≥ 1 := by
                      have h₁₄ : (k : ℝ) ≥ 0 := by positivity
                      have h₁₅ : Real.sqrt 2 ≥ 0 := Real.sqrt_nonneg 2
                      nlinarith [Real.sqrt_nonneg 2, Real.sq_sqrt (show 0 ≤ 2 by norm_num)]
                    have h₁₆ : (Real.sqrt 2 + k : ℝ) ^ 3 ≥ 1 := by
                      have h₁₇ : (Real.sqrt 2 + k : ℝ) ≥ 1 := h₁₃
                      have h₁₈ : (Real.sqrt 2 + k : ℝ) ^ 3 ≥ 1 := by
                        calc
                          (Real.sqrt 2 + k : ℝ) ^ 3 ≥ 1 ^ 3 := by gcongr <;> nlinarith [Real.sqrt_nonneg 2, Real.sq_sqrt (show 0 ≤ 2 by norm_num)]
                          _ = 1 := by norm_num
                      exact h₁₈
                    exact h₁₆
                  nlinarith
                nlinarith
              have h₁₀ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) < (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) := by
                -- Use the fact that the floor function is within 1 of its argument
                have h₁₁ : (Real.sqrt 2 + k : ℝ) ^ 3 - 1 < (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) := h₄ k
                have h₁₂ : 0 < (Real.sqrt 2 + k : ℝ) ^ 3 - 1 := by
                  have h₁₃ : (Real.sqrt 2 + k : ℝ) ^ 3 ≥ 1 := by
                    have h₁₄ : (Real.sqrt 2 + k : ℝ) ≥ 1 := by
                      have h₁₅ : (k : ℝ) ≥ 0 := by positivity
                      have h₁₆ : Real.sqrt 2 ≥ 0 := Real.sqrt_nonneg 2
                      nlinarith [Real.sqrt_nonneg 2, Real.sq_sqrt (show 0 ≤ 2 by norm_num)]
                    have h₁₇ : (Real.sqrt 2 + k : ℝ) ^ 3 ≥ 1 := by
                      have h₁₈ : (Real.sqrt 2 + k : ℝ) ≥ 1 := h₁₄
                      have h₁₉ : (Real.sqrt 2 + k : ℝ) ^ 3 ≥ 1 := by
                        calc
                          (Real.sqrt 2 + k : ℝ) ^ 3 ≥ 1 ^ 3 := by gcongr <;> nlinarith [Real.sqrt_nonneg 2, Real.sq_sqrt (show 0 ≤ 2 by norm_num)]
                          _ = 1 := by norm_num
                      exact h₁₉
                    exact h₁₇
                  nlinarith
                have h₁₃ : 0 < (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) := by
                  have h₁₄ : (Real.sqrt 2 + k : ℝ) ^ 3 - 1 < (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) := h₄ k
                  have h₁₅ : 0 < (Real.sqrt 2 + k : ℝ) ^ 3 - 1 := h₁₂
                  nlinarith
                -- Use the fact that the floor function is within 1 of its argument
                have h₁₄ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) < (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) := by
                  -- Use the fact that the floor function is within 1 of its argument
                  have h₁₅ : (Real.sqrt 2 + k : ℝ) ^ 3 - 1 < (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) := h₄ k
                  have h₁₆ : 0 < (Real.sqrt 2 + k : ℝ) ^ 3 - 1 := h₁₂
                  have h₁₇ : 0 < (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) := h₁₃
                  -- Use the fact that the floor function is within 1 of its argument
                  have h₁₈ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) < (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) := by linarith
                  have h₁₉ : 0 < ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) := by linarith
                  have h₂₀ : 0 < (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) := by linarith
                  -- Use the fact that the floor function is within 1 of its argument
                  have h₂₁ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) < (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) := by
                    -- Use the fact that the floor function is within 1 of its argument
                    apply Real.rpow_lt_rpow (by positivity) _ (by positivity)
                    <;> linarith
                  exact h₂₁
                exact h₁₄
              exact h₁₀
            have h₇ : ∀ k : ℕ, (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) ≤ (Real.sqrt 2 + k : ℝ) := by
              intro k
              have h₈ : (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ≤ (Real.sqrt 2 + k : ℝ) ^ 3 := h₅ k
              have h₉ : 0 ≤ (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) := by positivity
              have h₁₀ : 0 ≤ (Real.sqrt 2 + k : ℝ) := by positivity
              have h₁₁ : 0 ≤ (Real.sqrt 2 + k : ℝ) ^ 3 := by positivity
              have h₁₂ : (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) ≤ (Real.sqrt 2 + k : ℝ) := by
                calc
                  (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) ≤ ((Real.sqrt 2 + k : ℝ) ^ 3) ^ ((1 : ℝ) / 3) := by
                    gcongr
                    <;> simp_all [Nat.floor_le, Nat.cast_nonneg]
                    <;> linarith
                  _ = (Real.sqrt 2 + k : ℝ) := by
                    rw [← Real.rpow_nat_cast]
                    rw [← Real.rpow_mul] <;> ring_nf <;> field_simp <;>
                      simp [Nat.cast_nonneg]
                    <;> norm_num
                    <;> linarith
              exact h₁₂
            have h₈ : Tendsto (fun k : ℕ => (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ)) atTop (𝓝 (Real.sqrt 2)) := by
              have h₉ : Tendsto (fun k : ℕ => (Real.sqrt 2 + k : ℝ)) atTop atTop := by
                -- Prove that (Real.sqrt 2 + k : ℝ) tends to infinity
                have h₁₀ : Tendsto (fun k : ℕ => (Real.sqrt 2 + k : ℝ)) atTop atTop := by
                  have h₁₁ : Tendsto (fun k : ℕ => (k : ℝ)) atTop atTop := by
                    simpa using tendsto_natCast_atTop_atTop
                  have h₁₂ : Tendsto (fun k : ℕ => (Real.sqrt 2 + k : ℝ)) atTop atTop := by
                    -- Use the fact that the sum of a constant and a function tending to infinity tends to infinity
                    have h₁₃ : Tendsto (fun k : ℕ => (Real.sqrt 2 + k : ℝ)) atTop atTop := by
                      -- Use the fact that the sum of a constant and a function tending to infinity tends to infinity
                      simpa [add_comm] using Tendsto.atTop_add (tendsto_const_nhds) h₁₁
                    exact h₁₃
                  exact h₁₂
                exact h₁₀
              have h₁₀ : Tendsto (fun k : ℕ => (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ)) atTop (𝓝 (Real.sqrt 2)) := by
                have h₁₁ : Tendsto (fun k : ℕ => ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ)) atTop (𝓝 (Real.sqrt 2)) := by
                  have h₁₂ : Tendsto (fun k : ℕ => ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ)) atTop (𝓝 (Real.sqrt 2)) := by
                    have h₁₃ : Tendsto (fun k : ℕ => ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ)) atTop (𝓝 (Real.sqrt 2)) := by
                      have h₁₄ : (fun k : ℕ => ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ)) = (fun k : ℕ => (Real.sqrt 2 + k : ℝ) - (k : ℝ)) := by
                        funext k
                        have h₁₅ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) = (Real.sqrt 2 + k : ℝ) := by
                          have h₁₆ : 0 < (Real.sqrt 2 + k : ℝ) := by positivity
                          have h₁₇ : 0 < (Real.sqrt 2 + k : ℝ) ^ 3 - 1 := by
                            have h₁₈ : (Real.sqrt 2 + k : ℝ) ^ 3 ≥ 1 := by
                              have h₁₉ : (Real.sqrt 2 + k : ℝ) ≥ 1 := by
                                have h₂₀ : (k : ℝ) ≥ 0 := by positivity
                                have h₂₁ : Real.sqrt 2 ≥ 0 := Real.sqrt_nonneg 2
                                nlinarith [Real.sqrt_nonneg 2, Real.sq_sqrt (show 0 ≤ 2 by norm_num)]
                              have h₂₂ : (Real.sqrt 2 + k : ℝ) ^ 3 ≥ 1 := by
                                have h₂₃ : (Real.sqrt 2 + k : ℝ) ≥ 1 := h₁₉
                                have h₂₄ : (Real.sqrt 2 + k : ℝ) ^ 3 ≥ 1 := by
                                  calc
                                    (Real.sqrt 2 + k : ℝ) ^ 3 ≥ 1 ^ 3 := by gcongr <;> nlinarith [Real.sqrt_nonneg 2, Real.sq_sqrt (show 0 ≤ 2 by norm_num)]
                                    _ = 1 := by norm_num
                                exact h₂₄
                              exact h₂₂
                            nlinarith
                          have h₂₅ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) = (Real.sqrt 2 + k : ℝ) := by
                            have h₂₆ : 0 < (Real.sqrt 2 + k : ℝ) ^ 3 - 1 := h₁₇
                            have h₂₇ : 0 < (Real.sqrt 2 + k : ℝ) := by positivity
                            have h₂₈ : 0 < (Real.sqrt 2 + k : ℝ) ^ 3 - 1 := h₁₇
                            have h₂₉ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) = (Real.sqrt 2 + k : ℝ) := by
                              have h₃₀ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) > 0 := by linarith
                              have h₃₁ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) = (Real.sqrt 2 + k : ℝ) := by
                                have h₃₂ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) > 0 := by linarith
                                have h₃₃ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) = (Real.sqrt 2 + k : ℝ) := by
                                  -- Use the fact that the floor function is within 1 of its argument
                                  have h₃₄ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) > 0 := by linarith
                                  have h₃₅ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) = (Real.sqrt 2 + k : ℝ) := by
                                    -- Use the fact that the floor function is within 1 of its argument
                                    have h₃₆ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) > 0 := by linarith
                                    have h₃₇ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) = (Real.sqrt 2 + k : ℝ) := by
                                      -- Use the fact that the floor function is within 1 of its argument
                                      have h₃₈ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) > 0 := by linarith
                                      have h₃₉ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) = (Real.sqrt 2 + k : ℝ) := by
                                        -- Use the fact that the floor function is within 1 of its argument
                                        have h₄₀ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) > 0 := by linarith
                                        have h₄₁ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) = (Real.sqrt 2 + k : ℝ) := by
                                          -- Use the fact that the floor function is within 1 of its argument
                                          rw [← Real.exp_log (by positivity : 0 < ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3)), ← Real.exp_log (by positivity : 0 < (Real.sqrt 2 + k : ℝ))]
                                          -- Simplify the expression using logarithms
                                          field_simp [Real.log_rpow, Real.log_mul, Real.log_pow, Real.log_sqrt, Real.log_inv, Real.log_div] at *
                                          <;> ring_nf at *
                                          <;> field_simp at *
                                          <;> ring_nf at *
                                          <;> norm_num at *
                                          <;> linarith
                                        exact h₄₁
                                      exact h₃₉
                                    exact h₃₇
                                  exact h₃₅
                                exact h₃₃
                              exact h₃₁
                            exact h₂₉
                          exact h₂₅
                        rw [h₁₅]
                        <;> ring_nf
                        <;> field_simp
                        <;> linarith
                      rw [h₁₄]
                      <;>
                      simp_all [sub_eq_add_neg]
                      <;>
                      norm_num
                      <;>
                      linarith
                    exact h₁₃
                  exact h₁₂
                have h₁₅ : Tendsto (fun k : ℕ => (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ)) atTop (𝓝 (Real.sqrt 2)) := by
                  have h₁₆ : ∀ k : ℕ, ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ) ≤ (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ) := by
                    intro k
                    have h₁₇ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) ≤ (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) := by
                      have h₁₈ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) < (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) := h₆ k
                      have h₁₉ : ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) ≤ (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) := by
                        linarith
                      exact h₁₉
                    linarith
                  have h₁₇ : ∀ k : ℕ, (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ) ≤ (Real.sqrt 2 + k : ℝ) - (k : ℝ) := by
                    intro k
                    have h₁₈ : (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) ≤ (Real.sqrt 2 + k : ℝ) := h₇ k
                    linarith
                  have h₁₈ : Tendsto (fun k : ℕ => (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ)) atTop (𝓝 (Real.sqrt 2)) := by
                    -- Use the squeeze theorem to prove the limit
                    have h₁₉ : Tendsto (fun k : ℕ => ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ)) atTop (𝓝 (Real.sqrt 2)) := h₁₁
                    have h₂₀ : Tendsto (fun k : ℕ => (Real.sqrt 2 + k : ℝ) - (k : ℝ)) atTop (𝓝 (Real.sqrt 2)) := by
                      have h₂₁ : Tendsto (fun k : ℕ => (Real.sqrt 2 + k : ℝ) - (k : ℝ)) atTop (𝓝 (Real.sqrt 2)) := by
                        have h₂₂ : (fun k : ℕ => (Real.sqrt 2 + k : ℝ) - (k : ℝ)) = (fun k : ℕ => Real.sqrt 2) := by
                          funext k
                          <;> ring_nf
                          <;> field_simp
                          <;> linarith
                        rw [h₂₂]
                        exact tendsto_const_nhds
                      exact h₂₁
                    have h₂₁ : ∀ᶠ k in atTop, ((Real.sqrt 2 + k : ℝ) ^ 3 - 1 : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ) ≤ (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ) := by
                      filter_upwards [eventually_ge_atTop 0] with k hk
                      exact h₁₆ k
                    have h₂₂ : ∀ᶠ k in atTop, (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ) ≤ (Real.sqrt 2 + k : ℝ) - (k : ℝ) := by
                      filter_upwards [eventually_ge_atTop 0] with k hk
                      exact h₁₇ k
                    have h₂₃ : Tendsto (fun k : ℕ => (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ)) atTop (𝓝 (Real.sqrt 2)) := by
                      -- Use the squeeze theorem to prove the limit
                      have h₂₄ : Tendsto (fun k : ℕ => (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ)) atTop (𝓝 (Real.sqrt 2)) := by
                        -- Use the squeeze theorem to prove the limit
                        have h₂₅ : Tendsto (fun k : ℕ => (⌊(Real.sqrt 2 + k : ℝ) ^ 3⌋₊ : ℝ) ^ ((1 : ℝ) / 3) - (k : ℝ)) atTop (𝓝 (Real.sqrt 2)) := by
                          -- Use the squeeze theorem to prove the limit
                          apply tendsto_of_tendsto_of_tendsto_of_le_of_le' h₁₁ h₂₀
                          · filter_upwards [eventually_ge_atTop 0] with k hk
                            exact h₁₆ k
                          · filter_upwards [eventually_ge_atTop 0] with k hk
                            exact h₁₇ k
                        exact h₂₅
                      exact h₂₄
                    exact h₂₃
                  exact h₁₈
                exact h₁₅
              exact h₁₀
            exact h₈
          exact h₃
        exact h₂
      exact h₁
    <;> simp_all
    <;> norm_num
    <;> linarith
  
  have h_final : ((True : Prop) ↔ (∃ s : ℕ → ℝ, (∀ i : ℕ, numform (s i)) ∧ Tendsto s atTop (𝓝 (Real.sqrt 2)))) := by
    constructor
    · -- Prove the forward direction: if True, then the sequence exists
      intro h
      exact h_main
    · -- Prove the backward direction: if the sequence exists, then True
      intro h
      trivial
  
  exact h_final