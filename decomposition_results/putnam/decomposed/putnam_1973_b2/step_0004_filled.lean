theorem h₂ (z : ℂ) (hzrat : ∃ q1 q2, z.re = (↑q1 : ℝ) ∧ z.im = (↑q2 : ℝ)) (hznorm : ‖z‖ = 1) (n : ℤ) : z ^ (2 * n) - 1 = z ^ n * (z ^ n - star z ^ n) :=
  by
  have h₃ : z ^ (2 * n) = (z ^ n) ^ 2 := by sorry
  have h₄ : (star z) ^ n = star (z ^ n) := by sorry
  --  calc
  --    z ^ (2 * n) - 1 = (z ^ n) ^ 2 - 1 := by rw [h₃]
  --    _ = z ^ n * z ^ n - 1 := by
  --      ring_nf <;> simp [Complex.ext_iff, pow_two, mul_comm, mul_assoc, mul_left_comm] <;> norm_num
  --    _ = z ^ n * (z ^ n - (star z) ^ n) :=
  --      by
  --      have h₅ : z ^ n * (z ^ n - (star z) ^ n) = z ^ n * z ^ n - z ^ n * (star z) ^ n := by
  --        ring_nf <;> simp [Complex.ext_iff, pow_two, mul_comm, mul_assoc, mul_left_comm] <;> norm_num
  --      rw [h₅]
  --      have h₆ : z ^ n * (star z) ^ n = 1 :=
  --        by
  --        have h₇ : z ^ n * (star z) ^ n = 1 := by
  --          calc
  --            z ^ n * (star z) ^ n = z ^ n * star (z ^ n) := by simp [star_pow]
  --            _ = ‖z ^ n‖ ^ 2 := by
  --              simp [Complex.norm_eq_abs, Complex.sq_abs, Complex.normSq_mul, Complex.normSq_conj, Complex.normSq_ofReal,
  --                      Complex.ext_iff, pow_two, mul_comm, mul_assoc, mul_left_comm] <;>
  --                    ring_nf <;>
  --                  simp [Complex.normSq] <;>
  --                ring_nf
  --            _ = 1 :=
  --              by
  --              have h₈ : ‖z ^ n‖ = 1 := by
  --                calc
  --                  ‖z ^ n‖ = ‖z‖ ^ n := by simp [norm_zpow]
  --                  _ = 1 ^ n := by rw [hznorm]
  --                  _ = 1 := by simp
  --              rw [h₈] <;> simp
  --        exact h₇
  --      rw [h₆] <;> ring_nf <;> simp [Complex.ext_iff, pow_two, mul_comm, mul_assoc, mul_left_comm] <;> norm_num <;>
  --          simp [Complex.ext_iff, pow_two, mul_comm, mul_assoc, mul_left_comm] <;>
  --        norm_num
  hole