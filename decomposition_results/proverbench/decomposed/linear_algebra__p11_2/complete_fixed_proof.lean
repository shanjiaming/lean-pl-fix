theorem det_A_sq_nonneg : det (A * A) ≥ 0:=
  by
  have h₁ : det (A * A) = (det A) ^ 2:= by
    --  rw [det_A_sq] <;> simp [pow_two] <;> ring <;> simp [Matrix.det_fin_two] <;> ring
    hole
  have h₂ : (det A) ^ 2 ≥ 0 :=
    by
    have h₃ : 0 ≤ (det A) ^ 2 := by nlinarith [sq_nonneg (det A)]
    linarith
  have h₃ : det (A * A) ≥ 0:= by
    --  rw [h₁]
    --  exact h₂
    linarith
  have h₂ : (det A) ^ 2 ≥ 0:= by
    have h₃ : 0 ≤ (det A) ^ 2:= by -- nlinarith [sq_nonneg (det A)]
      nlinarith
    --  linarith
    linarith
have det_A_sq_nonneg : det (A * A) ≥ 0 :=
  by
  have h₁ : det (A * A) = (det A) ^ 2 := by sorry
  have h₂ : (det A) ^ 2 ≥ 0 :=
    by
    have h₃ : 0 ≤ (det A) ^ 2 := by nlinarith [sq_nonneg (det A)]
    linarith
  have h₃ : det (A * A) ≥ 0 := by
    rw [h₁]
    exact h₂
  exact h₃
  hole