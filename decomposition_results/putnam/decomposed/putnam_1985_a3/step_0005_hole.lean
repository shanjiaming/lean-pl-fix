theorem h_limit (d : ℝ) (a : ℕ → ℕ → ℝ) (ha0 : ∀ (m : ℕ), a m 0 = d / 2 ^ m) (ha : ∀ (m j : ℕ), a m (j + 1) = a m j ^ 2 + 2 * a m j) (h_main : ∀ (m j : ℕ), a m j = (d / 2 ^ m + 1) ^ 2 ^ j - 1) : sorry :=
  by
  have h₁ : (fun n ↦ a n n) = (fun n ↦ (d / (2 : ℝ) ^ n + 1) ^ (2 ^ n : ℕ) - 1) := by sorry
  --  rw [h₁]
  have h₂ : Tendsto (fun n ↦ (d / (2 : ℝ) ^ n + 1 : ℝ) ^ (2 ^ n : ℕ) - 1) atTop (𝓝 (exp d - 1)) :=
    by
    have h₃ : Tendsto (fun n ↦ (d / (2 : ℝ) ^ n + 1 : ℝ) ^ (2 ^ n : ℕ)) atTop (𝓝 (exp d)) :=
      by
      have h₄ : Tendsto (fun n : ℕ ↦ (d / (2 : ℝ) ^ n + 1 : ℝ) ^ (2 ^ n : ℕ)) atTop (𝓝 (exp d)) :=
        by
        have h₅ : Tendsto (fun n : ℕ ↦ (d / (2 : ℝ) ^ n + 1 : ℝ) ^ (2 ^ n : ℕ)) atTop (𝓝 (exp d)) :=
          by
          have h₆ : Tendsto (fun n : ℕ ↦ (d / (2 : ℝ) ^ n + 1 : ℝ) ^ (2 ^ n : ℕ)) atTop (𝓝 (exp d)) :=
            by
            have h₇ : Tendsto (fun n : ℕ ↦ (1 + d / (2 : ℝ) ^ n : ℝ)) atTop (𝓝 1) :=
              by
              have h₈ : Tendsto (fun n : ℕ ↦ (d / (2 : ℝ) ^ n : ℝ)) atTop (𝓝 0) :=
                by
                have h₉ : Tendsto (fun n : ℕ ↦ (d / (2 : ℝ) ^ n : ℝ)) atTop (𝓝 0) :=
                  by
                  have h₁₀ : Tendsto (fun n : ℕ ↦ (d / (2 : ℝ) ^ n : ℝ)) atTop (𝓝 0) :=
                    by
                    have h₁₁ : Tendsto (fun n : ℕ ↦ (d : ℝ) / (2 : ℝ) ^ n) atTop (𝓝 0) :=
                      by
                      have h₁₂ : Tendsto (fun n : ℕ ↦ (2 : ℝ) ^ n) atTop atTop := by
                        exact tendsto_pow_atTop_atTop_of_one_lt (by norm_num)
                      have h₁₃ : Tendsto (fun n : ℕ ↦ (d : ℝ) / (2 : ℝ) ^ n) atTop (𝓝 0) :=
                        by
                        have h₁₄ : Tendsto (fun n : ℕ ↦ (d : ℝ) / (2 : ℝ) ^ n) atTop (𝓝 0) := by
                          simpa [div_eq_mul_inv] using tendsto_const_nhds.div_atTop h₁₂
                        exact h₁₄
                      exact h₁₃
                    exact h₁₁
                  exact h₁₀
                exact h₉
              have h₁₀ : Tendsto (fun n : ℕ ↦ (1 + d / (2 : ℝ) ^ n : ℝ)) atTop (𝓝 1) :=
                by
                have h₁₁ : Tendsto (fun n : ℕ ↦ (1 : ℝ)) atTop (𝓝 1) := by exact tendsto_const_nhds
                have h₁₂ : Tendsto (fun n : ℕ ↦ (d / (2 : ℝ) ^ n : ℝ)) atTop (𝓝 0) := h₈
                have h₁₃ : Tendsto (fun n : ℕ ↦ (1 + d / (2 : ℝ) ^ n : ℝ)) atTop (𝓝 (1 + 0)) := by
                  exact Tendsto.add h₁₁ h₁₂
                have h₁₄ : Tendsto (fun n : ℕ ↦ (1 + d / (2 : ℝ) ^ n : ℝ)) atTop (𝓝 1) := by simpa using h₁₃
                exact h₁₄
              exact h₁₀
            have h₈ : Tendsto (fun n : ℕ ↦ ((1 + d / (2 : ℝ) ^ n : ℝ) ^ (2 ^ n : ℕ))) atTop (𝓝 (exp d)) :=
              by
              have h₉ : Tendsto (fun n : ℕ ↦ ((1 + d / (2 : ℝ) ^ n : ℝ) ^ (2 ^ n : ℕ))) atTop (𝓝 (exp d)) :=
                by
                have h₁₀ : Tendsto (fun n : ℕ ↦ (1 + d / (2 : ℝ) ^ n : ℝ)) atTop (𝓝 1) := h₇
                have h₁₁ : Tendsto (fun n : ℕ ↦ ((1 + d / (2 : ℝ) ^ n : ℝ) ^ (2 ^ n : ℕ))) atTop (𝓝 (exp d)) :=
                  by
                  have h₁₂ : Tendsto (fun n : ℕ ↦ ((1 + d / (2 : ℝ) ^ n : ℝ) ^ (2 ^ n : ℕ))) atTop (𝓝 (exp d)) :=
                    by
                    have h₁₃ : Tendsto (fun n : ℕ ↦ ((1 + d / (2 : ℝ) ^ n : ℝ) ^ (2 ^ n : ℕ))) atTop (𝓝 (exp d)) :=
                      by
                      have h₁₄ : Tendsto (fun n : ℕ ↦ ((1 + d / (2 : ℝ) ^ n : ℝ) ^ (2 ^ n : ℕ))) atTop (𝓝 (exp d)) := by
                        convert tendsto_one_plus_div_pow_exp d using 1 <;> simp [add_comm] <;> field_simp <;>
                                  ring_nf <;>
                                simp_all [add_comm] <;>
                              field_simp <;>
                            ring_nf <;>
                          simp_all [add_comm]
                      exact h₁₄
                    exact h₁₃
                  exact h₁₂
                exact h₁₁
              exact h₉
            have h₉ : Tendsto (fun n : ℕ ↦ (d / (2 : ℝ) ^ n + 1 : ℝ) ^ (2 ^ n : ℕ)) atTop (𝓝 (exp d)) :=
              by
              have h₁₀ : Tendsto (fun n : ℕ ↦ (d / (2 : ℝ) ^ n + 1 : ℝ) ^ (2 ^ n : ℕ)) atTop (𝓝 (exp d)) :=
                by
                have h₁₁ : Tendsto (fun n : ℕ ↦ (d / (2 : ℝ) ^ n + 1 : ℝ) ^ (2 ^ n : ℕ)) atTop (𝓝 (exp d)) :=
                  by
                  have h₁₂ : Tendsto (fun n : ℕ ↦ (d / (2 : ℝ) ^ n + 1 : ℝ) ^ (2 ^ n : ℕ)) atTop (𝓝 (exp d)) := by
                    convert h₈ using 1 <;> simp [add_comm] <;> field_simp <;> ring_nf <;> simp_all [add_comm] <;>
                          field_simp <;>
                        ring_nf <;>
                      simp_all [add_comm]
                  exact h₁₂
                exact h₁₁
              exact h₁₀
            exact h₉
          exact h₆
        exact h₅
      exact h₄
    have h₅ : Tendsto (fun n ↦ (d / (2 : ℝ) ^ n + 1 : ℝ) ^ (2 ^ n : ℕ) - 1) atTop (𝓝 (exp d - 1)) :=
      by
      have h₆ : Tendsto (fun n ↦ (d / (2 : ℝ) ^ n + 1 : ℝ) ^ (2 ^ n : ℕ)) atTop (𝓝 (exp d)) := h₃
      have h₇ : Tendsto (fun n ↦ (d / (2 : ℝ) ^ n + 1 : ℝ) ^ (2 ^ n : ℕ) - 1) atTop (𝓝 (exp d - 1)) :=
        by
        have h₈ : Tendsto (fun n ↦ (d / (2 : ℝ) ^ n + 1 : ℝ) ^ (2 ^ n : ℕ) - 1) atTop (𝓝 (exp d - 1)) := by
          convert h₆.sub (tendsto_const_nhds : Tendsto (fun n : ℕ ↦ (1 : ℝ)) atTop (𝓝 1)) using 1 <;>
                      simp [sub_eq_add_neg] <;>
                    ring_nf <;>
                  simp_all [sub_eq_add_neg] <;>
                field_simp <;>
              ring_nf <;>
            simp_all [sub_eq_add_neg]
        exact h₈
      exact h₇
    exact h₅
  exact h₂
  hole