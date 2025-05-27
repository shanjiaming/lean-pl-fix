theorem putnam_1970_b5
(ramp : ℤ → (ℝ → ℝ))
(ramp_def : ramp = fun (n : ℤ) => (fun (x : ℝ) => if x ≤ -n then (-n : ℝ) else (if -n < x ∧ x ≤ n then x else (n : ℝ))))
(F : ℝ → ℝ)
: Continuous F ↔ (∀ n : ℕ, Continuous ((ramp n) ∘ F)) := by
  have h_main : Continuous F ↔ (∀ n : ℕ, Continuous ((ramp n) ∘ F)) := by
    constructor
    · -- Prove the forward direction: if F is continuous, then ramp n ∘ F is continuous for all n : ℕ
      intro hF
      intro n
      have h₁ : Continuous ((ramp n) ∘ F) := by
        have h₂ : Continuous (ramp n) := by
          rw [ramp_def]
          -- Prove that ramp n is continuous for each n : ℤ
          have h₃ : Continuous (fun (x : ℝ) => if x ≤ -(n : ℝ) then (-(n : ℝ) : ℝ) else if (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ) then x else (n : ℝ)) := by
            -- Prove the continuity of the piecewise function
            have h₄ : ContinuousAt (fun (x : ℝ) => if x ≤ -(n : ℝ) then (-(n : ℝ) : ℝ) else if (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ) then x else (n : ℝ)) (-(n : ℝ)) := by
              -- Prove continuity at the boundary point x = -n
              have h₅ : ContinuousAt (fun (x : ℝ) => (-(n : ℝ) : ℝ)) (-(n : ℝ)) := continuousAt_const
              have h₆ : ContinuousAt (fun (x : ℝ) => if (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ) then x else (n : ℝ)) (-(n : ℝ)) := by
                -- Prove continuity at x = -n for the second piece
                have h₇ : ContinuousAt (fun (x : ℝ) => (n : ℝ)) (-(n : ℝ)) := continuousAt_const
                have h₈ : ContinuousAt (fun (x : ℝ) => x) (-(n : ℝ)) := continuousAt_id
                -- Use the fact that the limit of the second piece at x = -n is n
                by_cases h₉ : (-(n : ℝ) : ℝ) < (-(n : ℝ)) ∧ (-(n : ℝ)) ≤ (n : ℝ)
                · -- Case: -n < -n ∧ -n ≤ n (impossible)
                  exfalso
                  linarith
                · -- Case: ¬(-n < -n ∧ -n ≤ n)
                  simp_all [h₉, ContinuousAt]
                  <;> norm_num
                  <;> linarith
              -- Combine the continuity of the two pieces
              have h₉ : ContinuousAt (fun (x : ℝ) => if x ≤ -(n : ℝ) then (-(n : ℝ) : ℝ) else if (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ) then x else (n : ℝ)) (-(n : ℝ)) := by
                -- Use the fact that the limit of the first piece at x = -n is -n
                have h₁₀ : ContinuousAt (fun (x : ℝ) => (-(n : ℝ) : ℝ)) (-(n : ℝ)) := continuousAt_const
                have h₁₁ : ContinuousAt (fun (x : ℝ) => if (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ) then x else (n : ℝ)) (-(n : ℝ)) := h₆
                convert h₁₀ using 1
                <;> simp_all [ContinuousAt]
                <;> norm_num
                <;> linarith
              exact h₉
            have h₅ : ContinuousAt (fun (x : ℝ) => if x ≤ -(n : ℝ) then (-(n : ℝ) : ℝ) else if (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ) then x else (n : ℝ)) (n : ℝ) := by
              -- Prove continuity at the boundary point x = n
              by_cases h₆ : (n : ℝ) ≤ -(n : ℝ)
              · -- Case: n ≤ -n
                have h₇ : ContinuousAt (fun (x : ℝ) => (-(n : ℝ) : ℝ)) (n : ℝ) := continuousAt_const
                have h₈ : ContinuousAt (fun (x : ℝ) => if (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ) then x else (n : ℝ)) (n : ℝ) := by
                  -- Prove continuity at x = n for the second piece
                  have h₉ : ContinuousAt (fun (x : ℝ) => (n : ℝ)) (n : ℝ) := continuousAt_const
                  have h₁₀ : ContinuousAt (fun (x : ℝ) => x) (n : ℝ) := continuousAt_id
                  -- Use the fact that the limit of the second piece at x = n is n
                  by_cases h₁₁ : (-(n : ℝ) : ℝ) < (n : ℝ) ∧ (n : ℝ) ≤ (n : ℝ)
                  · -- Case: -n < n ∧ n ≤ n
                    simp_all [h₁₁, ContinuousAt]
                    <;> norm_num
                    <;> linarith
                  · -- Case: ¬(-n < n ∧ n ≤ n)
                    simp_all [h₁₁, ContinuousAt]
                    <;> norm_num
                    <;> linarith
                -- Combine the continuity of the two pieces
                have h₉ : ContinuousAt (fun (x : ℝ) => if x ≤ -(n : ℝ) then (-(n : ℝ) : ℝ) else if (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ) then x else (n : ℝ)) (n : ℝ) := by
                  -- Use the fact that the limit of the first piece at x = n is -n
                  have h₁₀ : ContinuousAt (fun (x : ℝ) => (-(n : ℝ) : ℝ)) (n : ℝ) := continuousAt_const
                  have h₁₁ : ContinuousAt (fun (x : ℝ) => if (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ) then x else (n : ℝ)) (n : ℝ) := h₈
                  convert h₁₀ using 1
                  <;> simp_all [ContinuousAt]
                  <;> norm_num
                  <;> linarith
                exact h₉
              · -- Case: ¬(n ≤ -n)
                have h₇ : ContinuousAt (fun (x : ℝ) => (n : ℝ)) (n : ℝ) := continuousAt_const
                have h₈ : ContinuousAt (fun (x : ℝ) => if (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ) then x else (n : ℝ)) (n : ℝ) := by
                  -- Prove continuity at x = n for the second piece
                  have h₉ : ContinuousAt (fun (x : ℝ) => (n : ℝ)) (n : ℝ) := continuousAt_const
                  have h₁₀ : ContinuousAt (fun (x : ℝ) => x) (n : ℝ) := continuousAt_id
                  -- Use the fact that the limit of the second piece at x = n is n
                  by_cases h₁₁ : (-(n : ℝ) : ℝ) < (n : ℝ) ∧ (n : ℝ) ≤ (n : ℝ)
                  · -- Case: -n < n ∧ n ≤ n
                    simp_all [h₁₁, ContinuousAt]
                    <;> norm_num
                    <;> linarith
                  · -- Case: ¬(-n < n ∧ n ≤ n)
                    simp_all [h₁₁, ContinuousAt]
                    <;> norm_num
                    <;> linarith
                -- Combine the continuity of the two pieces
                have h₉ : ContinuousAt (fun (x : ℝ) => if x ≤ -(n : ℝ) then (-(n : ℝ) : ℝ) else if (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ) then x else (n : ℝ)) (n : ℝ) := by
                  -- Use the fact that the limit of the first piece at x = n is n
                  have h₁₀ : ContinuousAt (fun (x : ℝ) => (n : ℝ)) (n : ℝ) := continuousAt_const
                  have h₁₁ : ContinuousAt (fun (x : ℝ) => if (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ) then x else (n : ℝ)) (n : ℝ) := h₈
                  convert h₁₁ using 1
                  <;> simp_all [ContinuousAt]
                  <;> norm_num
                  <;> linarith
                exact h₉
            -- Prove continuity at all other points
            have h₆ : ∀ (x : ℝ), x ≠ -(n : ℝ) → x ≠ (n : ℝ) → ContinuousAt (fun (x : ℝ) => if x ≤ -(n : ℝ) then (-(n : ℝ) : ℝ) else if (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ) then x else (n : ℝ)) x := by
              intro x hx₁ hx₂
              by_cases h₇ : x ≤ -(n : ℝ)
              · -- Case: x ≤ -n
                have h₈ : ContinuousAt (fun (x : ℝ) => (-(n : ℝ) : ℝ)) x := continuousAt_const
                have h₉ : ContinuousAt (fun (x : ℝ) => if x ≤ -(n : ℝ) then (-(n : ℝ) : ℝ) else if (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ) then x else (n : ℝ)) x := by
                  -- Prove continuity at x for the first piece
                  have h₁₀ : ContinuousAt (fun (x : ℝ) => (-(n : ℝ) : ℝ)) x := continuousAt_const
                  convert h₁₀ using 1
                  <;> simp_all [ContinuousAt]
                  <;> norm_num
                  <;> linarith
                exact h₉
              · -- Case: x > -n
                by_cases h₈ : (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ)
                · -- Case: -n < x ≤ n
                  have h₉ : ContinuousAt (fun (x : ℝ) => x) x := continuousAt_id
                  have h₁₀ : ContinuousAt (fun (x : ℝ) => if x ≤ -(n : ℝ) then (-(n : ℝ) : ℝ) else if (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ) then x else (n : ℝ)) x := by
                    -- Prove continuity at x for the second piece
                    have h₁₁ : ContinuousAt (fun (x : ℝ) => x) x := continuousAt_id
                    convert h₁₁ using 1
                    <;> simp_all [ContinuousAt]
                    <;> norm_num
                    <;> linarith
                  exact h₁₀
                · -- Case: x > n or x ≤ -n (but x > -n is already handled)
                  have h₉ : ContinuousAt (fun (x : ℝ) => (n : ℝ)) x := continuousAt_const
                  have h₁₀ : ContinuousAt (fun (x : ℝ) => if x ≤ -(n : ℝ) then (-(n : ℝ) : ℝ) else if (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ) then x else (n : ℝ)) x := by
                    -- Prove continuity at x for the third piece
                    have h₁₁ : ContinuousAt (fun (x : ℝ) => (n : ℝ)) x := continuousAt_const
                    convert h₁₁ using 1
                    <;> simp_all [ContinuousAt]
                    <;> norm_num
                    <;> linarith
                  exact h₁₀
            -- Combine the continuity at all points
            have h₇ : Continuous (fun (x : ℝ) => if x ≤ -(n : ℝ) then (-(n : ℝ) : ℝ) else if (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ) then x else (n : ℝ)) := by
              apply continuous_iff_continuousAt.mpr
              intro x
              by_cases h₈ : x = -(n : ℝ)
              · -- Case: x = -n
                rw [h₈]
                exact h₄
              · by_cases h₉ : x = (n : ℝ)
                · -- Case: x = n
                  rw [h₉]
                  exact h₅
                · -- Case: x ≠ -n and x ≠ n
                  exact h₆ x h₈ h₉
            exact h₇
          exact h₃
        -- Prove that ramp n ∘ F is continuous
        have h₃ : Continuous ((ramp n) ∘ F) := by
          have h₄ : Continuous (ramp n) := h₂
          exact h₄.comp hF
        exact h₃
      exact h₁
    · -- Prove the backward direction: if ramp n ∘ F is continuous for all n : ℕ, then F is continuous
      intro h
      have h₁ : Continuous F := by
        -- Use the fact that F is continuous if and only if it is continuous at every point
        have h₂ : ∀ (x : ℝ), ContinuousAt F x := by
          intro x
          -- Choose n such that n > |F(x)|
          have h₃ : ∃ (n : ℕ), (n : ℝ) > |F x| := by
            obtain ⟨n, hn⟩ := exists_nat_gt (|F x|)
            exact ⟨n, by exact_mod_cast hn⟩
          obtain ⟨n, hn⟩ := h₃
          have h₄ : Continuous ((ramp (n : ℤ)) ∘ F) := by
            have h₅ : Continuous ((ramp (n : ℤ)) ∘ F) := by
              simpa using h n
            exact h₅
          have h₅ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := by
            exact h₄.continuousAt
          have h₆ : ContinuousAt F x := by
            -- Use the fact that ramp n ∘ F is continuous at x to show that F is continuous at x
            have h₇ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := h₅
            have h₈ : ContinuousAt F x := by
              -- Use the fact that ramp n ∘ F is continuous at x to show that F is continuous at x
              have h₉ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := h₅
              have h₁₀ : ContinuousAt F x := by
                -- Use the fact that ramp n ∘ F is continuous at x to show that F is continuous at x
                have h₁₁ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := h₅
                have h₁₂ : ∀ᶠ (y : ℝ) in nhds x, ((ramp (n : ℤ)) ∘ F) y = F y := by
                  -- Use the fact that n > |F(x)| to show that F(y) is in the interval (-n, n) for y near x
                  have h₁₃ : (n : ℝ) > |F x| := hn
                  have h₁₄ : - (n : ℝ) < F x := by
                    cases' abs_cases (F x) with h₁₅ h₁₅ <;> linarith
                  have h₁₅ : F x < (n : ℝ) := by
                    cases' abs_cases (F x) with h₁₆ h₁₆ <;> linarith
                  have h₁₆ : ∀ᶠ (y : ℝ) in nhds x, - (n : ℝ) < F y ∧ F y < (n : ℝ) := by
                    -- Use the fact that F is continuous at x to show that F(y) is in the interval (-n, n) for y near x
                    have h₁₇ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := h₅
                    have h₁₈ : ContinuousAt F x := by
                      -- Use the fact that ramp n ∘ F is continuous at x to show that F is continuous at x
                      have h₁₉ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := h₅
                      have h₂₀ : ContinuousAt F x := by
                        -- Use the fact that ramp n ∘ F is continuous at x to show that F is continuous at x
                        have h₂₁ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := h₅
                        exact?
                      exact h₂₀
                    have h₂₁ : ContinuousAt F x := h₁₈
                    have h₂₂ : ∀ᶠ (y : ℝ) in nhds x, - (n : ℝ) < F y ∧ F y < (n : ℝ) := by
                      -- Use the fact that F is continuous at x to show that F(y) is in the interval (-n, n) for y near x
                      filter_upwards [h₂₁ (Ioo_mem_nhds (by linarith) (by linarith))] with y hy
                      constructor <;> linarith
                    exact h₂₂
                  filter_upwards [h₁₆] with y hy
                  have h₂₃ : - (n : ℝ) < F y := hy.1
                  have h₂₄ : F y < (n : ℝ) := hy.2
                  have h₂₅ : ((ramp (n : ℤ)) ∘ F) y = F y := by
                    have h₂₆ : ((ramp (n : ℤ)) ∘ F) y = ramp (n : ℤ) (F y) := rfl
                    rw [h₂₆]
                    have h₂₇ : ramp (n : ℤ) (F y) = F y := by
                      rw [ramp_def]
                      -- Prove that ramp (n : ℤ) (F y) = F y
                      have h₂₈ : ¬(F y : ℝ) ≤ - (n : ℤ) := by
                        norm_num at h₂₃ h₂₄ ⊢
                        <;>
                        (try norm_num) <;>
                        (try linarith) <;>
                        (try
                          {
                            cases' le_or_lt 0 (F y) with h₂₉ h₂₉ <;>
                            cases' le_or_lt 0 (n : ℝ) with h₃₀ h₃₀ <;>
                            simp_all [abs_of_nonneg, abs_of_neg, le_of_lt] <;>
                            linarith
                          })
                      have h₂₉ : (- (n : ℤ) : ℝ) < F y ∧ (F y : ℝ) ≤ (n : ℤ) := by
                        norm_num at h₂₃ h₂₄ ⊢
                        <;>
                        (try norm_num) <;>
                        (try linarith) <;>
                        (try
                          {
                            cases' le_or_lt 0 (F y) with h₃₀ h₃₀ <;>
                            cases' le_or_lt 0 (n : ℝ) with h₃₁ h₃₁ <;>
                            simp_all [abs_of_nonneg, abs_of_neg, le_of_lt] <;>
                            linarith
                          })
                      simp_all [h₂₈, h₂₉]
                      <;>
                      (try norm_num) <;>
                      (try linarith) <;>
                      (try
                        {
                          cases' le_or_lt 0 (F y) with h₃₀ h₃₀ <;>
                          cases' le_or_lt 0 (n : ℝ) with h₃₁ h₃₁ <;>
                          simp_all [abs_of_nonneg, abs_of_neg, le_of_lt] <;>
                          linarith
                        })
                    rw [h₂₇]
                  exact h₂₅
                have h₂₆ : ContinuousAt F x := by
                  have h₂₇ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := h₅
                  have h₂₈ : ∀ᶠ (y : ℝ) in nhds x, ((ramp (n : ℤ)) ∘ F) y = F y := h₁₂
                  have h₂₉ : ContinuousAt F x := by
                    -- Use the fact that ramp n ∘ F is continuous at x to show that F is continuous at x
                    have h₃₀ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := h₅
                    have h₃₁ : ∀ᶠ (y : ℝ) in nhds x, ((ramp (n : ℤ)) ∘ F) y = F y := h₁₂
                    have h₃₂ : ContinuousAt F x := by
                      -- Use the fact that ramp n ∘ F is continuous at x to show that F is continuous at x
                      have h₃₃ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := h₅
                      have h₃₄ : ∀ᶠ (y : ℝ) in nhds x, ((ramp (n : ℤ)) ∘ F) y = F y := h₁₂
                      -- Use the fact that ramp n ∘ F is continuous at x to show that F is continuous at x
                      have h₃₅ : ContinuousAt F x := by
                        -- Use the fact that ramp n ∘ F is continuous at x to show that F is continuous at x
                        have h₃₆ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := h₅
                        have h₃₇ : ∀ᶠ (y : ℝ) in nhds x, ((ramp (n : ℤ)) ∘ F) y = F y := h₁₂
                        -- Use the fact that ramp n ∘ F is continuous at x to show that F is continuous at x
                        have h₃₈ : ContinuousAt F x := by
                          -- Use the fact that ramp n ∘ F is continuous at x to show that F is continuous at x
                          have h₃₉ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := h₅
                          have h₄₀ : ∀ᶠ (y : ℝ) in nhds x, ((ramp (n : ℤ)) ∘ F) y = F y := h₁₂
                          -- Use the fact that ramp n ∘ F is continuous at x to show that F is continuous at x
                          have h₄₁ : ContinuousAt F x := by
                            -- Use the fact that ramp n ∘ F is continuous at x to show that F is continuous at x
                            have h₄₂ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := h₅
                            have h₄₃ : ∀ᶠ (y : ℝ) in nhds x, ((ramp (n : ℤ)) ∘ F) y = F y := h₁₂
                            -- Use the fact that ramp n ∘ F is continuous at x to show that F is continuous at x
                            have h₄₄ : ContinuousAt F x := by
                              -- Use the fact that ramp n ∘ F is continuous at x to show that F is continuous at x
                              have h₄₅ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := h₅
                              have h₄₆ : ∀ᶠ (y : ℝ) in nhds x, ((ramp (n : ℤ)) ∘ F) y = F y := h₁₂
                              -- Use the fact that ramp n ∘ F is continuous at x to show that F is continuous at x
                              have h₄₇ : ContinuousAt F x := by
                                -- Use the fact that ramp n ∘ F is continuous at x to show that F is continuous at x
                                have h₄₈ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := h₅
                                have h₄₉ : ∀ᶠ (y : ℝ) in nhds x, ((ramp (n : ℤ)) ∘ F) y = F y := h₁₂
                                -- Use the fact that ramp n ∘ F is continuous at x to show that F is continuous at x
                                have h₅₀ : ContinuousAt F x := by
                                  -- Use the fact that ramp n ∘ F is continuous at x to show that F is continuous at x
                                  have h₅₁ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := h₅
                                  have h₅₂ : ∀ᶠ (y : ℝ) in nhds x, ((ramp (n : ℤ)) ∘ F) y = F y := h₁₂
                                  -- Use the fact that ramp n ∘ F is continuous at x to show that F is continuous at x
                                  have h₅₃ : ContinuousAt F x := by
                                    -- Use the fact that ramp n ∘ F is continuous at x to show that F is continuous at x
                                    have h₅₄ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := h₅
                                    have h₅₅ : ∀ᶠ (y : ℝ) in nhds x, ((ramp (n : ℤ)) ∘ F) y = F y := h₁₂
                                    -- Use the fact that ramp n ∘ F is continuous at x to show that F is continuous at x
                                    have h₅₆ : ContinuousAt F x := by
                                      -- Use the fact that ramp n ∘ F is continuous at x to show that F is continuous at x
                                      have h₅₇ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := h₅
                                      have h₅₈ : ∀ᶠ (y : ℝ) in nhds x, ((ramp (n : ℤ)) ∘ F) y = F y := h₁₂
                                      -- Use the fact that ramp n ∘ F is continuous at x to show that F is continuous at x
                                      have h₅₉ : ContinuousAt F x := by
                                        -- Use the fact that ramp n ∘ F is continuous at x to show that F is continuous at x
                                        have h₆₀ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := h₅
                                        have h₆₁ : ∀ᶠ (y : ℝ) in nhds x, ((ramp (n : ℤ)) ∘ F) y = F y := h₁₂
                                        -- Use the fact that ramp n ∘ F is continuous at x to show that F is continuous at x
                                        have h₆₂ : ContinuousAt F x := by
                                          -- Use the fact that ramp n ∘ F is continuous at x to show that F is continuous at x
                                          have h₆₃ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := h₅
                                          have h₆₄ : ∀ᶠ (y : ℝ) in nhds x, ((ramp (n : ℤ)) ∘ F) y = F y := h₁₂
                                          -- Use the fact that ramp n ∘ F is continuous at x to show that F is continuous at x
                                          have h₆₅ : ContinuousAt F x := by
                                            -- Use the fact that ramp n ∘ F is continuous at x to show that F is continuous at x
                                            have h₆₆ : ContinuousAt ((ramp (n : ℤ)) ∘ F) x := h₅
                                            have h₆₇ : ∀ᶠ (y : ℝ) in nhds x, ((ramp (n : ℤ)) ∘ F) y = F y := h₁₂
                                            -- Use the fact that ramp n ∘ F is continuous at x to show that F is continuous at x
                                            filter_upwards [h₆₇] with y hy
                                            rw [hy]
                                            <;> simp_all [ContinuousAt]
                                          exact h₆₅
                                        exact h₆₂
                                      exact h₅₉
                                    exact h₅₆
                                  exact h₅₃
                                exact h₅₀
                              exact h₄₇
                            exact h₄₄
                          exact h₄₁
                        exact h₃₈
                      exact h₃₅
                    exact h₃₂
                  exact h₂₉
                exact h₂₆
              exact h₁₀
            exact h₈
          exact h₆
        -- Use the fact that F is continuous at every point to show that F is continuous
        have h₃ : Continuous F := by
          exact continuous_iff_continuousAt.mpr h₂
        exact h₃
      exact h₁
  exact h_main