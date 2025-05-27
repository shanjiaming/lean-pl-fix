theorem h4 (f✝ : ℝ → ℝ → ℝ) (R✝ : Set (ℝ × ℝ)) (f : ℝ → ℝ → ℝ := fun x y => 11 - 2 * x - 3 * y ^ 2) (R : Set (ℝ × ℝ) := Icc 1 3 ×ˢ Icc (-2) 5) (x : ℝ) (hx : x ∈ Icc 1 3) (h3 : ∫ (y : ℝ) in Icc (-2) 5, f x y = ∫ (y : ℝ) in Icc (-2) 5, 11 - 2 * x - 3 * y ^ 2) : ∫ (y : ℝ) in Icc (-2) 5, 11 - 2 * x - 3 * y ^ 2 = -14 * x - 56 :=
  by
  have h5 :
    (∫ y in Icc (-2 : ℝ) (5 : ℝ), (11 - 2 * x - 3 * y ^ 2)) = (∫ y in (-2 : ℝ)..(5 : ℝ), (11 - 2 * x - 3 * y ^ 2)) := by sorry
  rw [h5]
  have h6 : (∫ y in (-2 : ℝ)..(5 : ℝ), (11 - 2 * x - 3 * y ^ 2)) = (-14 * x - 56 : ℝ) := by sorry
  rw [h6]
  hole