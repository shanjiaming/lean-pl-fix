theorem polynomial_evaluation_sum (h1 : f.eval 1 = 10) (h2 : f.eval 2 = 20) (h3 : f.eval 3 = 30) :
  f.eval 12 + f.eval (-8) = 19840 := by
  have h_exists_c : ∃ (c : ℤ), f = (Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C 2) * (Polynomial.X - Polynomial.C 3) * (Polynomial.X - Polynomial.C c) + Polynomial.C 10 * Polynomial.X := by
    have h₁ : f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X = (Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C 2) * (Polynomial.X - Polynomial.C 3) * (Polynomial.X - Polynomial.C ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X).eval 0)) := by
      have h₂ : f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X = (Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C 2) * (Polynomial.X - Polynomial.C 3) * (Polynomial.X - Polynomial.C ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X).eval 0)) := by
        have h₃ : f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X = (Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C 2) * (Polynomial.X - Polynomial.C 3) * (Polynomial.X - Polynomial.C ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X).eval 0)) := by
          -- Prove that the polynomial is as claimed by checking its roots and leading coefficient
          have h₄ : Polynomial.Monic (f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X) := by
            have h₅ : Polynomial.Monic (f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X) := by
              -- Prove that f - 10X is monic
              have h₆ := hf_monic
              have h₇ : Polynomial.Monic f := h₆
              have h₈ : Polynomial.Monic (f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X) := by
                -- Use the fact that f is monic to prove f - 10X is monic
                have h₉ : f.degree = 4 := hf_degree
                have h₁₀ : Polynomial.Monic f := h₆
                have h₁₁ : Polynomial.Monic (f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X) := by
                  -- Use the fact that f is monic to prove f - 10X is monic
                  apply Polynomial.Monic.sub_of_left
                  <;> simp_all [Polynomial.monic_X, Polynomial.monic_C, Polynomial.degree_C, Polynomial.degree_X,
                    Polynomial.degree_sub_eq_left_of_degree_lt, Polynomial.degree_mul, Polynomial.degree_add,
                    Polynomial.degree_pow, Polynomial.degree_X_pow]
                  <;> norm_num
                  <;>
                    (try decide)
                  <;>
                    (try ring_nf at * <;> norm_num at * <;> simp_all [Polynomial.Monic])
                  <;>
                    (try omega)
                exact h₁₁
              exact h₈
            exact h₅
          
          have h₅ : (f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X).eval 1 = 0 := by
            -- Prove that f(1) - 10 * 1 = 0
            simp [Polynomial.eval_sub, Polynomial.eval_mul, Polynomial.eval_pow, Polynomial.eval_add,
              Polynomial.eval_C, Polynomial.eval_X, Polynomial.eval_bit0, Polynomial.eval_one] at h1 ⊢
            <;> omega
          
          have h₆ : (f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X).eval 2 = 0 := by
            -- Prove that f(2) - 10 * 2 = 0
            simp [Polynomial.eval_sub, Polynomial.eval_mul, Polynomial.eval_pow, Polynomial.eval_add,
              Polynomial.eval_C, Polynomial.eval_X, Polynomial.eval_bit0, Polynomial.eval_one] at h2 ⊢
            <;> omega
          
          have h₇ : (f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X).eval 3 = 0 := by
            simp [Polynomial.eval_sub, Polynomial.eval_mul, Polynomial.eval_pow, Polynomial.eval_add,
              Polynomial.eval_C, Polynomial.eval_X, Polynomial.eval_bit0, Polynomial.eval_one] at h3 ⊢
            <;> omega
          
          have h₈ : (f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X) =
              (Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C 2) * (Polynomial.X - Polynomial.C 3) *
                (Polynomial.X - Polynomial.C ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X).eval 0)) := by
            -- Prove that f - 10X is divisible by (X - 1)(X - 2)(X - 3)(X - (f - 10X).eval 0)
            have h₉ : Polynomial.Monic (f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X) := by assumption
            have h₁₀ : (f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X).eval 1 = 0 := by assumption
            have h₁₁ : (f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X).eval 2 = 0 := by assumption
            have h₁₂ : (f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X).eval 3 = 0 := by assumption
            have h₁₃ : f.degree = 4 := hf_degree
            have h₁₄ : Polynomial.degree (f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X) = 4 := by
              have h₁₅ : Polynomial.degree (f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X) = Polynomial.degree f := by
                have h₁₆ : Polynomial.degree ((Polynomial.C 10 : Polynomial ℤ) * Polynomial.X) < Polynomial.degree f := by
                  have h₁₇ : Polynomial.degree ((Polynomial.C 10 : Polynomial ℤ) * Polynomial.X) = 1 := by
                    simp [Polynomial.degree_mul, Polynomial.degree_C, Polynomial.degree_X, Nat.cast_ofNat]
                  have h₁₈ : Polynomial.degree f = 4 := by
                    rw [hf_degree]
                    <;> simp [Polynomial.degree_eq_natDegree hf_monic.ne_zero]
                  rw [h₁₇, h₁₈]
                  <;> norm_num
                have h₁₉ : Polynomial.degree (f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X) = Polynomial.degree f := by
                  apply Polynomial.degree_sub_eq_left_of_degree_lt
                  exact h₁₆
                exact h₁₉
              rw [h₁₅]
              <;> simp [hf_degree]
            have h₁₅ : (f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X) = (Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C 2) * (Polynomial.X - Polynomial.C 3) * (Polynomial.X - Polynomial.C ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X).eval 0)) := by
              have h₁₆ : (f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X) = (Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C 2) * (Polynomial.X - Polynomial.C 3) * (Polynomial.X - Polynomial.C ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X).eval 0)) := by
                apply Polynomial.eq_of_sub_eq_zero
                have h₁₇ : (f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X) - ((Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C 2) * (Polynomial.X - Polynomial.C 3) * (Polynomial.X - Polynomial.C ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X).eval 0))) = 0 := by
                  have h₁₈ : Polynomial.degree ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X) - ((Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C 2) * (Polynomial.X - Polynomial.C 3) * (Polynomial.X - Polynomial.C ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X).eval 0)))) < 4 := by
                    have h₁₉ : Polynomial.degree ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X) - ((Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C 2) * (Polynomial.X - Polynomial.C 3) * (Polynomial.X - Polynomial.C ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial{X}.eval 0))))) < 4 := by
                      have h₂₀ : Polynomial.degree ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X) - ((Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C 2) * (Polynomial.X - Polynomial.C 3) * (Polynomial.X - Polynomial.C ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial{X}.eval 0))))) < 4 := by
                        -- Prove that the degree of the polynomial is less than 4
                        have h₂₁ : Polynomial.degree ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X) - ((Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C 2) * (Polynomial.X - Polynomial.C 3) * (Polynomial.X - Polynomial.C ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial{X}.eval 0))))) ≤ 3 := by
                          -- Prove that the degree of the polynomial is less than or equal to 3
                          have h₂₂ : Polynomial.degree ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X) - ((Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C 2) * (Polynomial.X - Polynomial.C 3) * (Polynomial.X - Polynomial.C ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial{X}.eval 0))))) ≤ 3 := by
                            -- Prove that the degree of the polynomial is less than or equal to 3
                            apply Polynomial.degree_sub_le _ _ |>.trans
                            apply max_le
                            · -- Prove that the degree of the polynomial is less than or equal to 3
                              have h₂₃ : Polynomial.degree (f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X) ≤ 4 := by
                                have h₂₄ : Polynomial.degree (f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X) = 4 := by
                                  apply h₁₄
                                rw [h₂₄]
                                <;> norm_num
                              have h₂₄ : Polynomial.degree ((Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C 2) * (Polynomial.X - Polynomial.C 3) * (Polynomial.X - Polynomial.C ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial{X}.eval 0)))) = 4 := by
                                -- Prove that the degree of the polynomial is 4
                                norm_num [Polynomial.degree_mul, Polynomial.degree_X, Polynomial.degree_add, Polynomial.degree_sub_eq_left_of_degree_lt, Polynomial.degree_C, Polynomial.degree_pow, Polynomial.degree_X]
                                <;> simp_all [Polynomial.eval_sub, Polynomial.eval_mul, Polynomial.eval_pow, Polynomial.eval_add, Polynomial.eval_C, Polynomial.eval_X]
                                <;> ring_nf at *
                                <;> norm_num at *
                                <;> omega
                              have h₂₅ : Polynomial.degree (f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X) ≤ 4 := by
                                have h₂₆ : Polynomial.degree (f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X) = 4 := by
                                  apply h₁₄
                                rw [h₂₆]
                                <;> norm_num
                              have h₂₆ : Polynomial.degree ((Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C 2) * (Polynomial.X - Polynomial.C 3) * (Polynomial.X - Polynomial.C ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial{X}.eval 0)))) = 4 := by
                                -- Prove that the degree of the polynomial is 4
                                norm_num [Polynomial.degree_mul, Polynomial.degree_X, Polynomial.degree_add, Polynomial.degree_sub_eq_left_of_degree_lt, Polynomial.degree_C]
                                <;> simp_all [Polynomial.eval_sub, Polynomial.eval_mul, Polynomial.eval_pow, Polynomial.eval_add, Polynomial.eval_C, Polynomial.eval_X]
                                <;> ring_nf at *
                                <;> norm_num at *
                                <;> omega
                              omega
                            · -- Prove that the degree of the polynomial is less than or equal to 3
                              have h₂₃ : Polynomial.degree ((Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C 2) * (Polynomial.X - Polynomial.C 3) * (Polynomial.X - Polynomial.C ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial{X}.eval 0)))) ≤ 4 := by
                                -- Prove that the degree of the polynomial is less than or equal to 4
                                have h₂₄ : Polynomial.degree ((Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C 2) * (Polynomial.X - Polynomial.C 3) * (Polynomial.X - Polynomial.C ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial{X}.eval 0)))) = 4 := by
                                  -- Prove that the degree of the polynomial is 4
                                  norm_num [Polynomial.degree_mul, Polynomial.degree_X, Polynomial.degree_add, Polynomial.degree_sub_eq_left_of_degree_lt, Polynomial.degree_C]
                                  <;> simp_all [Polynomial.eval_sub, Polynomial.eval_mul, Polynomial.eval_pow, Polynomial.eval_add, Polynomial.eval_C, Polynomial.eval_X]
                                  <;> ring_nf at *
                                  <;> norm_num at *
                                  <;> omega
                                rw [h₂₄]
                                <;> norm_num
                              omega
                          omega
                        have h₂₂ : Polynomial.degree ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X) - ((Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C 2) * (Polynomial.X - Polynomial.C 3) * (Polynomial.X - Polynomial.C ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial{X}.eval 0))))) < 4 := by
                          have h₂₃ : Polynomial.degree ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X) - ((Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C 2) * (Polynomial.X - Polynomial.C 3) * (Polynomial.X - Polynomial.C ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial{X}.eval 0))))) ≤ 3 := by
                            apply h₂₁
                          have h₂₄ : (3 : ℕ) < 4 := by norm_num
                          have h₂₅ : Polynomial.degree ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X) - ((Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C 2) * (Polynomial.X - Polynomial.C 3) * (Polynomial.X - Polynomial.C ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial{X}.eval 0))))) < 4 := by
                            exact lt_of_le_of_lt h₂₃ (by norm_num)
                          exact h₂₅
                        exact h₂₂
                      exact h₂₀
                    exact h₁₉
                  have h₂₁ : (f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X) - ((Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C 2) * (Polynomial.X - Polynomial.C 3) * (Polynomial.X - Polynomial.C ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X).eval 0))) = 0 := by
                    -- Prove that the polynomial is zero by checking its roots and leading coefficient
                    have h₂₂ : Polynomial.degree ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X) - ((Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C 2) * (Polynomial.X - Polynomial.C 3) * (Polynomial.X - Polynomial.C ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X).eval 0)))) < 4 := by
                      exact h₁₈
                    have h₂₃ : (f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X) - ((Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C 2) * (Polynomial.X - Polynomial.C 3) * (Polynomial.X - Polynomial.C ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X).eval 0))) = 0 := by
                      by_contra h₂₄
                      have h₂₅ : Polynomial.degree ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X) - ((Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C 2) * (Polynomial.X - Polynomial.C 3) * (Polynomial.X - Polynomial.C ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X).eval 0)))) ≥ 4 := by
                        -- Use the fact that the polynomial is not zero to contradict the degree bound
                        have h₂₆ : (f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X) - ((Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C 2) * (Polynomial.X - Polynomial.C 3) * (Polynomial.X - Polynomial.C ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X).eval 0))) ≠ 0 := by
                          intro h₂₇
                          apply h₂₄
                          simp_all
                        have h₂₇ : Polynomial.degree ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X) - ((Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C 2) * (Polynomial.X - Polynomial.C 3) * (Polynomial.X - Polynomial.C ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X).eval 0)))) ≥ 4 := by
                          -- Use the fact that the polynomial is not zero to determine the degree
                          have h₂₈ : Polynomial.degree ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X) - ((Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C 2) * (Polynomial.X - Polynomial.C 3) * (Polynomial.X - Polynomial.C ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X).eval 0)))) ≥ 4 := by
                            -- Use the fact that the polynomial is not zero to determine the degree
                            have h₂₉ : Polynomial.degree (f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X) = 4 := by
                              apply h₁₄
                            have h₃₀ : Polynomial.degree ((Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C 2) * (Polynomial.X - Polynomial.C 3) * (Polynomial.X - Polynomial.C ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X).eval 0))) = 4 := by
                              -- Prove that the degree of the polynomial is 4
                              norm_num [Polynomial.degree_mul, Polynomial.degree_X, Polynomial.degree_add, Polynomial.degree_sub_eq_left_of_degree_lt, Polynomial.degree_C]
                              <;> simp_all [Polynomial.eval_sub, Polynomial.eval_mul, Polynomial.eval_pow, Polynomial.eval_add, Polynomial.eval_C, Polynomial.eval_X]
                              <;> ring_nf at *
                              <;> norm_num at *
                              <;> omega
                            have h₃₁ : Polynomial.degree ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X) - ((Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C 2) * (Polynomial.X - Polynomial.C 3) * (Polynomial.X - Polynomial.C ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X).eval 0)))) ≥ 4 := by
                              -- Use the fact that the polynomial is not zero to determine the degree
                              have h₃₂ : Polynomial.degree ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X) - ((Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C 2) * (Polynomial.X - Polynomial.C 3) * (Polynomial.X - Polynomial.C ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X).eval 0)))) ≥ 4 := by
                                -- Use the fact that the polynomial is not zero to determine the degree
                                contrapose! h₂₆
                                have h₃₃ : Polynomial.degree ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X) - ((Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C 2) * (Polynomial.X - Polynomial.C 3) * (Polynomial.X - Polynomial.C ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X).eval 0)))) < 4 := by
                                  omega
                                have h₃₄ : (f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X) - ((Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C 2) * (Polynomial.X - Polynomial.C 3) * (Polynomial.X - Polynomial.C ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X).eval 0))) = 0 := by
                                  by_contra h₃₅
                                  have h₃₆ : Polynomial.degree ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X) - ((Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C 2) * (Polynomial.X - Polynomial.C 3) * (Polynomial.X - Polynomial.C ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X).eval 0)))) ≥ 4 := by
                                    -- Use the fact that the polynomial is not zero to determine the degree
                                    have h₃₇ : Polynomial.degree ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial{X}.eval 0)) ≥ 0 := by
                                      apply Polynomial.degree_nonneg
                                    simp_all [Polynomial.degree_sub_eq_left_of_degree_lt]
                                    <;>
                                    (try omega)
                                    <;>
                                    (try simp_all [Polynomial.degree_add_eq_left_of_degree_lt])
                                    <;>
                                    (try norm_num)
                                    <;>
                                    (try omega)
                                  omega
                                simp_all
                              omega
                            omega
                          omega
                        omega
                      omega
                    exact h₂₃
                  exact h₁₇
                rw [h₁₇]
                <;> simp
              rw [h₁₆]
            rw [h₁₅]
          rw [h₈]
          <;> simp [h₁₃, hf_degree]
        
        have h₅ : f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X = (Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C 2) * (Polynomial.X - Polynomial.C 3) * (Polynomial.X - Polynomial.C ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X).eval 0)) := by
          apply h₃
        rw [h₅]
        <;> ring_nf
        <;> simp [Polynomial.eval_add, Polynomial.eval_sub, Polynomial.eval_mul, Polynomial.eval_pow,
          Polynomial.eval_C, Polynomial.eval_X, Polynomial.eval_bit0, Polynomial.eval_one, h1, h2, h3]
        <;> norm_num
        <;> linarith
      rw [h₂]
      <;> ring_nf
      <;> simp [Polynomial.eval_add, Polynomial.eval_sub, Polynomial.eval_mul, Polynomial.eval_pow,
        Polynomial.eval_C, Polynomial.eval_X, Polynomial.eval_bit0, Polynomial.eval_one, h1, h2, h3]
      <;> norm_num
      <;> linarith
    
    refine' ⟨((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X).eval 0), _⟩
    have h₃ : f = (Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C 2) * (Polynomial.X - Polynomial.C 3) * (Polynomial.X - Polynomial.C ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X).eval 0)) + Polynomial.C 10 * Polynomial.X := by
      have h₄ : f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X = (Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C 2) * (Polynomial.X - Polynomial.C 3) * (Polynomial.X - Polynomial.C ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X).eval 0)) := by
        apply h₁
      have h₅ : f = (Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C 2) * (Polynomial.X - Polynomial.C 3) * (Polynomial.X - Polynomial.C ((f - (Polynomial.C 10 : Polynomial ℤ) * Polynomial.X).eval 0)) + Polynomial.C 10 * Polynomial.X := by
        rw [← sub_eq_zero]
        have h₆ := h₄
        ring_nf at h₆ ⊢
        <;> linear_combination h₆
      exact h₅
    exact h₃
  have h_main : f.eval 12 + f.eval (-8) = 19840 := by
    obtain ⟨c, hc⟩ := h_exists_c
    rw [hc]
    norm_num [Polynomial.eval_add, Polynomial.eval_sub, Polynomial.eval_mul, Polynomial.eval_pow, Polynomial.eval_C,
      Polynomial.eval_X, Polynomial.eval_bit0, Polynomial.eval_one, Polynomial.eval_mul, Polynomial.eval_add,
      Polynomial.eval_sub, Polynomial.eval_pow, Polynomial.eval_C, Polynomial.eval_X, Polynomial.eval_bit0,
      Polynomial.eval_one, Polynomial.eval_mul, Polynomial.eval_add, Polynomial.eval_sub, Polynomial.eval_pow,
      Polynomial.eval_C, Polynomial.eval_X, Polynomial.eval_bit0, Polynomial.eval_one]
    <;> ring_nf at *
    <;> norm_num at *
    <;> nlinarith
  exact h_main