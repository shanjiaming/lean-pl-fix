theorem graphSatisfiesAvgVelocity : (2.5 - 2) * -32 = heightFunction 2.5 - heightFunction 2:=
  by
  have h₁ : (2.5 - 2 : ℝ) ≠ 0:= by -- -- norm_num <;> simp_all [heightFunction] <;> norm_num <;> linarith
    hole
  have h₂ : heightFunction 2.5 - heightFunction 2 = (2.5 - 2 : ℝ) * -32:=
    by
    have h₃ : (heightFunction 2.5 - heightFunction 2 : ℝ) / (2.5 - 2 : ℝ) = -32 := averageVelocity
    have h₄ : (heightFunction 2.5 - heightFunction 2 : ℝ) = -32 * (2.5 - 2 : ℝ):=
      by
      have h₅ : (heightFunction 2.5 - heightFunction 2 : ℝ) = -32 * (2.5 - 2 : ℝ):=
        by
        have h₆ : (2.5 - 2 : ℝ) ≠ 0 := h₁
        --  field_simp [h₆] at h₃ ⊢ <;> ring_nf at h₃ ⊢ <;> nlinarith
        hole
      --  exact h₅
      hole
    have h₅ : (heightFunction 2.5 - heightFunction 2 : ℝ) = (2.5 - 2 : ℝ) * -32:= by -- rw [h₄] <;> ring <;> norm_num
      hole
    --  exact h₅
    hole
  have h₃ : (2.5 - 2 : ℝ) * -32 = heightFunction 2.5 - heightFunction 2:= by -- rw [h₂] <;> ring_nf at * <;> linarith
    hole
  --  simpa using h₃
  hole