theorem putnam_1986_a1
    (S : Set ℝ) (f : ℝ → ℝ)
    (hS : S = {x : ℝ | x ^ 4 + 36 ≤ 13 * x ^ 2})
    (hf : f = fun x ↦ x ^ 3 - 3 * x) :
    IsGreatest
    {f x | x ∈ S}
    ((18) : ℝ ) := by
  have h₁ : (18 : ℝ) ∈ {f x | x ∈ S} := by
    rw [hf]
    rw [hS]
    have h₂ : (3 : ℝ) ∈ {x : ℝ | x ^ 4 + 36 ≤ 13 * x ^ 2} := by
      norm_num [Set.mem_setOf_eq]
    refine' ⟨3, h₂, _⟩
    norm_num
  
  have h₂ : ∀ y ∈ {f x | x ∈ S}, y ≤ (18 : ℝ) := by
    intro y hy
    rw [hf] at hy
    rw [hS] at hy
    rcases hy with ⟨x, hx, rfl⟩
    have h₃ : x ^ 4 + 36 ≤ 13 * x ^ 2 := by exact hx
    have h₄ : x ^ 2 ≤ 9 := by
      nlinarith [sq_nonneg (x ^ 2 - 9), sq_nonneg (x ^ 2 - 4)]
    have h₅ : x ^ 2 ≥ 4 := by
      nlinarith [sq_nonneg (x ^ 2 - 9), sq_nonneg (x ^ 2 - 4)]
    have h₆ : x ≤ 3 := by
      nlinarith
    have h₇ : x ≥ -3 := by
      nlinarith
    -- We need to show that x ^ 3 - 3 * x ≤ 18
    have h₈ : x ^ 3 - 3 * x ≤ 18 := by
      -- Consider the cases where x ≥ 0 or x < 0
      by_cases hx' : x ≥ 0
      · -- Case: x ≥ 0
        have h₈₁ : x ≤ 3 := by nlinarith
        have h₈₂ : x ≥ 0 := by assumption
        have h₈₃ : x ^ 3 - 3 * x ≤ 18 := by
          nlinarith [sq_nonneg (x - 3), sq_nonneg (x + 3), sq_nonneg (x - 2), sq_nonneg (x + 2)]
        exact h₈₃
      · -- Case: x < 0
        have h₈₁ : x ≤ 0 := by linarith
        have h₈₂ : x ≥ -3 := by nlinarith
        have h₈₃ : x ^ 3 - 3 * x ≤ 18 := by
          nlinarith [sq_nonneg (x - 3), sq_nonneg (x + 3), sq_nonneg (x - 2), sq_nonneg (x + 2),
            mul_nonneg (sub_nonneg.mpr h₅) (sub_nonneg.mpr h₈₁)]
        exact h₈₃
    exact h₈
  
  exact ⟨h₁, h₂⟩