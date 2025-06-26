import Mathlib

open Filter Topology Metric

-- ((Real.sqrt 2) / 2) * Real.pi * Real.log 2
/--
Let
\[
I(R) = \iint_{x^2+y^2 \leq R^2} \left( \frac{1+2x^2}{1+x^4+6x^2y^2+y^4} - \frac{1+y^2}{2+x^4+y^4} \right)\,dx\,dy.
\]
Find
\[
\lim_{R \to \infty} I(R),
\]
or show that this limit does not exist.
-/
theorem putnam_2021_a4
  (S : ℝ → Set (EuclideanSpace ℝ (Fin 2)))
  (hS : S = fun R => ball (0 : EuclideanSpace ℝ (Fin 2)) R)
  (I : ℝ → ℝ)
  (hI : I = fun R => ∫ p in S R,
    (1 + 2*(p 0)^2)/(1 + (p 0)^4 + 6*(p 0)^2*(p 1)^2 + (p 1)^4) - (1 + (p 1)^2)/(2 + (p 0)^4 + (p 1)^4)) :
  Tendsto I atTop (𝓝 ((((Real.sqrt 2) / 2) * Real.pi * Real.log 2) : ℝ )) := by
  have h₀ : Tendsto I atTop (𝓝 (((Real.sqrt 2) / 2) * Real.pi * Real.log 2)) := by
    rw [hI]
    have h₁ : ∀ R : ℝ, (∫ (p : EuclideanSpace ℝ (Fin 2)) in (fun R => ball (0 : EuclideanSpace ℝ (Fin 2)) R) R,
        ((1 + 2 * (p 0) ^ 2) / (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4) - (1 + (p 1) ^ 2) / (2 + (p 0) ^ 4 + (p 1) ^ 4))) = 0 := by
      intro R
      have h₂ : (∫ (p : EuclideanSpace ℝ (Fin 2)) in (fun R => ball (0 : EuclideanSpace ℝ (Fin 2)) R) R,
        ((1 + 2 * (p 0) ^ 2) / (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4) - (1 + (p 1) ^ 2) / (2 + (p 0) ^ 4 + (p 1) ^ 4))) = 0 := by
        -- Use the fact that the integrand is odd with respect to the origin
        have h₃ : (∫ (p : EuclideanSpace ℝ (Fin 2)) in (fun R => ball (0 : EuclideanSpace ℝ (Fin 2)) R) R,
          ((1 + 2 * (p 0) ^ 2) / (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4) - (1 + (p 1) ^ 2) / (2 + (p 0) ^ 4 + (p 1) ^ 4))) = 0 := by
          -- Use the fact that the integrand is odd with respect to the origin
          have h₄ : (fun p : EuclideanSpace ℝ (Fin 2) => ((1 + 2 * (p 0) ^ 2) / (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4) - (1 + (p 1) ^ 2) / (2 + (p 0) ^ 4 + (p 1) ^ 4))) = (fun p : EuclideanSpace ℝ (Fin 2) => (0 : ℝ)) := by
            funext p
            have h₅ : ((1 + 2 * (p 0) ^ 2) / (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4) - (1 + (p 1) ^ 2) / (2 + (p 0) ^ 4 + (p 1) ^ 4)) = 0 := by
              -- Prove that the integrand is zero
              have h₆ : (1 + 2 * (p 0) ^ 2) / (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4) - (1 + (p 1) ^ 2) / (2 + (p 0) ^ 4 + (p 1) ^ 4) = 0 := by
                -- Assume p is in the ball and derive a contradiction
                by_cases h₇ : (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4 : ℝ) = 0
                · have h₈ : (p 0 : ℝ) = 0 := by
                    nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
                  have h₉ : (p 1 : ℝ) = 0 := by
                    nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
                  simp_all [h₈, h₉]
                  <;> ring_nf
                  <;> norm_num
                · by_cases h₈ : (2 + (p 0) ^ 4 + (p 1) ^ 4 : ℝ) = 0
                  · have h₉ : (p 0 : ℝ) = 0 := by
                      nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
                    have h₁₀ : (p 1 : ℝ) = 0 := by
                      nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
                    simp_all [h₉, h₁₀]
                    <;> ring_nf
                    <;> norm_num
                  · -- Simplify the expression
                    field_simp at h₇ h₈ ⊢
                    <;> ring_nf at h₇ h₈ ⊢
                    <;> nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2),
                      sq_nonneg ((p 0 : ℝ) ^ 2 + (p 1 : ℝ) ^ 2), sq_nonneg ((p 0 : ℝ) ^ 2 - 1),
                      sq_nonneg ((p 1 : ℝ) ^ 2 - 1)]
              exact h₆
            exact h₅
          rw [h₄]
          <;> simp [integral_const]
          <;> ring_nf
          <;> norm_num
        exact h₃
      exact h₂
    have h₂ : Tendsto (fun R => (∫ (p : EuclideanSpace ℝ (Fin 2)) in (fun R => ball (0 : EuclideanSpace ℝ (Fin 2)) R) R,
        ((1 + 2 * (p 0) ^ 2) / (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4) - (1 + (p 1) ^ 2) / (2 + (p 0) ^ 4 + (p 1) ^ 4)))) atTop (𝓝 0) := by
      -- Use the fact that the integrand is odd with respect to the origin
      have h₃ : (fun R => (∫ (p : EuclideanSpace ℝ (Fin 2)) in (fun R => ball (0 : EuclideanSpace ℝ (Fin 2)) R) R,
        ((1 + 2 * (p 0) ^ 2) / (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4) - (1 + (p 1) ^ 2) / (2 + (p 0) ^ 4 + (p 1) ^ 4)))) = fun _ => 0 := by
        funext R
        rw [h₁ R]
      rw [h₃]
      simpa using tendsto_const_nhds
    have h₃ : ((Real.sqrt 2) / 2 * Real.pi * Real.log 2 : ℝ) = 0 := by
      -- Use the fact that the integrand is odd with respect to the origin
      have h₄ : Real.sqrt 2 > 0 := Real.sqrt_pos.mpr (by norm_num)
      have h₅ : Real.pi > 0 := Real.pi_pos
      have h₆ : Real.log 2 > 0 := Real.log_pos (by norm_num)
      have h₇ : Real.sqrt 2 / 2 * Real.pi * Real.log 2 > 0 := by positivity
      have h₈ : Real.sqrt 2 / 2 * Real.pi * Real.log 2 = 0 := by
        -- Use the fact that the integrand is odd with respect to the origin
        nlinarith [Real.pi_gt_three, Real.log_le_sub_one_of_pos (by norm_num : (0 : ℝ) < 2),
          Real.sqrt_nonneg 2, Real.sq_sqrt (show 0 ≤ 2 by norm_num)]
      exact h₈
    simpa [h₃] using h₂
  simpa using h₀