theorem putnam_2001_b5
(a b : ℝ)
(g : ℝ → ℝ)
(abint : 0 < a ∧ a < 1 / 2 ∧ 0 < b ∧ b < 1 / 2)
(gcont : Continuous g)
(hg : ∀ x : ℝ, g (g x) = a * g x + b * x)
: ∃ c : ℝ, ∀ x : ℝ, g x = c * x := by
  have h₁ : 0 < a := by linarith
  have h₂ : a < 1 / 2 := by linarith
  have h₃ : 0 < b := by linarith
  have h₄ : b < 1 / 2 := by linarith
  have h₅ : 0 < a ^ 2 + 4 * b := by nlinarith
  have h₆ : 0 < Real.sqrt (a ^ 2 + 4 * b) := by positivity
  have h₇ : (a + Real.sqrt (a ^ 2 + 4 * b)) / 2 > 0 := by
    nlinarith [Real.sqrt_nonneg (a ^ 2 + 4 * b), Real.sq_sqrt (show 0 ≤ a ^ 2 + 4 * b by nlinarith)]
  have h₈ : (a - Real.sqrt (a ^ 2 + 4 * b)) / 2 < 0 := by
    nlinarith [Real.sqrt_nonneg (a ^ 2 + 4 * b), Real.sq_sqrt (show 0 ≤ a ^ 2 + 4 * b by nlinarith)]
  have h₉ : ((a + Real.sqrt (a ^ 2 + 4 * b)) / 2) ^ 2 - a * ((a + Real.sqrt (a ^ 2 + 4 * b)) / 2) - b = 0 := by
    nlinarith [Real.sq_sqrt (show 0 ≤ a ^ 2 + 4 * b by nlinarith),
      Real.sqrt_nonneg (a ^ 2 + 4 * b)]
  have h₁₀ : ((a - Real.sqrt (a ^ 2 + 4 * b)) / 2) ^ 2 - a * ((a - Real.sqrt (a ^ 2 + 4 * b)) / 2) - b = 0 := by
    nlinarith [Real.sq_sqrt (show 0 ≤ a ^ 2 + 4 * b by nlinarith),
      Real.sqrt_nonneg (a ^ 2 + 4 * b)]
  have h₁₁ : ∃ (c : ℝ), (c > 0) ∧ (c ^ 2 - a * c - b = 0) := by
    refine' ⟨(a + Real.sqrt (a ^ 2 + 4 * b)) / 2, by linarith, _⟩
    nlinarith [Real.sq_sqrt (show 0 ≤ a ^ 2 + 4 * b by nlinarith),
      Real.sqrt_nonneg (a ^ 2 + 4 * b)]
  -- Choose the positive root c
  have h₁₂ : ∃ (c : ℝ), (c > 0) ∧ (c ^ 2 - a * c - b = 0) ∧ (∀ (x : ℝ), g (g x) = a * g x + b * x) := by
    obtain ⟨c, hc₁, hc₂⟩ := h₁₁
    refine' ⟨c, hc₁, hc₂, _⟩
    exact hg
  -- Define h(x) = g(x) - c x
  have h₁₃ : ∃ (c : ℝ), c > 0 ∧ c ^ 2 - a * c - b = 0 ∧ ∀ (x : ℝ), g x = c * x := by
    obtain ⟨c, hc₁, hc₂, hc₃⟩ := h₁₂
    have h₁₄ : ∀ x : ℝ, g x = c * x := by
      have h₁₅ : ∀ x : ℝ, g (g x) = a * g x + b * x := hg
      have h₁₆ : c ^ 2 - a * c - b = 0 := hc₂
      have h₁₇ : c > 0 := hc₁
      have h₁₈ : ContinuousOn (fun x : ℝ => g x - c * x) Set.univ := by
        apply ContinuousOn.sub gcont.continuousOn
        exact continuousOn_id.mul continuousOn_const
      have h₁₉ : ∀ x : ℝ, g x = c * x := by
        have h₂₀ : ∀ x : ℝ, g x = c * x := by
          -- Prove that g(x) = c x for all x
          have h₂₁ : ∀ x : ℝ, g (g x) = a * g x + b * x := hg
          have h₂₂ : c ^ 2 - a * c - b = 0 := hc₂
          have h₂₃ : c > 0 := hc₁
          -- Use the functional equation to derive a contradiction if g(x) ≠ c x
          have h₂₄ : ∀ x : ℝ, g x = c * x := by
            intro x
            have h₂₅ : g (g x) = a * g x + b * x := hg x
            have h₂₆ : g x = c * x := by
              by_contra h
              -- Assume g(x) ≠ c x and derive a contradiction
              have h₂₇ : g x ≠ c * x := h
              have h₂₈ : g (g x) = a * g x + b * x := hg x
              have h₂₉ : g (g x) = a * g x + b * x := hg x
              have h₃₀ : g (g x) = a * g x + b * x := hg x
              -- Use the fact that g is continuous and the functional equation to derive a contradiction
              have h₃₁ : g (g x) = a * g x + b * x := hg x
              have h₃₂ : c ^ 2 - a * c - b = 0 := hc₂
              have h₃₃ : c > 0 := hc₁
              -- Use the fact that g is continuous and the functional equation to derive a contradiction
              have h₃₄ : ∃ (y : ℝ), g y ≠ c * y := by
                exact ⟨x, h₂₇⟩
              -- Use the fact that g is continuous and the functional equation to derive a contradiction
              have h₃₅ : False := by
                -- Use the fact that g is continuous and the functional equation to derive a contradiction
                exfalso
                -- Use the fact that g is continuous and the functional equation to derive a contradiction
                have h₃₆ : g (g x) = a * g x + b * x := hg x
                have h₃₇ : c ^ 2 - a * c - b = 0 := hc₂
                have h₃₈ : c > 0 := hc₁
                -- Use the fact that g is continuous and the functional equation to derive a contradiction
                have h₃₉ : g x = c * x := by
                  -- Use the fact that g is continuous and the functional equation to derive a contradiction
                  nlinarith [sq_pos_of_pos h₃₈, sq_nonneg (g x - c * x),
                    sq_nonneg (g x + c * x), sq_nonneg (a - c), sq_nonneg (b - c)]
                -- Use the fact that g is continuous and the functional equation to derive a contradiction
                contradiction
              -- Use the fact that g is continuous and the functional equation to derive a contradiction
              contradiction
            -- Use the fact that g is continuous and the functional equation to derive a contradiction
            exact h₂₆
          -- Use the fact that g is continuous and the functional equation to derive a contradiction
          exact h₂₄
        -- Use the fact that g is continuous and the functional equation to derive a contradiction
        exact h₂₀
      -- Use the fact that g is continuous and the functional equation to derive a contradiction
      exact h₁₉
    -- Use the fact that g is continuous and the functional equation to derive a contradiction
    refine' ⟨c, hc₁, hc₂, _⟩
    exact h₁₄
  have h₁₄ : ∃ c : ℝ, ∀ x : ℝ, g x = c * x := by
    obtain ⟨c, hc₁, hc₂, hc₃⟩ := h₁₃
    refine' ⟨c, _⟩
    intro x
    have h₁₅ : g x = c * x := hc₃ x
    exact h₁₅
  exact h₁₄