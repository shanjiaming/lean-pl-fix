theorem h2 (f✝ : ℝ → ℝ → ℝ) (R✝ : Set (ℝ × ℝ)) (f : ℝ → ℝ → ℝ := fun x y => 11 - 2 * x - 3 * y ^ 2) (R : Set (ℝ × ℝ) := Icc 1 3 ×ˢ Icc (-2) 5) (x : ℝ) (hx : x ∈ Icc 1 3) : ∫ (y : ℝ) in Icc (-2) 5, f x y = -14 * x - 56 :=
  by
  have h3 : (∫ y in Icc (-2 : ℝ) (5 : ℝ), f x y) = (∫ y in Icc (-2 : ℝ) (5 : ℝ), (11 - 2 * x - 3 * y ^ 2)) := rfl
  rw [h3]
  have h4 : (∫ y in Icc (-2 : ℝ) (5 : ℝ), (11 - 2 * x - 3 * y ^ 2)) = -14 * x - 56 := by sorry
  rw [h4]