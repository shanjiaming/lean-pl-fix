theorem is_tangent_line : HasDerivAt f (8 * Real.sqrt 3) (π / 3) ∧ f (π / 3) = 8 * Real.sqrt 3 * (π / 3 - π / 3) + 4:=
  by
  have h₁ : HasDerivAt f (8 * Real.sqrt 3) (π / 3):=
    by
    have h₂ : HasDerivAt f (2 * (1 / Real.cos (π / 3)) ^ 2 * Real.tan (π / 3)) (π / 3):= by -- apply derivative_of_f
      hole
    have h₃ : (2 * (1 / Real.cos (π / 3)) ^ 2 * Real.tan (π / 3)) = 8 * Real.sqrt 3 := by
      rw [derivative_value_at_pi_over_3]
    --  rw [h₃] at h₂
    have h₃ : (2 * (1 / Real.cos (π / 3)) ^ 2 * Real.tan (π / 3)) = 8 * Real.sqrt 3:= by -- rw [derivative_value_at_pi_over_3]
      norm_num
  have h₁ : HasDerivAt f (8 * Real.sqrt 3) (π / 3) :=
    by
    have h₂ : HasDerivAt f (2 * (1 / Real.cos (π / 3)) ^ 2 * Real.tan (π / 3)) (π / 3) := by sorry
    have h₃ : (2 * (1 / Real.cos (π / 3)) ^ 2 * Real.tan (π / 3)) = 8 * Real.sqrt 3 := by
      rw [derivative_value_at_pi_over_3]
    rw [h₃] at h₂
    exact h₂
    hole
  have h₂ : f (π / 3) = 8 * Real.sqrt 3 * (π / 3 - π / 3) + 4:=
    by
    have h₃ : f (π / 3) = 4:= by -- rw [value_at_pi_over_3]
      hole
    have h₄ : 8 * Real.sqrt 3 * (π / 3 - π / 3) + 4 = 4:=
      by
      have h₅ : π / 3 - π / 3 = 0:= by -- ring
        norm_num
      --  rw [h₅]
      --  ring_nf <;> simp [Real.sqrt_eq_iff_sq_eq] <;> ring_nf <;> norm_num
      norm_num
    --  rw [h₃, h₄]
    hole
  --  refine' ⟨h₁, h₂⟩
  hole