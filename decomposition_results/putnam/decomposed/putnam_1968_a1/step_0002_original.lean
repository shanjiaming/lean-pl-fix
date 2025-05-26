theorem h₀  : ∫ (x : ℝ) in 0 ..1, x ^ 4 * (1 - x) ^ 4 / (1 + x ^ 2) = 22 / 7 - π :=
  by
  have h₁ :
    (∫ x in (0)..1, (x ^ 4 * (1 - x) ^ 4 / (1 + x ^ 2))) =
      ∫ x in (0)..1, (x ^ 6 - 4 * x ^ 5 + 5 * x ^ 4 - 4 * x ^ 2 + 4 - 4 / (1 + x ^ 2)) := by sorry
  rw [h₁]
  have h₂ : (∫ x in (0)..1, (x ^ 6 - 4 * x ^ 5 + 5 * x ^ 4 - 4 * x ^ 2 + 4 - 4 / (1 + x ^ 2) : ℝ)) = 22 / 7 - Real.pi := by sorry
  rw [h₂] <;> ring_nf <;> linarith [Real.pi_pos]