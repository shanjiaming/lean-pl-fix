lemma verify_solution : (4, -4, -2) ∈ {x : ℚ × ℚ × ℚ |
-19 * x.1 + 8 * x.2.1 = -108 ∧
-71 * x.1 + 30 * x.2.1 = -404 ∧
-2 * x.1 + x.2.1 = -12 ∧
4 * x.1 + x.2.2 = 14} := by
  have h₁ : -19 * (4 : ℚ) + 8 * (-4 : ℚ) = -108 := by
    norm_num
    <;> ring_nf
    <;> norm_num
    <;> rfl
  
  have h₂ : -71 * (4 : ℚ) + 30 * (-4 : ℚ) = -404 := by
    norm_num
    <;> ring_nf
    <;> norm_num
    <;> rfl
  
  have h₃ : -2 * (4 : ℚ) + (-4 : ℚ) = -12 := by
    norm_num
    <;> ring_nf
    <;> norm_num
    <;> rfl
  
  have h₄ : 4 * (4 : ℚ) + (-2 : ℚ) = 14 := by
    norm_num
    <;> ring_nf
    <;> norm_num
    <;> rfl
  
  have h_main : (4, -4, -2) ∈ {x : ℚ × ℚ × ℚ | -19 * x.1 + 8 * x.2.1 = -108 ∧ -71 * x.1 + 30 * x.2.1 = -404 ∧ -2 * x.1 + x.2.1 = -12 ∧ 4 * x.1 + x.2.2 = 14} := by
    -- We need to verify that the tuple (4, -4, -2) satisfies all four equations.
    -- This is done by checking each equation one by one.
    simp only [Set.mem_setOf_eq, Prod.mk.injEq]
    -- Simplify the set membership condition to check each equation.
    constructor
    · -- Verify the first equation: -19 * x + 8 * y = -108
      exact h₁
    constructor
    · -- Verify the second equation: -71 * x + 30 * y = -404
      exact h₂
    constructor
    · -- Verify the third equation: -2 * x + y = -12
      exact h₃
    · -- Verify the fourth equation: 4 * x + z = 14
      exact h₄
  
  exact h_main