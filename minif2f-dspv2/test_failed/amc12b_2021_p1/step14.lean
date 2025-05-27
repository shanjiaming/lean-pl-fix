theorem h₇ (S : Finset ℤ) (h₀ : ∀ (x : ℤ), x ∈ S ↔ (↑|x| : ℝ) < 3 * π) (h_pi_lb : 9 < 3 * π) (h_pi_ub : 3 * π < 10) (x : ℤ) (h : (↑|x| : ℝ) < 3 * π) (h₁ : |(↑x : ℝ)| < 3 * π) (h₂ : -9 ≤ x) (h₄ h₆ : x ≥ 10) : |x| ≥ 10 := by
  cases' abs_cases x with h₈ h₈ <;> (try omega) <;>
      (try {norm_cast at h₈ ⊢ <;> omega
        }) <;>
    (try {simp_all [abs_of_nonneg, abs_of_nonpos, le_of_lt] <;> omega
      })