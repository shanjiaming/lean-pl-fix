theorem max_integral_value :
IsMaxOn (fun f => ∫ x in Set.Icc 0 1, (x^2 * f x - x * f x^2)) {f | Continuous f} f →
(∫ x in Set.Icc 0 1, (x^2 * f x - x * f x^2)) = 1/16 := by
  intro h_max
  have h1 : ∫ x in Set.Icc 0 1, (x^2 * f x - x * f x^2) ≤ 1/16 := by
    have h1₁ : (∫ x in Set.Icc 0 1, (x^2 * f x - x * f x^2)) = (∫ x in Set.Icc 0 1, (x^3 / 4 : ℝ)) - ∫ x in Set.Icc 0 1, (x * (f x - x / 2 : ℝ)^2 : ℝ) := by
      have h1₂ : (fun x : ℝ => (x^2 * f x - x * f x^2 : ℝ)) = (fun x : ℝ => (x^3 / 4 : ℝ) - x * (f x - x / 2 : ℝ)^2) := by
        funext x
        have h1₃ : x ^ 2 * f x - x * f x ^ 2 = x ^ 3 / 4 - x * (f x - x / 2) ^ 2 := by
          ring_nf
          <;> linarith
        rw [h1₃]
      rw [h1₂]
      -- Use the linearity of integrals to split the integral into two parts.
      have h1₃ : (∫ x in Set.Icc 0 1, (x ^ 3 / 4 : ℝ) - x * (f x - x / 2 : ℝ) ^ 2) = (∫ x in Set.Icc 0 1, (x ^ 3 / 4 : ℝ)) - ∫ x in Set.Icc 0 1, (x * (f x - x / 2 : ℝ) ^ 2 : ℝ) := by
        -- Prove the linearity of integrals for the given functions.
        rw [integral_sub]
        <;>
          (try
            {
              apply Continuous.integrableOn_Icc
              continuity
            }) <;>
          (try
            {
              apply Continuous.integrableOn_Icc
              continuity
            }) <;>
          (try
            {
              apply Continuous.integrableOn_Icc
              continuity
            })
        <;>
          (try
            {
              apply Continuous.integrableOn_Icc
              continuity
            })
      rw [h1₃]
      <;>
        (try
          {
            apply Continuous.integrableOn_Icc
            continuity
          })
      <;>
        (try
          {
            apply Continuous.integrableOn_Icc
            continuity
          })
    rw [h1₁]
    have h1₄ : (∫ x in Set.Icc 0 1, (x * (f x - x / 2 : ℝ)^2 : ℝ)) ≥ 0 := by
      -- Prove that the integral of a non-negative function is non-negative.
      have h1₅ : (fun x : ℝ => (x * (f x - x / 2 : ℝ)^2 : ℝ)) ≥ 0 := by
        intro x
        have h1₆ : x * (f x - x / 2 : ℝ) ^ 2 ≥ 0 := by
          have h1₇ : (f x - x / 2 : ℝ) ^ 2 ≥ 0 := by
            nlinarith
          have h1₈ : x ≥ 0 → x * (f x - x / 2 : ℝ) ^ 2 ≥ 0 := by
            intro hx
            nlinarith
          have h1₉ : x ≤ 1 → x ≥ 0 → x * (f x - x / 2 : ℝ) ^ 2 ≥ 0 := by
            intro hx hx'
            nlinarith
          by_cases hx : x ≥ 0
          · exact h1₈ hx
          · have hx' : x ≤ 0 := by linarith
            have h₁₀ : x ∈ Set.Icc 0 1 → x * (f x - x / 2 : ℝ) ^ 2 ≥ 0 := by
              intro h
              simp only [Set.mem_Icc] at h
              have h₁₁ : 0 ≤ x := by linarith
              have h₁₂ : x ≤ 1 := by linarith
              nlinarith
            by_cases h₁₁ : x ∈ Set.Icc 0 1
            · exact h₁₀ h₁₁
            · have h₁₂ : x < 0 ∨ x > 1 := by
                by_contra h₁₃
                push_neg at h₁₃
                have h₁₄ : x ∈ Set.Icc 0 1 := by
                  constructor <;> nlinarith
                contradiction
              cases h₁₂ with
              | inl h₁₂ =>
                have h₁₃ : x < 0 := h₁₂
                have h₁₄ : x ∉ Set.Icc 0 1 := by
                  intro h₁₅
                  simp only [Set.mem_Icc] at h₁₅
                  linarith
                simp_all
                <;> norm_num
                <;>
                linarith
              | inr h₁₂ =>
                have h₁₃ : x > 1 := h₁₂
                have h₁₄ : x ∉ Set.Icc 0 1 := by
                  intro h₁₅
                  simp only [Set.mem_Icc] at h₁₅
                  linarith
                simp_all
                <;> norm_num
                <;>
                linarith
          <;> norm_num at *
          <;> linarith
        exact h1₆
      -- Use the fact that the integral of a non-negative function is non-negative.
      have h1₆ : (∫ x in Set.Icc 0 1, (x * (f x - x / 2 : ℝ)^2 : ℝ)) ≥ 0 := by
        apply?
        <;>
          aesop
      exact h1₆
    have h1₅ : (∫ x in Set.Icc 0 1, (x ^ 3 / 4 : ℝ)) = 1 / 16 := by
      -- Prove that the integral of \(x^3 / 4\) from 0 to 1 is 1/16.
      norm_num [integral_Icc_eq_integral_Ioc, integral_Icc_eq_integral_Ioc,
        integral_pow, Real.rpow_two, mul_comm]
      <;>
        simp [div_eq_mul_inv]
      <;>
        ring_nf
      <;>
        field_simp
      <;>
        ring_nf
      <;>
        norm_num
      <;>
        simp_all [Real.rpow_two, mul_comm]
      <;>
        norm_num
      <;>
        simp_all [Real.rpow_two, mul_comm]
      <;>
        norm_num
    -- Combine the results to get the final inequality.
    have h1₆ : (∫ x in Set.Icc 0 1, (x ^ 3 / 4 : ℝ)) - ∫ x in Set.Icc 0 1, (x * (f x - x / 2 : ℝ) ^ 2 : ℝ) ≤ 1 / 16 := by
      rw [h1₅]
      linarith
    linarith
  
  have h2 : ∫ x in Set.Icc 0 1, (x^2 * f x - x * f x^2) ≥ 1/16 := by
    have h₂ : Continuous (fun x : ℝ => x / 2 : ℝ → ℝ) := by continuity
    have h₃ : (fun f : ℝ → ℝ => ∫ x in Set.Icc 0 1, (x ^ 2 * f x - x * f x ^ 2)) (fun x : ℝ => x / 2) = 1 / 16 := by
      -- Compute the integral for the function g(x) = x / 2
      have h₄ : (∫ x in Set.Icc 0 1, (x ^ 2 * ((fun x : ℝ => x / 2) x) - x * ((fun x : ℝ => x / 2) x) ^ 2)) = 1 / 16 := by
        -- Simplify the integrand
        have h₅ : (∫ x in Set.Icc 0 1, (x ^ 2 * ((fun x : ℝ => x / 2) x) - x * ((fun x : ℝ => x / 2) x) ^ 2)) = ∫ x in Set.Icc 0 1, (x ^ 3 / 4 : ℝ) := by
          -- Simplify the integrand further
          congr
          funext x
          ring_nf
        rw [h₅]
        -- Evaluate the integral
        have h₆ : (∫ x in Set.Icc 0 1, (x ^ 3 / 4 : ℝ)) = 1 / 16 := by
          norm_num [integral_Icc_eq_integral_Ioc, integral_Icc_eq_integral_Ioc,
            integral_pow, Real.rpow_two, mul_comm]
          <;>
            simp [div_eq_mul_inv]
          <;>
            ring_nf
          <;>
            field_simp
          <;>
            ring_nf
          <;>
            norm_num
          <;>
            simp_all [Real.rpow_two, mul_comm]
          <;>
            norm_num
          <;>
            simp_all [Real.rpow_two, mul_comm]
          <;>
            norm_num
        rw [h₆]
      simpa using h₄
    have h₄ : (∫ x in Set.Icc 0 1, (x ^ 2 * f x - x * f x ^ 2)) ≥ 1 / 16 := by
      have h₅ : (fun f : ℝ → ℝ => ∫ x in Set.Icc 0 1, (x ^ 2 * f x - x * f x ^ 2)) (fun x : ℝ => x / 2) ≤ (fun f : ℝ → ℝ => ∫ x in Set.Icc 0 1, (x ^ 2 * f x - x * f x ^ 2)) f := by
        apply h_max.2
        exact by
          -- Prove that the function \( g(x) = \frac{x}{2} \) is continuous
          exact h₂
      have h₆ : (∫ x in Set.Icc 0 1, (x ^ 2 * f x - x * f x ^ 2)) ≥ 1 / 16 := by
        linarith
      exact h₆
    exact h₄
  
  have h3 : ∫ x in Set.Icc 0 1, (x^2 * f x - x * f x^2) = 1/16 := by
    have h3 : ∫ x in Set.Icc 0 1, (x^2 * f x - x * f x^2) ≤ 1/16 := h1
    have h4 : ∫ x in Set.Icc 0 1, (x^2 * f x - x * f x^2) ≥ 1/16 := h2
    linarith
  
  apply h3