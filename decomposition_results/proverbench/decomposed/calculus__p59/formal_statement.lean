theorem integral_over_rectangle_equals_minus_168 :
  let f := fun x y => 11 - 2 * x - 3 * y^2
  let R := Icc (1 : ℝ) (3 : ℝ) ×ˢ Icc (-2 : ℝ) (5 : ℝ)
  ∫ x in Icc (1 : ℝ) (3 : ℝ), ∫ y in Icc (-2 : ℝ) (5 : ℝ), f x y = -168 :=