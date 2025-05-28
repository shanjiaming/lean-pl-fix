theorem h₁  : (∫ (x : ℝ) in Set.Ioo 1 3, if x < 2 then 1 else -1) = 0 :=
  by
  have h₂ :
    (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ))) =
      (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ))) :=
    rfl
  --  rw [h₂]
  have h₃ :
    (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ))) =
      (∫ x in Set.Ioo 1 2, (1 : ℝ)) + (∫ x in Set.Ioo 2 3, (-1 : ℝ)) := by sorry
  rw [h₃]
  have h₄ : (∫ x in Set.Ioo 1 2, (1 : ℝ)) = 1 := by
    norm_num [Real.volume_Ioo, Real.volume_Icc, Real.volume_Ioc, Real.volume_Ico] <;> simp_all [integral_id] <;>
        norm_num <;>
      linarith
  have h₅ : (∫ x in Set.Ioo 2 3, (-1 : ℝ)) = -1 := by
    norm_num [Real.volume_Ioo, Real.volume_Icc, Real.volume_Ioc, Real.volume_Ico] <;> simp_all [integral_id] <;>
        norm_num <;>
      linarith
  rw [h₄, h₅] <;> norm_num
  hole