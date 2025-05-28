theorem h_main (α : ℝ) : {f |
      (∀ x ∈ Icc 0 1, f x > 0) ∧
        ContinuousOn f (Icc 0 1) ∧
          ∫ (x : ℝ) in 0 ..1, f x = 1 ∧ ∫ (x : ℝ) in 0 ..1, x * f x = α ∧ ∫ (x : ℝ) in 0 ..1, x ^ 2 * f x = α ^ 2} =
    ∅ :=
  by
  apply Set.eq_empty_of_forall_not_mem
  intro f hf
  have h₁ : (∀ x ∈ Icc 0 1, f x > 0) := hf.1
  have h₂ : ContinuousOn f (Icc 0 1) := hf.2.1
  have h₃ : ∫ x in (0)..1, f x = 1 := hf.2.2.1
  have h₄ : ∫ x in (0)..1, x * f x = α := hf.2.2.2.1
  have h₅ : ∫ x in (0)..1, x ^ 2 * f x = α ^ 2 := hf.2.2.2.2
  have h₆ : ∫ x in (0)..1, (x - α) ^ 2 * f x = 0 := by sorry
  have h₇ : ∀ x ∈ Icc 0 1, (x - α) ^ 2 * f x = 0 := by sorry
  have h₈ : ∀ x ∈ Icc 0 1, x = α := by sorry
  have h₉ : (0 : ℝ) = 1 := by sorry
  norm_num at h₉ <;> linarith