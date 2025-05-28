theorem putnam_1988_b2 : (∀ x y : ℝ, (y ≥ 0 ∧ y * (y + 1) ≤ (x + 1) ^ 2) → (y * (y - 1) ≤ x ^ 2)) ↔ ((True) : Prop):=
  by
  have h_main : (∀ x y : ℝ, (y ≥ 0 ∧ y * (y + 1) ≤ (x + 1) ^ 2) → (y * (y - 1) ≤ x ^ 2)):=
    by
    --  intro x y h
    have h₁ : y ≥ 0 := h.1
    have h₂ : y * (y + 1) ≤ (x + 1) ^ 2 := h.2
    --  by_cases h₃ : y ≤ 1
    ·
      have h₄ : y * (y - 1) ≤ 0:= by -- nlinarith
        nlinarith
      have h₅ : y * (y - 1) ≤ x ^ 2:= by -- nlinarith [sq_nonneg x]
        nlinarith
    --    exact h₅
    ·
      have h₄ : y > 1 := by sorry
      have h₅ : (x + 1) ^ 2 ≥ y * (y + 1) := by sorry
      have h₆ : x + 1 ≥ Real.sqrt (y * (y + 1)) ∨ x + 1 ≤ -Real.sqrt (y * (y + 1)):=
        by
        have h₇ : (x + 1) ^ 2 ≥ y * (y + 1):= by -- linarith
          linarith
        have h₈ : x + 1 ≥ Real.sqrt (y * (y + 1)) ∨ x + 1 ≤ -Real.sqrt (y * (y + 1)):=
          by
          have h₉ : Real.sqrt (y * (y + 1)) ≥ 0 := Real.sqrt_nonneg (y * (y + 1))
          have h₁₀ : (x + 1) ^ 2 ≥ (Real.sqrt (y * (y + 1))) ^ 2:= by
            --  nlinarith [Real.sq_sqrt (show 0 ≤ y * (y + 1) by nlinarith)]
            hole
          have h₁₁ : x + 1 ≥ Real.sqrt (y * (y + 1)) ∨ x + 1 ≤ -Real.sqrt (y * (y + 1)):=
            by
            --  by_cases h₁₂ : x + 1 ≥ Real.sqrt (y * (y + 1))
            --  · exact Or.inl h₁₂
            ·
              have h₁₃ : x + 1 < Real.sqrt (y * (y + 1)):= by -- linarith
                linarith
              have h₁₄ : x + 1 ≤ -Real.sqrt (y * (y + 1)):= by
                --  nlinarith [Real.sqrt_nonneg (y * (y + 1)), Real.sq_sqrt (show 0 ≤ y * (y + 1) by nlinarith)]
                nlinarith
            --    exact Or.inr h₁₄
            hole
          --  exact h₁₁
          simpa
        --  exact h₈
        simpa
    --    cases h₆ with
    --    | inl h₆ =>
    --      have h₇ : x ≥ -1 + Real.sqrt (y * (y + 1)) := by linarith
    --      have h₈ : x ^ 2 ≥ (-1 + Real.sqrt (y * (y + 1))) ^ 2 := by
    --        nlinarith [Real.sqrt_nonneg (y * (y + 1)), Real.sq_sqrt (show 0 ≤ y * (y + 1) by nlinarith)]
    --      have h₉ : y * (y - 1) ≤ x ^ 2 :=
    --        by
    --        have h₁₀ : (-1 + Real.sqrt (y * (y + 1))) ^ 2 = 1 - 2 * Real.sqrt (y * (y + 1)) + y * (y + 1) := by
    --          nlinarith [Real.sq_sqrt (show 0 ≤ y * (y + 1) by nlinarith), Real.sqrt_nonneg (y * (y + 1))]
    --        have h₁₁ : y * (y - 1) ≤ 1 - 2 * Real.sqrt (y * (y + 1)) + y * (y + 1) :=
    --          by
    --          have h₁₂ : Real.sqrt (y * (y + 1)) < y + 1 / 2 := by
    --            nlinarith [Real.sq_sqrt (show 0 ≤ y * (y + 1) by nlinarith), sq_nonneg (y - 1 / 2)]
    --          nlinarith [Real.sq_sqrt (show 0 ≤ y * (y + 1) by nlinarith), Real.sqrt_nonneg (y * (y + 1))]
    --        nlinarith
    --      exact h₉
    --    | inr h₆ =>
    --      have h₇ : x ≤ -1 - Real.sqrt (y * (y + 1)) := by linarith
    --      have h₈ : x ^ 2 ≥ (-1 - Real.sqrt (y * (y + 1))) ^ 2 := by
    --        nlinarith [Real.sqrt_nonneg (y * (y + 1)), Real.sq_sqrt (show 0 ≤ y * (y + 1) by nlinarith)]
    --      have h₉ : y * (y - 1) ≤ x ^ 2 :=
    --        by
    --        have h₁₀ : (-1 - Real.sqrt (y * (y + 1))) ^ 2 = 1 + 2 * Real.sqrt (y * (y + 1)) + y * (y + 1) := by
    --          nlinarith [Real.sq_sqrt (show 0 ≤ y * (y + 1) by nlinarith), Real.sqrt_nonneg (y * (y + 1))]
    --        have h₁₁ : y * (y - 1) ≤ 1 + 2 * Real.sqrt (y * (y + 1)) + y * (y + 1) := by
    --          nlinarith [Real.sq_sqrt (show 0 ≤ y * (y + 1) by nlinarith), Real.sqrt_nonneg (y * (y + 1))]
    --        nlinarith
    --      exact h₉
    hole
  have h_final : (∀ x y : ℝ, (y ≥ 0 ∧ y * (y + 1) ≤ (x + 1) ^ 2) → (y * (y - 1) ≤ x ^ 2)) ↔ True:=
    by
    --  constructor
    --  · intro h
    --    trivial
    --  · intro h
    --    exact h_main
    hole
  --  exact h_final
  norm_cast