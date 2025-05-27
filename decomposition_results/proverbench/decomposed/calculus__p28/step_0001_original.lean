theorem area_under_parabola_from_1_to_3  : ∫ (x : ℝ) in Icc 1 3, parabola_fun x = 44 / 3 :=
  by
  have h₀ : parabola_fun = fun x ↦ x ^ 2 + 3 := by sorry
  have h₁ : (∫ x in Icc 1 3, parabola_fun x) = 44 / 3 := by sorry
  rw [h₁] <;> norm_num