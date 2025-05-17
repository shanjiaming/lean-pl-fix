theorem h₆ (S : Finset ℤ) (h₀ : ∀ (x : ℤ), x ∈ S ↔ (↑|x| : ℝ) < 3 * π) (h_pi_lb : 9 < 3 * π) (h_pi_ub : 3 * π < 10) (x : ℤ) (h : (↑|x| : ℝ) < 3 * π) (h₁ : |(↑x : ℝ)| < 3 * π) (h₃ h₅ : x ≤ -10) : |x| ≥ 10 := by
  cases' abs_cases x with h₇ h₇ <;> (try omega) <;>
      (try {norm_cast at h₇ ⊢ <;> omega
        }) <;>
    (try {simp_all [abs_of_nonneg, abs_of_nonpos, le_of_lt] <;> omega
      })