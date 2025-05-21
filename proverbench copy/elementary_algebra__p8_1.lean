theorem given_equality_holds : LHS = RHS := by
  have h₁ : Real.sqrt 65 = Real.sqrt 5 * Real.sqrt 13 := by
    have h₁₁ : Real.sqrt 65 = Real.sqrt (5 * 13) := by norm_num
    rw [h₁₁]
    have h₁₂ : Real.sqrt (5 * 13) = Real.sqrt 5 * Real.sqrt 13 := by
      rw [Real.sqrt_eq_iff_sq_eq (by positivity) (by positivity)]
      nlinarith [Real.sqrt_nonneg 5, Real.sqrt_nonneg 13, Real.sq_sqrt (show 0 ≤ 5 by norm_num),
        Real.sq_sqrt (show 0 ≤ 13 by norm_num)]
    rw [h₁₂]
    <;> ring_nf
    <;> field_simp
    <;> ring_nf
  
  have h₂ : RHS = (2 * Real.sqrt 13 - 5 * (Real.sqrt 5 * Real.sqrt 13)) / 52 := by
    rw [RHS]
    rw [h₁]
    <;>
    ring
    <;>
    field_simp
    <;>
    ring
  
  have h₃ : RHS = (2 - 5 * Real.sqrt 5) * Real.sqrt 13 / 52 := by
    rw [h₂]
    have h₄ : 2 * Real.sqrt 13 - 5 * (Real.sqrt 5 * Real.sqrt 13) = (2 - 5 * Real.sqrt 5) * Real.sqrt 13 := by
      ring_nf
      <;>
      linarith [Real.sqrt_nonneg 5, Real.sqrt_nonneg 13]
    rw [h₄]
    <;>
    ring_nf
    <;>
    field_simp
    <;>
    ring_nf
  
  have h₄ : LHS = (2 - 5 * Real.sqrt 5) / (4 * Real.sqrt 13) := by
    rw [LHS]
    <;>
    ring_nf
    <;>
    field_simp
    <;>
    ring_nf
  
  have h₅ : LHS = (2 - 5 * Real.sqrt 5) * Real.sqrt 13 / 52 := by
    rw [h₄]
    have h₅₁ : (2 - 5 * Real.sqrt 5) / (4 * Real.sqrt 13) = (2 - 5 * Real.sqrt 5) * Real.sqrt 13 / 52 := by
      have h₅₂ : 0 < Real.sqrt 13 := Real.sqrt_pos.mpr (by norm_num)
      have h₅₃ : 0 < Real.sqrt 5 := Real.sqrt_pos.mpr (by norm_num)
      have h₅₄ : 0 < Real.sqrt 13 * Real.sqrt 5 := by positivity
      field_simp [h₅₂.ne', h₅₃.ne', h₅₄.ne']
      <;> ring_nf
      <;> field_simp [Real.sqrt_eq_iff_sq_eq, mul_comm, mul_assoc, mul_left_comm]
      <;> nlinarith [Real.sq_sqrt (show 0 ≤ 13 by norm_num), Real.sq_sqrt (show 0 ≤ 5 by norm_num),
        Real.sq_sqrt (show 0 ≤ 65 by norm_num)]
    rw [h₅₁]
    <;>
    ring_nf
    <;>
    field_simp
    <;>
    ring_nf
  
  have h₆ : LHS = RHS := by
    rw [h₅, h₃]
    <;>
    ring_nf
    <;>
    field_simp
    <;>
    ring_nf
  
  rw [h₆]
  <;>
  ring_nf
  <;>
  field_simp
  <;>
  ring_nf