theorem sum_of_coefficients (α β : ℝ) : add_vec (smul α v2) (smul β v3) = v1 → α + β = 18 :=
  by
  intro h
  have h₁ : -2 * α + 6 * β = 52 := by sorry