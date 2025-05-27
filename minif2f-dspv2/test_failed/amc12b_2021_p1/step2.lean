theorem h_pi_lb (S : Finset ℤ) (h₀ : ∀ (x : ℤ), x ∈ S ↔ (↑|x| : ℝ) < 3 * π) : 9 < 3 * π := by
  have := Real.pi_gt_3141592
  norm_num at this ⊢ <;> linarith