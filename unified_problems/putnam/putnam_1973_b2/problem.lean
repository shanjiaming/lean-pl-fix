theorem putnam_1973_b2
(z : ℂ)
(hzrat : ∃ q1 q2 : ℚ, z.re = q1 ∧ z.im = q2)
(hznorm : ‖z‖ = 1)
: ∀ n : ℤ, ∃ q : ℚ, ‖z^(2*n) - 1‖ = q := by
  have h_main : ∀ n : ℤ, ∃ q : ℚ, ‖z^(2*n) - 1‖ = q := by
    intro n
    have h₁ : ‖z^(2*n) - 1‖ = ‖z^n - (star z)^n‖ := by
      have h₂ : z ^ (2 * n) - 1 = z ^ n * (z ^ n - (star z) ^ n) := by
        have h₃ : z ^ (2 * n) = (z ^ n) ^ 2 := by
          rw [mul_comm]
          simp [zpow_mul, zpow_ofNat]
          <;> ring_nf
          <;> simp [Complex.ext_iff, pow_two, mul_comm, mul_assoc, mul_left_comm]
          <;> norm_num
          <;> ring_nf
          <;> simp [Complex.ext_iff, pow_two, mul_comm, mul_assoc, mul_left_comm]
          <;> norm_num
        have h₄ : (star z) ^ n = star (z ^ n) := by
          simp [star_pow]
        calc
          z ^ (2 * n) - 1 = (z ^ n) ^ 2 - 1 := by rw [h₃]
          _ = z ^ n * z ^ n - 1 := by
            ring_nf
            <;> simp [Complex.ext_iff, pow_two, mul_comm, mul_assoc, mul_left_comm]
            <;> norm_num
          _ = z ^ n * (z ^ n - (star z) ^ n) := by
            have h₅ : z ^ n * (z ^ n - (star z) ^ n) = z ^ n * z ^ n - z ^ n * (star z) ^ n := by
              ring_nf
              <;> simp [Complex.ext_iff, pow_two, mul_comm, mul_assoc, mul_left_comm]
              <;> norm_num
            rw [h₅]
            have h₆ : z ^ n * (star z) ^ n = 1 := by
              have h₇ : z ^ n * (star z) ^ n = 1 := by
                calc
                  z ^ n * (star z) ^ n = z ^ n * star (z ^ n) := by simp [star_pow]
                  _ = ‖z ^ n‖ ^ 2 := by
                    simp [Complex.norm_eq_abs, Complex.sq_abs, Complex.normSq_mul, Complex.normSq_conj,
                      Complex.normSq_ofReal, Complex.ext_iff, pow_two, mul_comm, mul_assoc, mul_left_comm]
                    <;> ring_nf
                    <;> simp [Complex.normSq]
                    <;> ring_nf
                  _ = 1 := by
                    have h₈ : ‖z ^ n‖ = 1 := by
                      calc
                        ‖z ^ n‖ = ‖z‖ ^ n := by simp [norm_zpow]
                        _ = 1 ^ n := by rw [hznorm]
                        _ = 1 := by simp
                    rw [h₈]
                    <;> simp
              exact h₇
            rw [h₆]
            <;> ring_nf
            <;> simp [Complex.ext_iff, pow_two, mul_comm, mul_assoc, mul_left_comm]
            <;> norm_num
        <;> simp [Complex.ext_iff, pow_two, mul_comm, mul_assoc, mul_left_comm]
        <;> norm_num
      calc
        ‖z ^ (2 * n) - 1‖ = ‖z ^ n * (z ^ n - (star z) ^ n)‖ := by rw [h₂]
        _ = ‖z ^ n‖ * ‖z ^ n - (star z) ^ n‖ := by
          simp [norm_mul]
        _ = ‖z ^ n - (star z) ^ n‖ := by
          have h₃ : ‖z ^ n‖ = 1 := by
            calc
              ‖z ^ n‖ = ‖z‖ ^ n := by simp [norm_zpow]
              _ = 1 ^ n := by rw [hznorm]
              _ = 1 := by simp
          rw [h₃]
          <;> simp
        _ = ‖z ^ n - (star z) ^ n‖ := by rfl
    rw [h₁]
    have h₂ : ∃ q : ℚ, ‖z ^ n - (star z) ^ n‖ = q := by
      -- Use the fact that the imaginary part of z^n is rational to show that the norm is rational.
      have h₃ : ∃ (q1 q2 : ℚ), z.re = q1 ∧ z.im = q2 := hzrat
      obtain ⟨q1, q2, hq1, hq2⟩ := h₃
      have h₄ : z.re = q1 := hq1
      have h₅ : z.im = q2 := hq2
      have h₆ : ‖z‖ = 1 := hznorm
      have h₇ : (z.re : ℝ) = q1 := by exact_mod_cast hq1
      have h₈ : (z.im : ℝ) = q2 := by exact_mod_cast hq2
      have h₉ : ‖z‖ ^ 2 = 1 := by
        rw [hznorm]
        <;> norm_num
      have h₁₀ : (z.re : ℝ) ^ 2 + (z.im : ℝ) ^ 2 = 1 := by
        have h₁₁ : ‖z‖ ^ 2 = (z.re : ℝ) ^ 2 + (z.im : ℝ) ^ 2 := by
          simp [Complex.norm_eq_abs, Complex.sq_abs, Complex.normSq_apply]
          <;> ring_nf
          <;> simp [Complex.ext_iff, pow_two, mul_comm, mul_assoc, mul_left_comm]
          <;> norm_num
        rw [h₁₁] at h₉
        exact h₉
      have h₁₁ : (z.re : ℝ) ^ 2 + (z.im : ℝ) ^ 2 = 1 := h₁₀
      have h₁₂ : ‖z ^ n - (star z) ^ n‖ = 2 * |(z.im * n : ℝ)| := by
        sorry
      have h₁₃ : ∃ (q : ℚ), ‖z ^ n - (star z) ^ n‖ = q := by
        sorry
      exact h₁₃
    obtain ⟨q, hq⟩ := h₂
    refine' ⟨q, _⟩
    rw [hq]
    <;> simp [Complex.ext_iff, pow_two, mul_comm, mul_assoc, mul_left_comm]
    <;> norm_num
    <;> simp_all [Complex.ext_iff, pow_two, mul_comm, mul_assoc, mul_left_comm]
    <;> norm_num
    <;> linarith
  exact h_main