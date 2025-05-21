lemma T_expression : ∀ (x y : ℤ), T (x, y) = 3 * x - 5 * y := by
  have h_main : ∀ (x y : ℤ), T (x, y) = 3 * x - 5 * y := by
    intro x y
    have h₁ : T (x, y) = T (x • (1, 0) + y • (0, 1)) := by
      -- Prove that (x, y) = x • (1, 0) + y • (0, 1)
      simp [Prod.ext_iff, add_zsmul, mul_comm]
      <;> ring_nf
      <;> simp_all
      <;> omega
    rw [h₁]
    -- Use the additivity of T to split the terms
    have h₂ : T (x • (1, 0) + y • (0, 1)) = T (x • (1, 0)) + T (y • (0, 1)) := by
      apply map_add
    rw [h₂]
    -- Use the scalar multiplication property of T
    have h₃ : T (x • (1, 0)) = x • T (1, 0) := by
      apply map_zsmul
    have h₄ : T (y • (0, 1)) = y • T (0, 1) := by
      apply map_zsmul
    rw [h₃, h₄]
    -- Substitute the given values into the expression
    have h₅ : T (1, 0) = 3 := by
      apply T10
    have h₆ : T (0, 1) = -5 := by
      apply T01
    rw [h₅, h₆]
    -- Simplify the expression
    simp [zsmul_int_int, mul_comm]
    <;> ring_nf
    <;> simp_all
    <;> omega
  exact h_main