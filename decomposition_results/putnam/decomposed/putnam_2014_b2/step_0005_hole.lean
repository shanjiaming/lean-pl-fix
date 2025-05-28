theorem h₅ (h₂ h₄ : (∫ (x : ℝ) in Set.Ioo 1 3, if x < 2 then 1 else -1) = ∫ (x : ℝ) in Set.Ioo 1 3, if x < 2 then 1 else -1) : (∫ (x : ℝ) in Set.Ioo 1 3, if x < 2 then 1 else -1) =
    (∫ (x : ℝ) in Set.Ioo 1 2, if x < 2 then 1 else -1) + ∫ (x : ℝ) in Set.Ioo 2 3, if x < 2 then 1 else -1 :=
  by
  have h₆ :
    (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ))) =
      (∫ x in Set.Ioo 1 2, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ))) +
        (∫ x in Set.Ioo 2 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ))) := by sorry
  --  rw [h₆]
  hole