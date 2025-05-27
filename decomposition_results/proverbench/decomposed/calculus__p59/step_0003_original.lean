theorem h1 (f✝ : ℝ → ℝ → ℝ) (R✝ : Set (ℝ × ℝ)) (f : ℝ → ℝ → ℝ := fun x y => 11 - 2 * x - 3 * y ^ 2) (R : Set (ℝ × ℝ) := Icc 1 3 ×ˢ Icc (-2) 5) : ∫ (x : ℝ) in Icc 1 3, ∫ (y : ℝ) in Icc (-2) 5, f x y = ∫ (x : ℝ) in Icc 1 3, -14 * x - 56 :=
  by
  apply integral_congr_ae
  filter_upwards [ae_restrict_mem measurableSet_Icc] with x hx
  have h2 : (∫ y in Icc (-2 : ℝ) (5 : ℝ), f x y) = -14 * x - 56 := by sorry
  rw [h2] <;> ring_nf