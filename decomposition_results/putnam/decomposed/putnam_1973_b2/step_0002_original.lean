theorem h_main (z : ℂ) (hzrat : ∃ q1 q2, z.re = (↑q1 : ℝ) ∧ z.im = (↑q2 : ℝ)) (hznorm : ‖z‖ = 1) : ∀ (n : ℤ), ∃ q, ‖z ^ (2 * n) - 1‖ = (↑q : ℝ) :=
  by
  intro n
  have h₁ : ‖z ^ (2 * n) - 1‖ = ‖z ^ n - (star z) ^ n‖ := by sorry
  rw [h₁]
  have h₂ : ∃ q : ℚ, ‖z ^ n - (star z) ^ n‖ = q := by sorry
  obtain ⟨q, hq⟩ := h₂
  refine' ⟨q, _⟩
  rw [hq] <;> simp [Complex.ext_iff, pow_two, mul_comm, mul_assoc, mul_left_comm] <;> norm_num <;>
        simp_all [Complex.ext_iff, pow_two, mul_comm, mul_assoc, mul_left_comm] <;>
      norm_num <;>
    linarith