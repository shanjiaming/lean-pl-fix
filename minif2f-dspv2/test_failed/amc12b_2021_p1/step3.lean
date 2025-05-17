theorem h_pi_ub (S : Finset ℤ) (h₀ : ∀ (x : ℤ), x ∈ S ↔ (↑|x| : ℝ) < 3 * π) (h_pi_lb : 9 < 3 * π) : 3 * π < 10 := by
  have := Real.pi_lt_3141593
  norm_num at this ⊢ <;> linarith