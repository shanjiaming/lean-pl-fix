theorem h_final (α : ℝ) (h_main :  {f |      (∀ x ∈ Icc 0 1, f x > 0) ∧        ContinuousOn f (Icc 0 1) ∧          ∫ (x : ℝ) in 0 ..1, f x = 1 ∧ ∫ (x : ℝ) in 0 ..1, x * f x = α ∧ ∫ (x : ℝ) in 0 ..1, x ^ 2 * f x = α ^ 2} =    ∅) : (fun x => ∅) α =
    {f |
      (∀ x ∈ Icc 0 1, f x > 0) ∧
        ContinuousOn f (Icc 0 1) ∧
          ∫ (x : ℝ) in 0 ..1, f x = 1 ∧ ∫ (x : ℝ) in 0 ..1, x * f x = α ∧ ∫ (x : ℝ) in 0 ..1, x ^ 2 * f x = α ^ 2} :=
  by simp only [h_main] <;> simp [Set.ext_iff] <;> aesop
  hole