theorem h₃ (z : ℂ) (hzrat : ∃ q1 q2, z.re = (↑q1 : ℝ) ∧ z.im = (↑q2 : ℝ)) (hznorm : ‖z‖ = 1) (n : ℤ) : z ^ (2 * n) = (z ^ n) ^ 2 := by
  --  rw [mul_comm]
  --  simp [zpow_mul, zpow_ofNat] <;> ring_nf <;> simp [Complex.ext_iff, pow_two, mul_comm, mul_assoc, mul_left_comm] <;>
          norm_num <;>
        ring_nf <;>
      simp [Complex.ext_iff, pow_two, mul_comm, mul_assoc, mul_left_comm] <;>
    norm_num
  hole