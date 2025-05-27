theorem integral_over_rectangle_equals_minus_168 :
  let f:= fun x y => 11 - 2 * x - 3 * y ^ 2;
  let R := Icc 1 3 ×ˢ Icc (-2) 5;
  ∫ (x : ℝ) in Icc 1 3, ∫ (y : ℝ) in Icc (-2) 5, f x y = -168 := fun x y => 11 - 2 * x - 3 * y ^ 2
  let R := Icc (1 : ℝ) (3 : ℝ) ×ˢ Icc (-2 : ℝ) (5 : ℝ)
  ∫ x in Icc (1 : ℝ) (3 : ℝ), ∫ y in Icc (-2 : ℝ) (5 : ℝ), f x y = -168 :=
  by
  intro f R
  have h_inner_integral : (∫ x in Icc (1 : ℝ) (3 : ℝ), ∫ y in Icc (-2 : ℝ) (5 : ℝ), f x y) = -168:= fun x y => 11 - 2 * x - 3 * y ^ 2) (R : Set (ℝ × ℝ) := Icc 1 3 ×ˢ Icc (-2) 5) : ∫ (x : ℝ) in Icc 1 3, ∫ (y : ℝ) in Icc (-2) 5, f x y = -168 :=
    by
    have h1 :
      (∫ x in Icc (1 : ℝ) (3 : ℝ), ∫ y in Icc (-2 : ℝ) (5 : ℝ), f x y) = ∫ x in Icc (1 : ℝ) (3 : ℝ), (-14 * x - 56) := by sorry
    rw [h1]
    have h2 : (∫ x in Icc (1 : ℝ) (3 : ℝ), (-14 * x - 56)) = -168:= fun x y => 11 - 2 * x - 3 * y ^ 2) (R : Set (ℝ × ℝ) := Icc 1 3 ×ˢ Icc (-2) 5) (h1 : ∫ (x : ℝ) in Icc 1 3, ∫ (y : ℝ) in Icc (-2) 5, f x y = ∫ (x : ℝ) in Icc 1 3, -14 * x - 56) : ∫ (x : ℝ) in Icc 1 3, -14 * x - 56 = -168 :=
      by
      have h3 : (∫ x in Icc (1 : ℝ) (3 : ℝ), (-14 * x - 56)) = (∫ x in (1 : ℝ)..(3 : ℝ), (-14 * x - 56)):= fun x y => 11 - 2 * x - 3 * y ^ 2) (R : Set (ℝ × ℝ) := Icc 1 3 ×ˢ Icc (-2) 5) (h1 : ∫ (x : ℝ) in Icc 1 3, ∫ (y : ℝ) in Icc (-2) 5, f x y = ∫ (x : ℝ) in Icc 1 3, -14 * x - 56) : ∫ (x : ℝ) in Icc 1 3, -14 * x - 56 = ∫ (x : ℝ) in 1 ..3, -14 * x - 56 := by
        simp [intervalIntegral.integral_congr]
        hole
      rw [h3]
      have h4 : (∫ x in (1 : ℝ)..(3 : ℝ), (-14 * x - 56)) = (-168 : ℝ):= fun x y => 11 - 2 * x - 3 * y ^ 2) (R : Set (ℝ × ℝ) := Icc 1 3 ×ˢ Icc (-2) 5) (h1 : ∫ (x : ℝ) in Icc 1 3, ∫ (y : ℝ) in Icc (-2) 5, f x y = ∫ (x : ℝ) in Icc 1 3, -14 * x - 56) (h3 : ∫ (x : ℝ) in Icc 1 3, -14 * x - 56 = ∫ (x : ℝ) in 1 ..3, -14 * x - 56) : ∫ (x : ℝ) in 1 ..3, -14 * x - 56 = -168 := by
        norm_num [intervalIntegral.integral_comp_sub_left, mul_comm] <;> ring_nf <;> norm_num <;> linarith
        hole
      rw [h4]
      hole
    rw [h2] <;> ring_nf <;> norm_num <;> linarith
    hole
  exact h_inner_integral
  hole