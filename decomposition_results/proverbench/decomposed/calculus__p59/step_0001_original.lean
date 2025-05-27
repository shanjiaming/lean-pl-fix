theorem integral_over_rectangle_equals_minus_168 (f : ℝ → ℝ → ℝ) (R : Set (ℝ × ℝ)) : let f := fun x y => 11 - 2 * x - 3 * y ^ 2;
  let R := Icc 1 3 ×ˢ Icc (-2) 5;
  ∫ (x : ℝ) in Icc 1 3, ∫ (y : ℝ) in Icc (-2) 5, f x y = -168 := fun x y => 11 - 2 * x - 3 * y ^ 2
  let R := Icc (1 : ℝ) (3 : ℝ) ×ˢ Icc (-2 : ℝ) (5 : ℝ)
  ∫ x in Icc (1 : ℝ) (3 : ℝ), ∫ y in Icc (-2 : ℝ) (5 : ℝ), f x y = -168 :=
  by
  intro f R
  have h_inner_integral : (∫ x in Icc (1 : ℝ) (3 : ℝ), ∫ y in Icc (-2 : ℝ) (5 : ℝ), f x y) = -168 := by sorry
  exact h_inner_integral