theorem h₅₄ (x : ℝ) (hx : x ∈ Set.Ioo 0 8) (h₁ : 0 < x) (h₂ : x < 8) (h₃ : 8 * x - x ^ 2 > 0) (h₄ h₅₁ h₅₂ : HasDerivAt (fun x => 8 * x - x ^ 2) (8 - 2 * x) x) : HasDerivAt (fun y => y ^ (1 / 3)) (1 / 3 * (8 * x - x ^ 2) ^ (-2 / 3)) (8 * x - x ^ 2) :=
  by
  have h₅₅ :
    HasDerivAt (fun y : ℝ => (y : ℝ) ^ (1 / 3 : ℝ)) ((1 / 3 : ℝ) * (8 * x - x ^ 2 : ℝ) ^ ((1 / 3 : ℝ) - 1))
      (8 * x - x ^ 2 : ℝ) := by sorry
  convert h₅₅ using 1 <;> ring_nf <;>
            simp_all [Real.rpow_neg, Real.rpow_add, Real.rpow_sub, Real.rpow_mul, Real.rpow_one] <;>
          field_simp <;>
        ring_nf <;>
      norm_num <;>
    linarith