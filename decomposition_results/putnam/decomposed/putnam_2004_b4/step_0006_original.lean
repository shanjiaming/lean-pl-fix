theorem h_main (n : ℕ) (nge2 : n ≥ 2) (R Rk : ℕ → ℂ → ℂ) (hR : R 0 = id ∧ ∀ (k : ℕ), R (k + 1) = Rk (k + 1) ∘ R k) (hRk : Rk = fun k Q => (↑k : ℂ) + Complex.exp (Complex.I * 2 * (↑π : ℂ) / (↑n : ℂ)) * (Q - (↑k : ℂ))) (hω : Complex.exp (Complex.I * 2 * (↑π : ℂ) / (↑n : ℂ)) ^ n = 1) : ∀ (k : ℕ) (z : ℂ),
    R k z =
      (z -
              Complex.exp (Complex.I * 2 * (↑π : ℂ) / (↑n : ℂ)) /
                (Complex.exp (Complex.I * 2 * (↑π : ℂ) / (↑n : ℂ)) - 1)) *
            Complex.exp (Complex.I * 2 * (↑π : ℂ) / (↑n : ℂ)) ^ k +
          (↑k : ℂ) +
        Complex.exp (Complex.I * 2 * (↑π : ℂ) / (↑n : ℂ)) / (Complex.exp (Complex.I * 2 * (↑π : ℂ) / (↑n : ℂ)) - 1) :=
  by
  intro k
  induction k with
  | zero =>
    intro z
    have h1 : R 0 = id := hR.1
    have h2 : R 0 z = z := by simp [h1, id]
    have h3 :
      (z - Complex.exp (Complex.I * 2 * Real.pi / n) / (Complex.exp (Complex.I * 2 * Real.pi / n) - 1)) *
              (Complex.exp (Complex.I * 2 * Real.pi / n)) ^ 0 +
            0 +
          Complex.exp (Complex.I * 2 * Real.pi / n) / (Complex.exp (Complex.I * 2 * Real.pi / n) - 1) =
        z :=
      by
      simp [Complex.ext_iff, pow_zero, Complex.ext_iff, Complex.I_mul_I] <;>
                field_simp [Complex.ext_iff, pow_two, pow_three, Complex.ext_iff, Complex.I_mul_I, sub_eq_zero] <;>
              ring_nf <;>
            simp [Complex.ext_iff, pow_two, pow_three, Complex.ext_iff, Complex.I_mul_I, sub_eq_zero] <;>
          norm_num <;>
        linarith
    simp_all [h2, h3] <;> ring_nf <;>
          simp [Complex.ext_iff, pow_two, pow_three, Complex.ext_iff, Complex.I_mul_I, sub_eq_zero] <;>
        norm_num <;>
      linarith
  | succ k ih =>
    intro z
    have h₁ : R (k + 1) = Rk (k + 1) ∘ R k := hR.2 k
    have h₂ : Rk = fun (k : ℕ) (Q : ℂ) ↦ k + Complex.exp (Complex.I * 2 * Real.pi / n) * (Q - k) := hRk
    have h₃ : R (k + 1) z = (Rk (k + 1) ∘ R k) z := by rw [h₁]
    rw [h₃]
    have h₄ : (Rk (k + 1) ∘ R k) z = Rk (k + 1) (R k z) := rfl
    rw [h₄]
    have h₅ : Rk (k + 1) (R k z) = (k + 1 : ℂ) + Complex.exp (Complex.I * 2 * Real.pi / n) * (R k z - (k + 1 : ℂ)) := by
      rw [h₂] <;> simp [Complex.ext_iff, pow_two, pow_three, Complex.ext_iff, Complex.I_mul_I] <;> ring_nf <;>
          simp [Complex.ext_iff, pow_two, pow_three, Complex.ext_iff, Complex.I_mul_I] <;>
        norm_num
    rw [h₅]
    have h₆ :
      R k z =
        (z - Complex.exp (Complex.I * 2 * Real.pi / n) / (Complex.exp (Complex.I * 2 * Real.pi / n) - 1)) *
              (Complex.exp (Complex.I * 2 * Real.pi / n)) ^ k +
            k +
          Complex.exp (Complex.I * 2 * Real.pi / n) / (Complex.exp (Complex.I * 2 * Real.pi / n) - 1) :=
      ih z
    rw [h₆]
    have h₇ :
      (k + 1 : ℂ) +
          Complex.exp (Complex.I * 2 * Real.pi / n) *
            (((z - Complex.exp (Complex.I * 2 * Real.pi / n) / (Complex.exp (Complex.I * 2 * Real.pi / n) - 1)) *
                    (Complex.exp (Complex.I * 2 * Real.pi / n)) ^ k +
                  k +
                Complex.exp (Complex.I * 2 * Real.pi / n) / (Complex.exp (Complex.I * 2 * Real.pi / n) - 1)) -
              (k + 1 : ℂ)) =
        (z - Complex.exp (Complex.I * 2 * Real.pi / n) / (Complex.exp (Complex.I * 2 * Real.pi / n) - 1)) *
              (Complex.exp (Complex.I * 2 * Real.pi / n)) ^ (k + 1) +
            (k + 1 : ℂ) +
          Complex.exp (Complex.I * 2 * Real.pi / n) / (Complex.exp (Complex.I * 2 * Real.pi / n) - 1) :=
      by
      have h₈ : Complex.exp (Complex.I * 2 * Real.pi / n) ≠ 1 :=
        by
        by_contra h
        have h₉ : Complex.exp (Complex.I * 2 * Real.pi / n) = 1 := by simpa using h
        have h₁₀ : Complex.exp (Complex.I * 2 * Real.pi / n) ^ n = 1 := by simpa [h₉] using hω
        have h₁₁ : n ≥ 2 := nge2
        have h₁₂ : n ≠ 0 := by linarith
        have h₁₃ : Complex.exp (Complex.I * 2 * Real.pi / n) ≠ 1 :=
          by
          intro h₁₄
          have h₁₅ : Complex.exp (Complex.I * 2 * Real.pi / n) = 1 := by simpa using h₁₄
          have h₁₆ : Complex.exp (Complex.I * 2 * Real.pi / n) ^ n = 1 := by simpa [h₁₅] using hω
          have h₁₇ : n ≠ 0 := by linarith
          have h₁₈ :
            Complex.ext_iff (Complex.exp (Complex.I * 2 * Real.pi / n)) 1 =
              (Complex.re (Complex.exp (Complex.I * 2 * Real.pi / n)) = Complex.re 1 ∧
                Complex.im (Complex.exp (Complex.I * 2 * Real.pi / n)) = Complex.im 1) :=
            by simp [Complex.ext_iff]
          simp_all [Complex.ext_iff, Complex.exp_re, Complex.exp_im, Real.exp_zero, Real.exp_ne_zero, Complex.ext_iff,
                              pow_two, pow_three, Complex.ext_iff, Complex.I_mul_I] <;>
                            (try norm_num) <;>
                          (try ring_nf) <;>
                        (try field_simp at *) <;>
                      (try norm_num at *) <;>
                    (try linarith) <;>
                  (try ring_nf at *) <;>
                (try field_simp at *) <;>
              (try norm_num at *) <;>
            (try linarith)
        contradiction
      have h₉ : Complex.exp (Complex.I * 2 * Real.pi / n) - 1 ≠ 0 :=
        by
        intro h
        apply h₈ <;> ring_nf at h ⊢ <;>
                    simp_all [Complex.ext_iff, Complex.exp_re, Complex.exp_im, Real.exp_zero, Real.exp_ne_zero,
                      Complex.ext_iff, pow_two, pow_three, Complex.ext_iff, Complex.I_mul_I] <;>
                  norm_num at * <;>
                ring_nf at * <;>
              simp_all [Complex.ext_iff, Complex.exp_re, Complex.exp_im, Real.exp_zero, Real.exp_ne_zero,
                Complex.ext_iff, pow_two, pow_three, Complex.ext_iff, Complex.I_mul_I] <;>
            norm_num at * <;>
          linarith
      have h₁₀ : Complex.exp (Complex.I * 2 * Real.pi / n) ≠ 0 := by exact Complex.exp_ne_zero _
      field_simp [h₈, h₉, h₁₀, Complex.ext_iff, pow_add, pow_one, mul_add, mul_comm, mul_left_comm, mul_assoc, sub_mul,
                      add_mul, Complex.ext_iff, Complex.I_mul_I] <;>
                    ring_nf <;>
                  simp_all [Complex.ext_iff, pow_add, pow_one, mul_add, mul_comm, mul_left_comm, mul_assoc, sub_mul,
                    add_mul, Complex.ext_iff, Complex.I_mul_I] <;>
                norm_num <;>
              ring_nf at * <;>
            simp_all [Complex.ext_iff, pow_add, pow_one, mul_add, mul_comm, mul_left_comm, mul_assoc, sub_mul, add_mul,
              Complex.ext_iff, Complex.I_mul_I] <;>
          norm_num at * <;>
        linarith
    rw [h₇] <;>
                simp_all [Complex.ext_iff, pow_add, pow_one, mul_add, mul_comm, mul_left_comm, mul_assoc, sub_mul,
                  add_mul, Complex.ext_iff, Complex.I_mul_I] <;>
              norm_num <;>
            ring_nf at * <;>
          simp_all [Complex.ext_iff, pow_add, pow_one, mul_add, mul_comm, mul_left_comm, mul_assoc, sub_mul, add_mul,
            Complex.ext_iff, Complex.I_mul_I] <;>
        norm_num at * <;>
      linarith