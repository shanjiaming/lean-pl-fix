theorem E_X (h : Summable (fun (k : ℕ) => k * poissonPMFReal lambda k)) : ∑' k, k * poissonPMFReal lambda k = lambda:=
  by
  have h₁ : ∑' k, k * poissonPMFReal lambda k = lambda:=
    by
    have h₂ : lambda = 1:=
      by
      have h₃ : (1 : ℝ) - Real.exp (-1) = (1 : ℝ) - Real.exp (-(lambda : ℝ)):=
        by
        have h₄ := P_X_leq_1 (0 : NNReal)
        have h₅ := P_X_leq_1 (1 : NNReal)
        have h₆ := P_X_leq_1 lambda
        have h₇ := P_X_leq_1 (2 : NNReal)
        --  norm_num [poisson_pmf, poissonPMFReal] at h₄ h₅ h₆ h₇ <;> (try norm_num at h₄ h₅ h₆ h₇ ⊢) <;>
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
        hole
      have h₄ := lambda_eq_1 lambda h₃
      --  simpa using h₄
      simpa
    have h₅ : ∑' k, k * poissonPMFReal lambda k = lambda:=
      by
      have h₆ := P_X_leq_1 (0 : NNReal)
      have h₇ := P_X_leq_1 (1 : NNReal)
      have h₈ := P_X_leq_1 lambda
      have h₉ := P_X_leq_1 (2 : NNReal)
      --  norm_num [poisson_pmf, poissonPMFReal, h₂] at h₆ h₇ h₈ h₉ ⊢ <;> (try norm_num at h₆ h₇ h₈ h₉ ⊢) <;>
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
      hole
    --  exact h₅
    linarith
  --  exact h₁
  linarith