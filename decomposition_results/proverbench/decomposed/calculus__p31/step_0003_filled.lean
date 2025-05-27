theorem h₂ (a : ℝ) (ha✝ ha : 0 < a) (h₁ : (fun x => √(a ^ 2 - x ^ 2)) = fun x => √(a ^ 2 - x ^ 2)) : ∫ (x : ℝ) in Set.Icc 0 a, √(a ^ 2 - x ^ 2) = a ^ 2 * π / 4 :=
  by
  have h₃ : ∫ x in (0)..a, Real.sqrt (a ^ 2 - x ^ 2) = a ^ 2 * Real.pi / 4 := by sorry
  have h₄ : ∫ x in Set.Icc 0 a, Real.sqrt (a ^ 2 - x ^ 2) = ∫ x in (0)..a, Real.sqrt (a ^ 2 - x ^ 2) := by sorry
  rw [h₄]
  rw [h₃] <;> simp_all [Real.volume_Icc, ha.le] <;> norm_num <;> linarith
  hole