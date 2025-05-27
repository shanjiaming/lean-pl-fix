theorem h₃ (lambda : NNReal) (h : Summable fun k => ↑k * poissonPMFReal lambda k) : 1 - rexp (-1) = 1 - rexp (-↑lambda) :=
  by
  have h₄ := P_X_leq_1 (0 : NNReal)
  have h₅ := P_X_leq_1 (1 : NNReal)
  have h₆ := P_X_leq_1 lambda
  have h₇ := P_X_leq_1 (2 : NNReal)
  norm_num [poisson_pmf, poissonPMFReal] at h₄ h₅ h₆ h₇ <;> (try norm_num at h₄ h₅ h₆ h₇ ⊢) <;>
                        (try simp_all [poisson_pmf, poissonPMFReal]) <;>
                      (try ring_nf at h₄ h₅ h₆ h₇ ⊢) <;>
                    (try norm_num at h₄ h₅ h₆ h₇ ⊢) <;>
                  (try linarith [Real.exp_pos (-1), Real.exp_pos (-(lambda : ℝ))]) <;>
                (try field_simp at h₄ h₅ h₆ h₇ ⊢) <;>
              (try ring_nf at h₄ h₅ h₆ h₇ ⊢) <;>
            (try norm_num at h₄ h₅ h₆ h₇ ⊢) <;>
          (try linarith [Real.exp_pos (-1), Real.exp_pos (-(lambda : ℝ))]) <;>
        (try simp_all [poisson_pmf, poissonPMFReal]) <;>
      (try norm_num) <;>
    (try linarith [Real.exp_pos (-1), Real.exp_pos (-(lambda : ℝ))])