theorem h₆ (h₂ h₄ : (∫ (x : ℝ) in Set.Ioo 1 3, if x < 2 then 1 else -1) = ∫ (x : ℝ) in Set.Ioo 1 3, if x < 2 then 1 else -1) (h₅ :  (∫ (x : ℝ) in Set.Ioo 1 3, if x < 2 then 1 else -1) =    (∫ (x : ℝ) in Set.Ioo 1 2, if x < 2 then 1 else -1) + ∫ (x : ℝ) in Set.Ioo 2 3, if x < 2 then 1 else -1) : (∫ (x : ℝ) in Set.Ioo 1 2, if x < 2 then 1 else -1) = ∫ (x : ℕ) in Set.Ioo 1 2, 1 :=
  by
  apply integral_congr_ae
  filter_upwards [ae_restrict_mem measurableSet_Ioo] with x hx
  have h₇ : x < 2 := by norm_num at hx ⊢ <;> linarith
  simp [h₇]