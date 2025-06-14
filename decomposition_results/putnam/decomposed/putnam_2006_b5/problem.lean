theorem putnam_2006_b5
  (I J : (ℝ → ℝ) → ℝ)
  (hI : I = fun f ↦ ∫ x in (0)..1, x ^ 2 * (f x))
  (hJ : J = fun f ↦ ∫ x in (0)..1, x * (f x) ^ 2) :
  IsGreatest
    {y | ∃ f : ℝ → ℝ, ContinuousOn f (Icc 0 1) ∧ I f - J f = y}
    ((1 / 16) : ℝ ) := by
  have h₁ : (1 / 16 : ℝ) ∈ {y | ∃ f : ℝ → ℝ, ContinuousOn f (Icc 0 1) ∧ I f - J f = y} := by
    use fun x => x / 2
    constructor
    · -- Prove that f(x) = x / 2 is continuous on [0, 1]
      apply ContinuousOn.div
      · exact continuousOn_id
      · exact continuousOn_const
      · intro x hx
        norm_num at hx ⊢
        <;> linarith
    · -- Prove that I(f) - J(f) = 1 / 16
      rw [hI, hJ]
      have h₂ : (∫ x in (0)..1, x ^ 2 * ((fun x => x / 2 : ℝ → ℝ) x)) = 1 / 8 := by
        -- Compute the integral of x^2 * (x / 2) from 0 to 1
        norm_num [mul_comm]
        <;>
        ring_nf
        <;>
        norm_num
        <;>
        (try norm_num) <;>
        (try ring_nf) <;>
        (try norm_num) <;>
        (try linarith) <;>
        (try ring_nf) <;>
        (try norm_num) <;>
        (try linarith)
        <;>
        simp [mul_comm]
        <;>
        norm_num
        <;>
        ring_nf
        <;>
        norm_num
        <;>
        linarith
      have h₃ : (∫ x in (0)..1, x * ((fun x => x / 2 : ℝ → ℝ) x) ^ 2) = 1 / 16 := by
        -- Compute the integral of x * (x / 2)^2 from 0 to 1
        norm_num [mul_comm]
        <;>
        ring_nf
        <;>
        norm_num
        <;>
        (try norm_num) <;>
        (try ring_nf) <;>
        (try norm_num) <;>
        (try linarith) <;>
        (try ring_nf) <;>
        (try norm_num) <;>
        (try linarith)
        <;>
        simp [mul_comm]
        <;>
        norm_num
        <;>
        ring_nf
        <;>
        norm_num
        <;>
        linarith
      rw [h₂, h₃]
      <;> norm_num
  
  have h₂ : ∀ (y : ℝ), y ∈ {y | ∃ f : ℝ → ℝ, ContinuousOn f (Icc 0 1) ∧ I f - J f = y} → y ≤ (1 / 16 : ℝ) := by
    intro y hy
    rcases hy with ⟨f, hf_cont, hf⟩
    have h₃ : I f - J f = y := hf
    have h₄ : I f - J f ≤ (1 / 16 : ℝ) := by
      rw [hI, hJ] at *
      have h₅ : (∫ x in (0)..1, x ^ 2 * f x) - ∫ x in (0)..1, x * (f x) ^ 2 ≤ (1 / 16 : ℝ) := by
        have h₆ : (∫ x in (0)..1, x ^ 2 * f x - x * (f x) ^ 2) ≤ (1 / 16 : ℝ) := by
          have h₇ : ∀ x ∈ Set.Icc (0 : ℝ) (1 : ℝ), x ^ 2 * f x - x * (f x) ^ 2 ≤ x ^ 3 / 4 := by
            intro x hx
            have h₈ : 0 ≤ x := by exact hx.1
            have h₉ : x ≤ 1 := by exact hx.2
            have h₁₀ : x ^ 2 * f x - x * (f x) ^ 2 ≤ x ^ 3 / 4 := by
              -- Use the quadratic formula to show that the expression is bounded above by x^3 / 4
              have h₁₁ : x * (f x) ^ 2 - x ^ 2 * f x + x ^ 3 / 4 ≥ 0 := by
                -- Use the quadratic formula to show that the expression is non-negative
                have h₁₂ : x * (f x) ^ 2 - x ^ 2 * f x + x ^ 3 / 4 = x * (f x - x / 2) ^ 2 := by
                  -- Complete the square
                  ring
                  <;> field_simp
                  <;> ring
                  <;> field_simp
                  <;> ring
                rw [h₁₂]
                -- Use the fact that the square of a real number is non-negative
                have h₁₃ : 0 ≤ x * (f x - x / 2) ^ 2 := by
                  exact mul_nonneg h₈ (sq_nonneg _)
                linarith
              linarith
            exact h₁₀
          -- Integrate the inequality over the interval [0, 1]
          have h₁₅ : (∫ x in (0)..1, x ^ 2 * f x - x * (f x) ^ 2) ≤ ∫ x in (0)..1, (x ^ 3 / 4 : ℝ) := by
            apply intervalIntegral.integral_mono_on
            · -- Prove that the integrand x^2 * f x - x * (f x)^2 is integrable on [0, 1]
              apply Continuous.intervalIntegrable
              have h₂₀ : ContinuousOn (fun x : ℝ => x ^ 2 * f x - x * (f x) ^ 2) (Set.Icc 0 1) := by
                have h₂₁ : ContinuousOn (fun x : ℝ => x ^ 2 * f x) (Set.Icc 0 1) := by
                  exact ContinuousOn.mul (continuousOn_pow 2) (hf_cont)
                have h₂₂ : ContinuousOn (fun x : ℝ => x * (f x) ^ 2) (Set.Icc 0 1) := by
                  exact ContinuousOn.mul continuousOn_id (ContinuousOn.pow hf_cont 2)
                exact ContinuousOn.sub h₂₁ h₂₂
              exact h₂₀.continuousOn
            · -- Prove that x^3 / 4 is integrable on [0, 1]
              apply Continuous.intervalIntegrable
              continuity
            · -- Prove that x^2 * f x - x * (f x)^2 ≤ x^3 / 4 for all x in [0, 1]
              intro x hx
              exact h₇ x ⟨hx.1, hx.2⟩
          have h₁₆ : (∫ x in (0)..1, (x ^ 3 / 4 : ℝ)) = (1 / 16 : ℝ) := by
            -- Integrate x^3 / 4 from 0 to 1
            norm_num [integral_pow]
            <;>
            simp_all [mul_comm]
            <;>
            norm_num
            <;>
            ring_nf
            <;>
            norm_num
            <;>
            linarith
          rw [h₁₆] at h₁₅
          exact h₁₅
        have h₁₇ : (∫ x in (0)..1, x ^ 2 * f x - x * (f x) ^ 2) = (∫ x in (0)..1, x ^ 2 * f x) - ∫ x in (0)..1, x * (f x) ^ 2 := by
          -- Use the linearity of the integral to split the integral of the difference into the difference of integrals
          have h₁₈ : (∫ x in (0)..1, x ^ 2 * f x - x * (f x) ^ 2) = (∫ x in (0)..1, x ^ 2 * f x) - ∫ x in (0)..1, x * (f x) ^ 2 := by
            rw [intervalIntegral.integral_sub]
            · -- Prove that the integrals are integrable
              apply Continuous.intervalIntegrable
              have h₂₀ : ContinuousOn (fun x : ℝ => x ^ 2 * f x) (Set.Icc 0 1) := by
                exact ContinuousOn.mul (continuousOn_pow 2) (hf_cont)
              exact h₂₀.continuousOn
              apply Continuous.intervalIntegrable
              have h₂₁ : ContinuousOn (fun x : ℝ => x * (f x) ^ 2) (Set.Icc 0 1) := by
                exact ContinuousOn.mul continuousOn_id (ContinuousOn.pow hf_cont 2)
              exact h₂₁.continuousOn
            · -- Prove that the integrals are integrable
              apply Continuous.intervalIntegrable
              have h₂₀ : ContinuousOn (fun x : ℝ => x ^ 2 * f x) (Set.Icc 0 1) := by
                exact ContinuousOn.mul (continuousOn_pow 2) (hf_cont)
              exact h₂₀.continuousOn
              apply Continuous.intervalIntegrable
              have h₂₁ : ContinuousOn (fun x : ℝ => x * (f x) ^ 2) (Set.Icc 0 1) := by
                exact ContinuousOn.mul continuousOn_id (ContinuousOn.pow hf_cont 2)
              exact h₂₁.continuousOn
          rw [h₁₈]
          <;> simp
        rw [h₁₇] at h₆
        linarith
      linarith
    linarith
  
  have h_main : IsGreatest {y | ∃ f : ℝ → ℝ, ContinuousOn f (Icc 0 1) ∧ I f - J f = y} ((1 / 16 : ℝ)) := by
    refine' ⟨h₁, _⟩
    intro y hy
    have h₃ : y ≤ (1 / 16 : ℝ) := h₂ y hy
    exact h₃
  
  exact h_main