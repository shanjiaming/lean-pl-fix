theorem h₅ (lambda : NNReal) (h : Summable fun k => ↑k * poissonPMFReal lambda k) (h₂ : lambda = 1) : ∑' (k : ℕ), ↑k * poissonPMFReal lambda k = ↑lambda :=
  by
  have h₆ := P_X_leq_1 (0 : NNReal)
  have h₇ := P_X_leq_1 (1 : NNReal)
  have h₈ := P_X_leq_1 lambda
  have h₉ := P_X_leq_1 (2 : NNReal)
  norm_num [poisson_pmf, poissonPMFReal, h₂] at h₆ h₇ h₈ h₉ ⊢ <;> (try norm_num at h₆ h₇ h₈ h₉ ⊢) <;>
                        (try simp_all [poisson_pmf, poissonPMFReal, h₂]) <;>
                      (try ring_nf at h₆ h₇ h₈ h₉ ⊢) <;>
                    (try norm_num at h₆ h₇ h₈ h₉ ⊢) <;>
                  (try linarith [Real.exp_pos (-1), Real.exp_pos (-(lambda : ℝ))]) <;>
                (try field_simp at h₆ h₇ h₈ h₉ ⊢) <;>
              (try ring_nf at h₆ h₇ h₈ h₉ ⊢) <;>
            (try norm_num at h₆ h₇ h₈ h₉ ⊢) <;>
          (try linarith [Real.exp_pos (-1), Real.exp_pos (-(lambda : ℝ))]) <;>
        (try simp_all [poisson_pmf, poissonPMFReal, h₂]) <;>
      (try norm_num) <;>
    (try linarith [Real.exp_pos (-1), Real.exp_pos (-(lambda : ℝ))])