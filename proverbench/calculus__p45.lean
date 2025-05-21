theorem trigonometric_integral_result :
∀ x : ℝ, ∃ C : ℝ, ∫ x, integralFunction x = Real.log (abs (Real.tan x - 2)) - Real.log (abs (Real.tan x + 1)) - 2 * Real.log (abs (Real.cos x)) + C := by
  intro x
  have h_main : ∃ (C : ℝ), (∫ x, integralFunction x : ℝ) = Real.log (abs (Real.tan x - 2)) - Real.log (abs (Real.tan x + 1)) - 2 * Real.log (abs (Real.cos x)) + C := by
    use (∫ x, integralFunction x : ℝ) - (Real.log (abs (Real.tan x - 2)) - Real.log (abs (Real.tan x + 1)) - 2 * Real.log (abs (Real.cos x)))
    <;> ring_nf
    <;> simp [integralFunction]
    <;> field_simp [Real.log_mul, Real.log_pow, Real.log_inv, Real.log_div]
    <;> ring_nf
    <;> norm_num
    <;> linarith
  obtain ⟨C, hC⟩ := h_main
  exact ⟨C, by simpa using hC⟩