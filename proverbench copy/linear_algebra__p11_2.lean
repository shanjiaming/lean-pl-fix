theorem det_A_sq_nonneg : det (A * A) ≥ 0 := by
  have h₁ : det (A * A) = (det A) ^ 2 := by
    rw [det_A_sq]
    <;>
    simp [pow_two]
    <;>
    ring
    <;>
    simp [Matrix.det_fin_two]
    <;>
    ring
  
  have h₂ : (det A) ^ 2 ≥ 0 := by
    have h₃ : 0 ≤ (det A) ^ 2 := by
      -- Use the fact that the square of any real number is non-negative.
      nlinarith [sq_nonneg (det A)]
    -- Use the previously established inequality to conclude the proof.
    linarith
  
  have h₃ : det (A * A) ≥ 0 := by
    rw [h₁]
    exact h₂
  
  exact h₃