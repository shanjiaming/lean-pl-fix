theorem h_inner_integral (f✝ : ℝ → ℝ → ℝ) (R✝ : Set (ℝ × ℝ)) (f : ℝ → ℝ → ℝ := fun x y => 11 - 2 * x - 3 * y ^ 2) (R : Set (ℝ × ℝ) := Icc 1 3 ×ˢ Icc (-2) 5) : ∫ (x : ℝ) in Icc 1 3, ∫ (y : ℝ) in Icc (-2) 5, f x y = -168 :=
  by
  have h1 :
    (∫ x in Icc (1 : ℝ) (3 : ℝ), ∫ y in Icc (-2 : ℝ) (5 : ℝ), f x y) = ∫ x in Icc (1 : ℝ) (3 : ℝ), (-14 * x - 56) := by sorry
  rw [h1]
  have h2 : (∫ x in Icc (1 : ℝ) (3 : ℝ), (-14 * x - 56)) = -168 := by sorry
  rw [h2] <;> ring_nf <;> norm_num <;> linarith
  hole