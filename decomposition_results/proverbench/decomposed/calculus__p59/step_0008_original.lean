theorem h2 (f✝ : ℝ → ℝ → ℝ) (R✝ : Set (ℝ × ℝ)) (f : ℝ → ℝ → ℝ := fun x y => 11 - 2 * x - 3 * y ^ 2) (R : Set (ℝ × ℝ) := Icc 1 3 ×ˢ Icc (-2) 5) (h1 : ∫ (x : ℝ) in Icc 1 3, ∫ (y : ℝ) in Icc (-2) 5, f x y = ∫ (x : ℝ) in Icc 1 3, -14 * x - 56) : ∫ (x : ℝ) in Icc 1 3, -14 * x - 56 = -168 :=
  by
  have h3 : (∫ x in Icc (1 : ℝ) (3 : ℝ), (-14 * x - 56)) = (∫ x in (1 : ℝ)..(3 : ℝ), (-14 * x - 56)) := by sorry
  rw [h3]
  have h4 : (∫ x in (1 : ℝ)..(3 : ℝ), (-14 * x - 56)) = (-168 : ℝ) := by sorry
  rw [h4]