theorem putnam_1972_b2
    (s v : ℝ)
    (hs : s > 0)
    (hv : v > 0)
    (valid : ℝ → (ℝ → ℝ) → Prop)
    (hvalid : ∀ t x, valid t x ↔
      DifferentiableOn ℝ x (Set.Icc 0 t) ∧ DifferentiableOn ℝ (deriv x) (Set.Icc 0 t) ∧
      AntitoneOn (deriv (deriv x)) (Set.Icc 0 t) ∧
      deriv x 0 = 0 ∧ deriv x t = v ∧ x t - x 0 = s)
    : IsGreatest {t | ∃ x : ℝ → ℝ, valid t x} (((fun s v : ℝ ↦ 2 * s / v) : ℝ → ℝ → ℝ ) s v) := by
  have h_main : IsGreatest {t | ∃ x : ℝ → ℝ, valid t x} (2 * s / v) := by
    have h₁ : (2 * s / v : ℝ) ∈ {t | ∃ x : ℝ → ℝ, valid t x} := by
      -- Construct the function x(u) = (v^2 / (4 * s)) * u^2
      use fun u => (v ^ 2 / (4 * s)) * u ^ 2
      have h₂ : valid (2 * s / v) (fun u => (v ^ 2 / (4 * s)) * u ^ 2) := by
        rw [hvalid]
        constructor
        · -- Prove DifferentiableOn ℝ x (Set.Icc 0 t)
          apply DifferentiableOn.mul
          · exact differentiableOn_const _
          · exact differentiableOn_pow 2
        · constructor
          · -- Prove DifferentiableOn ℝ (deriv x) (Set.Icc 0 t)
            have h₃ : deriv (fun u : ℝ => (v ^ 2 / (4 * s)) * u ^ 2) = fun u => (v ^ 2 / (4 * s)) * (2 * u) := by
              funext u
              ring_nf
              <;> field_simp [mul_comm]
              <;> ring_nf
              <;> norm_num
              <;> linarith
            rw [h₃]
            apply DifferentiableOn.mul
            · exact differentiableOn_const _
            · exact DifferentiableOn.mul (differentiableOn_const _) differentiableOn_id
          · constructor
            · -- Prove AntitoneOn (deriv (deriv x)) (Set.Icc 0 t)
              have h₄ : deriv (fun u : ℝ => (v ^ 2 / (4 * s)) * u ^ 2) = fun u => (v ^ 2 / (4 * s)) * (2 * u) := by
                funext u
                ring_nf
                <;> field_simp [mul_comm]
                <;> ring_nf
                <;> norm_num
                <;> linarith
              have h₅ : deriv (deriv (fun u : ℝ => (v ^ 2 / (4 * s)) * u ^ 2)) = fun u => (v ^ 2 / (4 * s)) * 2 := by
                funext u
                rw [h₄]
                ring_nf
                <;> field_simp [mul_comm]
                <;> ring_nf
                <;> norm_num
                <;> linarith
              rw [h₅]
              intro x hx y hy hxy
              simp_all [AntitoneOn, Set.mem_Icc]
              <;> norm_num
              <;> linarith
            · constructor
              · -- Prove deriv x 0 = 0
                have h₆ : deriv (fun u : ℝ => (v ^ 2 / (4 * s)) * u ^ 2) 0 = 0 := by
                  have h₇ : deriv (fun u : ℝ => (v ^ 2 / (4 * s)) * u ^ 2) = fun u => (v ^ 2 / (4 * s)) * (2 * u) := by
                    funext u
                    ring_nf
                    <;> field_simp [mul_comm]
                    <;> ring_nf
                    <;> norm_num
                    <;> linarith
                  rw [h₇]
                  norm_num
                exact h₆
              · constructor
                · -- Prove deriv x t = v
                  have h₇ : deriv (fun u : ℝ => (v ^ 2 / (4 * s)) * u ^ 2) (2 * s / v) = v := by
                    have h₈ : deriv (fun u : ℝ => (v ^ 2 / (4 * s)) * u ^ 2) = fun u => (v ^ 2 / (4 * s)) * (2 * u) := by
                      funext u
                      ring_nf
                      <;> field_simp [mul_comm]
                      <;> ring_nf
                      <;> norm_num
                      <;> linarith
                    rw [h₈]
                    have h₉ : (v ^ 2 / (4 * s)) * (2 * (2 * s / v)) = v := by
                      field_simp [mul_comm]
                      <;> ring_nf
                      <;> field_simp [mul_comm]
                      <;> ring_nf
                      <;> nlinarith
                    rw [h₉]
                  exact h₇
                · -- Prove x t - x 0 = s
                  have h₈ : ((fun u : ℝ => (v ^ 2 / (4 * s)) * u ^ 2) (2 * s / v) - (fun u : ℝ => (v ^ 2 / (4 * s)) * u ^ 2) 0) = s := by
                    have h₉ : (v ^ 2 / (4 * s)) * (2 * s / v) ^ 2 - (v ^ 2 / (4 * s)) * 0 ^ 2 = s := by
                      field_simp [mul_comm]
                      <;> ring_nf
                      <;> field_simp [mul_comm]
                      <;> ring_nf
                      <;> nlinarith
                    simpa using h₉
                  exact h₈
      exact h₂
    have h₂ : ∀ t ∈ {t | ∃ x : ℝ → ℝ, valid t x}, t ≤ 2 * s / v := by
      intro t ht
      rcases ht with ⟨x, hx⟩
      have h₃ : valid t x := hx
      rw [hvalid] at h₃
      rcases h₃ with ⟨h₃₁, h₃₂, h₃₃, h₃₄, h₃₅, h₃₆⟩
      have h₄ : t ≤ 2 * s / v := by
        by_contra h
        have h₅ : t > 2 * s / v := by linarith
        have h₆ : deriv x 0 = 0 := h₃₄
        have h₇ : deriv x t = v := h₃₅
        have h₈ : x t - x 0 = s := h₃₆
        have h₉ : AntitoneOn (deriv (deriv x)) (Set.Icc 0 t) := h₃₃
        have h₁₀ : DifferentiableOn ℝ x (Set.Icc 0 t) := h₃₁
        have h₁₁ : DifferentiableOn ℝ (deriv x) (Set.Icc 0 t) := h₃₂
        -- Use the fact that x' is concave to derive a contradiction
        have h₁₂ : ∀ u ∈ Set.Icc 0 t, deriv x u ≥ (u / t) * v := by
          intro u hu
          have h₁₃ : u ∈ Set.Icc 0 t := hu
          have h₁₄ : 0 ≤ u := by exact h₁₃.1
          have h₁₅ : u ≤ t := by exact h₁₃.2
          have h₁₆ : deriv x u ≥ (u / t) * v := by
            -- Use the concavity of x' to derive the inequality
            have h₁₇ : deriv x u ≥ (u / t) * v := by
              -- Use the fact that x' is concave to derive the inequality
              have h₁₈ : ConcaveOn ℝ (Set.Icc 0 t) (deriv x) := by
                -- Prove that x' is concave on [0, t]
                have h₁₉ : ConvexOn ℝ (Set.Icc 0 t) (deriv (deriv x)) := by
                  -- Prove that x'' is convex on [0, t]
                  exact?
                have h₂₀ : ConcaveOn ℝ (Set.Icc 0 t) (deriv x) := by
                  -- Prove that x' is concave on [0, t]
                  exact?
                exact h₂₀
              have h₂₁ : deriv x u ≥ (u / t) * v := by
                -- Use the concavity of x' to derive the inequality
                have h₂₂ : (u : ℝ) ∈ Set.Icc 0 t := by exact h₁₃
                have h₂₃ : (t : ℝ) ∈ Set.Icc 0 t := by
                  exact ⟨by linarith, by linarith⟩
                have h₂₄ : deriv x u ≥ (u / t) * v := by
                  -- Use the concavity of x' to derive the inequality
                  have h₂₅ : deriv x u ≥ (u / t) * v := by
                    -- Use the concavity of x' to derive the inequality
                    have h₂₆ : deriv x u ≥ (u / t) * v := by
                      -- Use the concavity of x' to derive the inequality
                      have h₂₇ : deriv x u ≥ (u / t) * v := by
                        -- Use the concavity of x' to derive the inequality
                        have h₂₈ : deriv x u ≥ (u / t) * v := by
                          -- Use the concavity of x' to derive the inequality
                          have h₂₉ : deriv x u ≥ (u / t) * v := by
                            -- Use the concavity of x' to derive the inequality
                            exact?
                          exact h₂₉
                        exact h₂₈
                      exact h₂₇
                    exact h₂₆
                  exact h₂₅
                exact h₂₄
              exact h₂₁
            exact h₁₇
          exact h₁₆
        have h₁₃ : x t - x 0 ≥ s := by
          -- Use the inequality to derive a contradiction
          have h₁₄ : x t - x 0 = s := h₃₆
          linarith
        have h₁₄ : x t - x 0 < s := by
          -- Use the inequality to derive a contradiction
          have h₁₅ : x t - x 0 < s := by
            -- Use the inequality to derive a contradiction
            have h₁₆ : x t - x 0 < s := by
              -- Use the inequality to derive a contradiction
              have h₁₇ : x t - x 0 < s := by
                -- Use the inequality to derive a contradiction
                have h₁₈ : x t - x 0 < s := by
                  -- Use the inequality to derive a contradiction
                  have h₁₉ : x t - x 0 < s := by
                    -- Use the inequality to derive a contradiction
                    exact?
                  exact h₁₉
                exact h₁₈
              exact h₁₇
            exact h₁₆
          exact h₁₅
        linarith
      exact h₄
    exact ⟨h₁, h₂⟩
  exact h_main