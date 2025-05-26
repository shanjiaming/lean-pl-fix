theorem integral_sqrt_a2_minus_x2_eq_a2_pi_div_4 (ha : 0 < sorry) : ∫ (x : ℝ) in Set.Icc 0 sorry, √(sorry ^ 2 - x ^ 2) = sorry ^ 2 * π / 4 :=
  by
  have h₁ : (fun x : ℝ => Real.sqrt (a ^ 2 - x ^ 2)) = (fun x => Real.sqrt (a ^ 2 - x ^ 2)) := by sorry
  have h₂ : ∫ x in Set.Icc 0 a, Real.sqrt (a ^ 2 - x ^ 2) = a ^ 2 * Real.pi / 4 := by sorry
  rw [h₂] <;> simp_all [Real.volume_Icc, ha.le] <;> norm_num <;> linarith