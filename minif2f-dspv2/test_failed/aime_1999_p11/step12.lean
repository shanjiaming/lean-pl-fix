theorem h₆ (m : ℚ) (h₀ : 0 < m) (h₁ : ∑ k ∈ Finset.Icc 1 35, sin (5 * (↑k : ℝ) * π / 180) = tan ((↑m : ℝ) * π / 180)) (h₂ : (↑m.num : ℝ) / (↑m.den : ℝ) < 90) (h₃ :  2 * sin (2.5 * π / 180) * ∑ k ∈ Finset.Icc 1 35, sin (5 * (↑k : ℝ) * π / 180) =    ∑ k ∈ Finset.Icc 1 35, 2 * sin (2.5 * π / 180) * sin (5 * (↑k : ℝ) * π / 180)) (h₄ :  ∀ k ∈ Finset.Icc 1 35,    2 * sin (2.5 * π / 180) * sin (5 * (↑k : ℝ) * π / 180) =      cos ((5 * (↑k : ℝ) - 2.5) * π / 180) - cos ((5 * (↑k : ℝ) + 2.5) * π / 180)) (h₅ :  ∑ k ∈ Finset.Icc 1 35, 2 * sin (2.5 * π / 180) * sin (5 * (↑k : ℝ) * π / 180) =    ∑ k ∈ Finset.Icc 1 35, (cos ((5 * (↑k : ℝ) - 2.5) * π / 180) - cos ((5 * (↑k : ℝ) + 2.5) * π / 180))) : ∑ k ∈ Finset.Icc 1 35, (cos ((5 * (↑k : ℝ) - 2.5) * π / 180) - cos ((5 * (↑k : ℝ) + 2.5) * π / 180)) =
    cos (2.5 * π / 180) - cos (177.5 * π / 180) :=
  by
  norm_num [Finset.sum_Icc_succ_top, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_ofNat] <;> ring_nf at * <;>
            norm_num <;>
          field_simp at * <;>
        ring_nf at * <;>
      norm_num at * <;>
    linarith