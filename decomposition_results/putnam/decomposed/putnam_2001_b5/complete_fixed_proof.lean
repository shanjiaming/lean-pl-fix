theorem putnam_2001_b5 (a b : ℝ) (g : ℝ → ℝ) (abint : 0 < a ∧ a < 1 / 2 ∧ 0 < b ∧ b < 1 / 2) (gcont : Continuous g)
  (hg : ∀ x : ℝ, g (g x) = a * g x + b * x) : ∃ c : ℝ, ∀ x : ℝ, g x = c * x:=
  by
  have h₁ : 0 < a:= by -- linarith
    linarith
  have h₂ : a < 1 / 2:= by -- linarith
    linarith
  have h₃ : 0 < b:= by -- linarith
    linarith
  have h₄ : b < 1 / 2:= by -- linarith
    linarith
  have h₅ : 0 < a ^ 2 + 4 * b:= by -- nlinarith
    nlinarith
  have h₆ : 0 < Real.sqrt (a ^ 2 + 4 * b):= by -- positivity
    simpa
  have h₇ : (a + Real.sqrt (a ^ 2 + 4 * b)) / 2 > 0:= by
    --  nlinarith [Real.sqrt_nonneg (a ^ 2 + 4 * b), Real.sq_sqrt (show 0 ≤ a ^ 2 + 4 * b by nlinarith)]
    linarith
  have h₈ : (a - Real.sqrt (a ^ 2 + 4 * b)) / 2 < 0:= by
    --  nlinarith [Real.sqrt_nonneg (a ^ 2 + 4 * b), Real.sq_sqrt (show 0 ≤ a ^ 2 + 4 * b by nlinarith)]
    hole
  have h₉ : ((a + Real.sqrt (a ^ 2 + 4 * b)) / 2) ^ 2 - a * ((a + Real.sqrt (a ^ 2 + 4 * b)) / 2) - b = 0:= by
    --  nlinarith [Real.sq_sqrt (show 0 ≤ a ^ 2 + 4 * b by nlinarith), Real.sqrt_nonneg (a ^ 2 + 4 * b)]
    hole
  have h₁₀ : ((a - Real.sqrt (a ^ 2 + 4 * b)) / 2) ^ 2 - a * ((a - Real.sqrt (a ^ 2 + 4 * b)) / 2) - b = 0:= by
    --  nlinarith [Real.sq_sqrt (show 0 ≤ a ^ 2 + 4 * b by nlinarith), Real.sqrt_nonneg (a ^ 2 + 4 * b)]
    linarith
  have h₁₁ : ∃ (c : ℝ), (c > 0) ∧ (c ^ 2 - a * c - b = 0):=
    by
    --  refine' ⟨(a + Real.sqrt (a ^ 2 + 4 * b)) / 2, by linarith, _⟩
    --  nlinarith [Real.sq_sqrt (show 0 ≤ a ^ 2 + 4 * b by nlinarith), Real.sqrt_nonneg (a ^ 2 + 4 * b)]
    hole
  have h₁₂ : ∃ (c : ℝ), (c > 0) ∧ (c ^ 2 - a * c - b = 0) ∧ (∀ (x : ℝ), g (g x) = a * g x + b * x):=
    by
    --  obtain ⟨c, hc₁, hc₂⟩ := h₁₁
    --  refine' ⟨c, hc₁, hc₂, _⟩
    --  exact hg
    hole
  have h₁₃ : ∃ (c : ℝ), c > 0 ∧ c ^ 2 - a * c - b = 0 ∧ ∀ (x : ℝ), g x = c * x:=
    by
    --  obtain ⟨c, hc₁, hc₂, hc₃⟩ := h₁₂
    have h₁₄ : ∀ x : ℝ, g x = c * x:=
      by
      have h₁₅ : ∀ x : ℝ, g (g x) = a * g x + b * x := hg
      have h₁₆ : c ^ 2 - a * c - b = 0 := hc₂
      have h₁₇ : c > 0 := hc₁
      have h₁₈ : ContinuousOn (fun x : ℝ => g x - c * x) Set.univ:=
        by
        --  apply ContinuousOn.sub gcont.continuousOn
        --  exact continuousOn_id.mul continuousOn_const
        hole
      have h₁₉ : ∀ x : ℝ, g x = c * x:=
        by
        have h₂₀ : ∀ x : ℝ, g x = c * x:=
          by
          have h₂₁ : ∀ x : ℝ, g (g x) = a * g x + b * x := hg
          have h₂₂ : c ^ 2 - a * c - b = 0 := hc₂
          have h₂₃ : c > 0 := hc₁
          have h₂₄ : ∀ x : ℝ, g x = c * x:= by
            --  intro x
            have h₂₅ : g (g x) = a * g x + b * x := hg x
            have h₂₆ : g x = c * x:= by
              --  by_contra h
              have h₂₇ : g x ≠ c * x := h
              have h₂₈ : g (g x) = a * g x + b * x := hg x
              have h₂₉ : g (g x) = a * g x + b * x := hg x
              have h₃₀ : g (g x) = a * g x + b * x := hg x
              have h₃₁ : g (g x) = a * g x + b * x := hg x
              have h₃₂ : c ^ 2 - a * c - b = 0 := hc₂
              have h₃₃ : c > 0 := hc₁
              have h₃₄ : ∃ (y : ℝ), g y ≠ c * y:= by -- exact ⟨x, h₂₇⟩
                hole
              have h₃₅ : False:= by
                --  exfalso
                have h₃₆ : g (g x) = a * g x + b * x := hg x
                have h₃₇ : c ^ 2 - a * c - b = 0 := hc₂
                have h₃₈ : c > 0 := hc₁
                have h₃₉ : g x = c * x:= by
                  --  nlinarith [sq_pos_of_pos h₃₈, sq_nonneg (g x - c * x), sq_nonneg (g x + c * x), sq_nonneg (a - c), sq_nonneg (b - c)]
                  hole
                --  contradiction
                norm_cast
              --  contradiction
              hole
            --  exact h₂₆
            hole
          --  exact h₂₄
          simpa
        --  exact h₂₀
        simpa
      --  exact h₁₉
      simpa
    --  refine' ⟨c, hc₁, hc₂, _⟩
    --  exact h₁₄
    hole
  have h₁₄ : ∃ c : ℝ, ∀ x : ℝ, g x = c * x:=
    by
    --  obtain ⟨c, hc₁, hc₂, hc₃⟩ := h₁₃
    --  refine' ⟨c, _⟩
    --  intro x
    have h₁₅ : g x = c * x := hc₃ x
    --  exact h₁₅
    hole
  --  exact h₁₄
  simpa