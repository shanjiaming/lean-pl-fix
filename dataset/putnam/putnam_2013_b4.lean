theorem putnam_2013_b4
    (μ Var M : C(Icc (0 : ℝ) 1, ℝ) → ℝ)
    (hμ : ∀ f, μ f = ∫ x, f x)
    (hVar : ∀ f, Var f = ∫ x, (f x - μ f) ^ 2)
    (hM : ∀ f : C(Icc (0 : ℝ) 1, ℝ), IsGreatest (range <| abs ∘ f) (M f))
    (f g : C(Icc (0 : ℝ) 1, ℝ)) :
    Var (f * g) ≤ 2 * Var f * (M g) ^ 2 + 2 * Var g * (M f) ^ 2 := by
  have h₁ : Var (f * g) ≤ ∫ (x : Icc (0 : ℝ) 1), ((f * g) x - μ f * μ g) ^ 2 := by
    have h₁₁ : Var (f * g) = ∫ (x : Icc (0 : ℝ) 1), ((f * g) x - μ (f * g)) ^ 2 := by
      rw [hVar]
      <;> simp [hμ]
      <;> rfl
    rw [h₁₁]
    have h₁₂ : ∫ (x : Icc (0 : ℝ) 1), ((f * g) x - μ (f * g)) ^ 2 ≤ ∫ (x : Icc (0 : ℝ) 1), ((f * g) x - μ f * μ g) ^ 2 := by
      -- Use the fact that the variance is minimized at the mean
      have h₁₃ : ∫ (x : Icc (0 : ℝ) 1), ((f * g) x - μ (f * g)) ^ 2 ≤ ∫ (x : Icc (0 : ℝ) 1), ((f * g) x - μ f * μ g) ^ 2 := by
        -- Use the fact that the variance is minimized at the mean
        have h₁₄ : μ (f * g) = ∫ (x : Icc (0 : ℝ) 1), (f * g) x := by
          simp [hμ]
          <;> rfl
        have h₁₅ : ∫ (x : Icc (0 : ℝ) 1), ((f * g) x - μ (f * g)) ^ 2 ≤ ∫ (x : Icc (0 : ℝ) 1), ((f * g) x - μ f * μ g) ^ 2 := by
          -- Use the fact that the variance is minimized at the mean
          have h₁₆ : ∫ (x : Icc (0 : ℝ) 1), ((f * g) x - μ (f * g)) ^ 2 ≤ ∫ (x : Icc (0 : ℝ) 1), ((f * g) x - μ f * μ g) ^ 2 := by
            -- Use the fact that the variance is minimized at the mean
            apply?
          exact h₁₆
        exact h₁₅
      exact h₁₃
    exact h₁₂
  
  have h₂ : (∫ (x : Icc (0 : ℝ) 1), ((f * g) x - μ f * μ g) ^ 2) ≤ 2 * Var f * (M g) ^ 2 + 2 * Var g * (M f) ^ 2 := by
    have h₂₁ : (∫ (x : Icc (0 : ℝ) 1), ((f * g) x - μ f * μ g) ^ 2) ≤ 2 * Var f * (M g) ^ 2 + 2 * Var g * (M f) ^ 2 := by
      have h₂₂ : (∫ (x : Icc (0 : ℝ) 1), ((f * g) x - μ f * μ g) ^ 2) = ∫ (x : Icc (0 : ℝ) 1), ((f * g) x - μ f * μ g) ^ 2 := rfl
      rw [h₂₂]
      have h₂₃ : ∫ (x : Icc (0 : ℝ) 1), ((f * g) x - μ f * μ g) ^ 2 ≤ 2 * Var f * (M g) ^ 2 + 2 * Var g * (M f) ^ 2 := by
        have h₂₄ : ∫ (x : Icc (0 : ℝ) 1), ((f * g) x - μ f * μ g) ^ 2 ≤ 2 * (∫ (x : Icc (0 : ℝ) 1), (f x - μ f) ^ 2) * (M g) ^ 2 + 2 * (∫ (x : Icc (0 : ℝ) 1), (g x - μ g) ^ 2) * (M f) ^ 2 := by
          have h₂₅ : ∫ (x : Icc (0 : ℝ) 1), ((f * g) x - μ f * μ g) ^ 2 ≤ 2 * (∫ (x : Icc (0 : ℝ) 1), (f x - μ f) ^ 2) * (M g) ^ 2 + 2 * (∫ (x : Icc (0 : ℝ) 1), (g x - μ g) ^ 2) * (M f) ^ 2 := by
            -- Use the fact that (f * g) x - μ f * μ g = (f x - μ f) * g x + μ f * (g x - μ g)
            have h₂₅₁ : ∫ (x : Icc (0 : ℝ) 1), ((f * g) x - μ f * μ g) ^ 2 ≤ ∫ (x : Icc (0 : ℝ) 1), (2 * ((f x - μ f) ^ 2 * (M g) ^ 2) + 2 * ((g x - μ g) ^ 2 * (M f) ^ 2)) := by
              -- Use the fact that (f * g) x - μ f * μ g = (f x - μ f) * g x + μ f * (g x - μ g)
              have h₂₅₂ : ∀ (x : Icc (0 : ℝ) 1), ((f * g) x - μ f * μ g) ^ 2 ≤ 2 * ((f x - μ f) ^ 2 * (M g) ^ 2) + 2 * ((g x - μ g) ^ 2 * (M f) ^ 2) := by
                intro x
                have h₂₅₃ : (f * g) x - μ f * μ g = (f x - μ f) * g x + μ f * (g x - μ g) := by
                  simp [mul_comm, sub_mul, mul_sub, mul_assoc, mul_comm, mul_left_comm]
                  <;> ring_nf
                  <;> simp_all [hμ]
                  <;> field_simp
                  <;> ring_nf
                  <;> linarith
                rw [h₂₅₃]
                have h₂₅₄ : ((f x - μ f) * g x + μ f * (g x - μ g)) ^ 2 ≤ 2 * ((f x - μ f) ^ 2 * (M g) ^ 2) + 2 * ((g x - μ g) ^ 2 * (M f) ^ 2) := by
                  have h₂₅₅ : ((f x - μ f) * g x + μ f * (g x - μ g)) ^ 2 ≤ 2 * ((f x - μ f) * g x) ^ 2 + 2 * (μ f * (g x - μ g)) ^ 2 := by
                    nlinarith [sq_nonneg ((f x - μ f) * g x - μ f * (g x - μ g))]
                  have h₂₅₆ : 2 * ((f x - μ f) * g x) ^ 2 + 2 * (μ f * (g x - μ g)) ^ 2 ≤ 2 * ((f x - μ f) ^ 2 * (M g) ^ 2) + 2 * ((g x - μ g) ^ 2 * (M f) ^ 2) := by
                    have h₂₅₇ : (g x : ℝ) ^ 2 ≤ (M g : ℝ) ^ 2 := by
                      have h₂₅₈ : abs (g x : ℝ) ≤ M g := by
                        have h₂₅₉ : abs (g x : ℝ) ∈ range (abs ∘ (g : Icc (0 : ℝ) 1 → ℝ)) := by
                          exact ⟨x, rfl⟩
                        have h₂₅₁₀ : IsGreatest (range (abs ∘ (g : Icc (0 : ℝ) 1 → ℝ))) (M g) := hM g
                        exact h₂₅₁₀.2 h₂₅₉
                      have h₂₅₁₁ : abs (g x : ℝ) ≤ M g := h₂₅₈
                      have h₂₅₁₂ : (g x : ℝ) ^ 2 ≤ (M g : ℝ) ^ 2 := by
                        nlinarith [abs_mul_abs_self (g x : ℝ), abs_nonneg (g x : ℝ), h₂₅₁₁]
                      exact h₂₅₁₂
                    have h₂₅₁₃ : (μ f : ℝ) ^ 2 ≤ (M f : ℝ) ^ 2 := by
                      have h₂₅₁₄ : abs (μ f : ℝ) ≤ M f := by
                        have h₂₅₁₅ : abs (μ f : ℝ) ∈ range (abs ∘ (f : Icc (0 : ℝ) 1 → ℝ)) := by
                          have h₂₅₁₆ : abs (μ f : ℝ) = abs (∫ (x : Icc (0 : ℝ) 1), (f x : ℝ)) := by
                            simp [hμ]
                            <;> rfl
                          have h₂₅₁₇ : abs (∫ (x : Icc (0 : ℝ) 1), (f x : ℝ)) ∈ range (abs ∘ (f : Icc (0 : ℝ) 1 → ℝ)) := by
                            have h₂₅₁₈ : IsGreatest (range (abs ∘ (f : Icc (0 : ℝ) 1 → ℝ))) (M f) := hM f
                            have h₂₅₁₉ : abs (∫ (x : Icc (0 : ℝ) 1), (f x : ℝ)) ≤ M f := by
                              have h₂₅₂₀ : abs (∫ (x : Icc (0 : ℝ) 1), (f x : ℝ)) ≤ ∫ (x : Icc (0 : ℝ) 1), abs (f x : ℝ) := by
                                exact?
                              have h₂₅₂₁ : ∫ (x : Icc (0 : ℝ) 1), abs (f x : ℝ) ≤ M f := by
                                have h₂₅₂₂ : ∀ x : Icc (0 : ℝ) 1, abs (f x : ℝ) ≤ M f := by
                                  intro x
                                  have h₂₅₂₃ : abs (f x : ℝ) ∈ range (abs ∘ (f : Icc (0 : ℝ) 1 → ℝ)) := by
                                    exact ⟨x, rfl⟩
                                  have h₂₅₂₄ : IsGreatest (range (abs ∘ (f : Icc (0 : ℝ) 1 → ℝ))) (M f) := hM f
                                  exact h₂₅₂₄.2 h₂₅₂₃
                                have h₂₅₂₅ : ∫ (x : Icc (0 : ℝ) 1), abs (f x : ℝ) ≤ ∫ (x : Icc (0 : ℝ) 1), (M f : ℝ) := by
                                  exact?
                                have h₂₅₂₆ : ∫ (x : Icc (0 : ℝ) 1), (M f : ℝ) = M f := by
                                  simp [hμ]
                                  <;> ring_nf
                                  <;> simp_all [hμ]
                                  <;> field_simp
                                  <;> linarith
                                have h₂₅₂₇ : ∫ (x : Icc (0 : ℝ) 1), abs (f x : ℝ) ≤ M f := by
                                  linarith
                                exact h₂₅₂₇
                              linarith
                            have h₂₅₂₈ : abs (∫ (x : Icc (0 : ℝ) 1), (f x : ℝ)) ∈ range (abs ∘ (f : Icc (0 : ℝ) 1 → ℝ)) := by
                              have h₂₅₂₉ : IsGreatest (range (abs ∘ (f : Icc (0 : ℝ) 1 → ℝ))) (M f) := hM f
                              have h₂₅₃₀ : abs (∫ (x : Icc (0 : ℝ) 1), (f x : ℝ)) ≤ M f := h₂₅₁₉
                              have h₂₅₃₁ : abs (∫ (x : Icc (0 : ℝ) 1), (f x : ℝ)) ∈ range (abs ∘ (f : Icc (0 : ℝ) 1 → ℝ)) := by
                                have h₂₅₃₂ : IsGreatest (range (abs ∘ (f : Icc (0 : ℝ) 1 → ℝ))) (M f) := hM f
                                have h₂₅₃₃ : abs (∫ (x : Icc (0 : ℝ) 1), (f x : ℝ)) ≤ M f := h₂₅₁₉
                                have h₂₅₃₄ : abs (∫ (x : Icc (0 : ℝ) 1), (f x : ℝ)) ∈ range (abs ∘ (f : Icc (0 : ℝ) 1 → ℝ)) := by
                                  have h₂₅₃₅ : IsGreatest (range (abs ∘ (f : Icc (0 : ℝ) 1 → ℝ))) (M f) := hM f
                                  have h₂₅₃₆ : abs (∫ (x : Icc (0 : ℝ) 1), (f x : ℝ)) ≤ M f := h₂₅₁₉
                                  exact?
                                exact h₂₅₃₄
                              exact h₂₅₃₁
                            exact h₂₅₂₈
                          simp_all [hμ]
                          <;> aesop
                        have h₂₅₂₀ : IsGreatest (range (abs ∘ (f : Icc (0 : ℝ) 1 → ℝ))) (M f) := hM f
                        have h₂₅₂₁ : abs (μ f : ℝ) ≤ M f := by
                          have h₂₅₂₂ : abs (μ f : ℝ) ∈ range (abs ∘ (f : Icc (0 : ℝ) 1 → ℝ)) := h₂₅₁₅
                          exact h₂₅₂₀.2 h₂₅₂₂
                        exact h₂₅₂₁
                      have h₂₅₂₃ : (μ f : ℝ) ^ 2 ≤ (M f : ℝ) ^ 2 := by
                        nlinarith [abs_mul_abs_self (μ f : ℝ), abs_nonneg (μ f : ℝ), h₂₅₁₄]
                      exact h₂₅₂₃
                    have h₂₅₁₅ : 2 * ((f x - μ f) * g x) ^ 2 + 2 * (μ f * (g x - μ g)) ^ 2 ≤ 2 * ((f x - μ f) ^ 2 * (M g) ^ 2) + 2 * ((g x - μ g) ^ 2 * (M f) ^ 2) := by
                      have h₂₅₁₆ : 0 ≤ (f x - μ f : ℝ) ^ 2 := by positivity
                      have h₂₅₁₇ : 0 ≤ (g x - μ g : ℝ) ^ 2 := by positivity
                      have h₂₅₁₈ : 0 ≤ (M g : ℝ) ^ 2 := by positivity
                      have h₂₅₁₉ : 0 ≤ (M f : ℝ) ^ 2 := by positivity
                      have h₂₅₂₀ : (g x : ℝ) ^ 2 ≤ (M g : ℝ) ^ 2 := h₂₅₇
                      have h₂₅₂₁ : (μ f : ℝ) ^ 2 ≤ (M f : ℝ) ^ 2 := h₂₅₁₃
                      nlinarith [sq_nonneg (f x - μ f), sq_nonneg (g x - μ g), sq_nonneg (μ f), sq_nonneg (μ g),
                        mul_nonneg h₂₅₁₆ h₂₅₁₈, mul_nonneg h₂₅₁₇ h₂₅₁₉,
                        mul_nonneg (sq_nonneg (f x - μ f)) (sq_nonneg (g x)),
                        mul_nonneg (sq_nonneg (μ f)) (sq_nonneg (g x - μ g))]
                    exact h₂₅₁₅
                  nlinarith
                exact h₂₅₄
              exact h₂₅₂
            have h₂₅₃ : ∫ (x : Icc (0 : ℝ) 1), ((f * g) x - μ f * μ g) ^ 2 ≤ ∫ (x : Icc (0 : ℝ) 1), (2 * ((f x - μ f) ^ 2 * (M g) ^ 2) + 2 * ((g x - μ g) ^ 2 * (M f) ^ 2)) := by
              exact?
            have h₂₅₄ : ∫ (x : Icc (0 : ℝ) 1), (2 * ((f x - μ f) ^ 2 * (M g) ^ 2) + 2 * ((g x - μ g) ^ 2 * (M f) ^ 2)) = 2 * (∫ (x : Icc (0 : ℝ) 1), (f x - μ f) ^ 2) * (M g) ^ 2 + 2 * (∫ (x : Icc (0 : ℝ) 1), (g x - μ g) ^ 2) * (M f) ^ 2 := by
              have h₂₅₅ : ∫ (x : Icc (0 : ℝ) 1), (2 * ((f x - μ f) ^ 2 * (M g) ^ 2) + 2 * ((g x - μ g) ^ 2 * (M f) ^ 2)) = 2 * (M g) ^ 2 * ∫ (x : Icc (0 : ℝ) 1), (f x - μ f) ^ 2 + 2 * (M f) ^ 2 * ∫ (x : Icc (0 : ℝ) 1), (g x - μ g) ^ 2 := by
                have h₂₅₆ : ∫ (x : Icc (0 : ℝ) 1), (2 * ((f x - μ f) ^ 2 * (M g) ^ 2) + 2 * ((g x - μ g) ^ 2 * (M f) ^ 2)) = ∫ (x : Icc (0 : ℝ) 1), (2 * (M g) ^ 2 * (f x - μ f) ^ 2 + 2 * (M f) ^ 2 * (g x - μ g) ^ 2) := by
                  congr
                  ext x
                  <;> ring_nf
                  <;> simp [mul_assoc, mul_comm, mul_left_comm]
                  <;> ring_nf
                rw [h₂₅₆]
                have h₂₅₇ : ∫ (x : Icc (0 : ℝ) 1), (2 * (M g) ^ 2 * (f x - μ f) ^ 2 + 2 * (M f) ^ 2 * (g x - μ g) ^ 2) = 2 * (M g) ^ 2 * ∫ (x : Icc (0 : ℝ) 1), (f x - μ f) ^ 2 + 2 * (M f) ^ 2 * ∫ (x : Icc (0 : ℝ) 1), (g x - μ g) ^ 2 := by
                  have h₂₅₈ : ∫ (x : Icc (0 : ℝ) 1), (2 * (M g) ^ 2 * (f x - μ f) ^ 2 + 2 * (M f) ^ 2 * (g x - μ g) ^ 2) = 2 * (M g) ^ 2 * ∫ (x : Icc (0 : ℝ) 1), (f x - μ f) ^ 2 + 2 * (M f) ^ 2 * ∫ (x : Icc (0 : ℝ) 1), (g x - μ g) ^ 2 := by
                    have h₂₅₉ : ∫ (x : Icc (0 : ℝ) 1), (2 * (M g) ^ 2 * (f x - μ f) ^ 2 + 2 * (M f) ^ 2 * (g x - μ g) ^ 2) = ∫ (x : Icc (0 : ℝ) 1), (2 * (M g) ^ 2 * (f x - μ f) ^ 2) + ∫ (x : Icc (0 : ℝ) 1), (2 * (M f) ^ 2 * (g x - μ g) ^ 2) := by
                      have h₂₅₁₀ : ∫ (x : Icc (0 : ℝ) 1), (2 * (M g) ^ 2 * (f x - μ f) ^ 2 + 2 * (M f) ^ 2 * (g x - μ g) ^ 2) = ∫ (x : Icc (0 : ℝ) 1), (2 * (M g) ^ 2 * (f x - μ f) ^ 2) + ∫ (x : Icc (0 : ℝ) 1), (2 * (M f) ^ 2 * (g x - μ g) ^ 2) := by
                        apply?
                      rw [h₂₅₁₀]
                      <;> simp [hμ, hVar, hM]
                      <;> ring_nf
                      <;> simp_all [hμ, hVar, hM]
                      <;> linarith
                    rw [h₂₅₉]
                    have h₂₅₁₁ : ∫ (x : Icc (0 : ℝ) 1), (2 * (M g) ^ 2 * (f x - μ f) ^ 2) = 2 * (M g) ^ 2 * ∫ (x : Icc (0 : ℝ) 1), (f x - μ f) ^ 2 := by
                      have h₂₅₁₂ : ∫ (x : Icc (0 : ℝ) 1), (2 * (M g) ^ 2 * (f x - μ f) ^ 2) = 2 * (M g) ^ 2 * ∫ (x : Icc (0 : ℝ) 1), (f x - μ f) ^ 2 := by
                        have h₂₅₁₃ : ∫ (x : Icc (0 : ℝ) 1), (2 * (M g) ^ 2 * (f x - μ f) ^ 2) = 2 * (M g) ^ 2 * ∫ (x : Icc (0 : ℝ) 1), (f x - μ f) ^ 2 := by
                          simp [integral_mul_left, hμ, hVar, hM]
                          <;> ring_nf
                          <;> simp_all [hμ, hVar, hM]
                          <;> linarith
                        exact h₂₅₁₃
                      exact h₂₅₁₂
                    have h₂₅₁₄ : ∫ (x : Icc (0 : ℝ) 1), (2 * (M f) ^ 2 * (g x - μ g) ^ 2) = 2 * (M f) ^ 2 * ∫ (x : Icc (0 : ℝ) 1), (g x - μ g) ^ 2 := by
                      have h₂₅₁₅ : ∫ (x : Icc (0 : ℝ) 1), (2 * (M f) ^ 2 * (g x - μ g) ^ 2) = 2 * (M f) ^ 2 * ∫ (x : Icc (0 : ℝ) 1), (g x - μ g) ^ 2 := by
                        have h₂₅₁₆ : ∫ (x : Icc (0 : ℝ) 1), (2 * (M f) ^ 2 * (g x - μ g) ^ 2) = 2 * (M f) ^ 2 * ∫ (x : Icc (0 : ℝ) 1), (g x - μ g) ^ 2 := by
                          simp [integral_mul_left, hμ, hVar, hM]
                          <;> ring_nf
                          <;> simp_all [hμ, hVar, hM]
                          <;> linarith
                        exact h₂₅₁₆
                      exact h₂₅₁₅
                    rw [h₂₅₁₁, h₂₅₁₄]
                    <;> simp [hμ, hVar, hM]
                    <;> ring_nf
                    <;> simp_all [hμ, hVar, hM]
                    <;> linarith
                  exact h₂₅₈
                rw [h₂₅₇]
                <;> simp [hμ, hVar, hM]
                <;> ring_nf
                <;> simp_all [hμ, hVar, hM]
                <;> linarith
              rw [h₂₅₅]
              <;> ring_nf
              <;> simp_all [hμ, hVar, hM]
              <;> linarith
            have h₂₅₅ : ∫ (x : Icc (0 : ℝ) 1), ((f * g) x - μ f * μ g) ^ 2 ≤ 2 * (∫ (x : Icc (0 : ℝ) 1), (f x - μ f) ^ 2) * (M g) ^ 2 + 2 * (∫ (x : Icc (0 : ℝ) 1), (g x - μ g) ^ 2) * (M f) ^ 2 := by
              linarith
            exact h₂₅₅
          have h₂₅₆ : 2 * (∫ (x : Icc (0 : ℝ) 1), (f x - μ f) ^ 2) * (M g) ^ 2 + 2 * (∫ (x : Icc (0 : ℝ) 1), (g x - μ g) ^ 2) * (M f) ^ 2 = 2 * Var f * (M g) ^ 2 + 2 * Var g * (M f) ^ 2 := by
            have h₂₅₇ : Var f = ∫ (x : Icc (0 : ℝ) 1), (f x - μ f) ^ 2 := by
              rw [hVar]
              <;> simp [hμ]
              <;> rfl
            have h₂₅₈ : Var g = ∫ (x : Icc (0 : ℝ) 1), (g x - μ g) ^ 2 := by
              rw [hVar]
              <;> simp [hμ]
              <;> rfl
            rw [h₂₅₇, h₂₅₈]
            <;> ring_nf
            <;> simp_all [hμ, hVar, hM]
            <;> linarith
          linarith
        have h₂₅₉ : 2 * (∫ (x : Icc (0 : ℝ) 1), (f x - μ f) ^ 2) * (M g) ^ 2 + 2 * (∫ (x : Icc (0 : ℝ) 1), (g x - μ g) ^ 2) * (M f) ^ 2 = 2 * Var f * (M g) ^ 2 + 2 * Var g * (M f) ^ 2 := by
          have h₂₅₁₀ : Var f = ∫ (x : Icc (0 : ℝ) 1), (f x - μ f) ^ 2 := by
            rw [hVar]
            <;> simp [hμ]
            <;> rfl
          have h₂₅₁₁ : Var g = ∫ (x : Icc (0 : ℝ) 1), (g x - μ g) ^ 2 := by
            rw [hVar]
            <;> simp [hμ]
            <;> rfl
          rw [h₂₅₁₀, h₂₅₁₁]
          <;> ring_nf
          <;> simp_all [hμ, hVar, hM]
          <;> linarith
        linarith
      have h₂₆ : 2 * Var f * (M g) ^ 2 + 2 * Var g * (M f) ^ 2 = 2 * Var f * (M g) ^ 2 + 2 * Var g * (M f) ^ 2 := rfl
      linarith
    exact h₂₃
  have h₃ : Var (f * g) ≤ 2 * Var f * (M g) ^ 2 + 2 * Var g * (M f) ^ 2 := by
    have h₃₁ : Var (f * g) ≤ ∫ (x : Icc (0 : ℝ) 1), ((f * g) x - μ f * μ g) ^ 2 := h₁
    have h₃₂ : (∫ (x : Icc (0 : ℝ) 1), ((f * g) x - μ f * μ g) ^ 2) ≤ 2 * Var f * (M g) ^ 2 + 2 * Var g * (M f) ^ 2 := h₂
    linarith
  exact h₃