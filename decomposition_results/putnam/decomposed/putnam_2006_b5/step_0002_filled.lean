theorem h₁ (I J : (ℝ → ℝ) → ℝ) (hI : I = fun f => ∫ (x : ℝ) in 0 ..1, x ^ 2 * f x) (hJ : J = fun f => ∫ (x : ℝ) in 0 ..1, x * f x ^ 2) : 1 / 16 ∈ {y | ∃ f, ContinuousOn f sorry ∧ I f - J f = y} :=
  by
  use fun x => x / 2
  constructor
  · apply ContinuousOn.div
    · exact continuousOn_id
    · exact continuousOn_const
    · intro x hx
      norm_num at hx ⊢ <;> linarith
  · rw [hI, hJ]
    have h₂ : (∫ x in (0)..1, x ^ 2 * ((fun x => x / 2 : ℝ → ℝ) x)) = 1 / 8 := by sorry
    have h₃ : (∫ x in (0)..1, x * ((fun x => x / 2 : ℝ → ℝ) x) ^ 2) = 1 / 16 := by sorry
    rw [h₂, h₃] <;> norm_num
  hole