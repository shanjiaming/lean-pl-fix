lemma positivity_of_square_plus_one (x : ℝ) : 0 < x^2 + 1 := by
  have h₁ : 0 ≤ x^2 := by
    -- Prove that the square of any real number is non-negative.
    nlinarith [sq_nonneg x]
    -- `sq_nonneg x` is a lemma that states `0 ≤ x^2` for any real number `x`.
    -- `nlinarith` is a tactic that can solve this goal using linear arithmetic and the provided lemma.
    <;> nlinarith [sq_nonneg x]
    <;> nlinarith [sq_nonneg x]
    <;> nlinarith [sq_nonneg x]
  
  have h₂ : 0 < x^2 + 1 := by
    -- Prove that the sum of a non-negative number and 1 is strictly positive.
    have h₂₁ : 0 ≤ x^2 := h₁
    have h₂₂ : 0 < x^2 + 1 := by
      -- Use linear arithmetic to prove the inequality.
      nlinarith
    exact h₂₂
  
  exact h₂