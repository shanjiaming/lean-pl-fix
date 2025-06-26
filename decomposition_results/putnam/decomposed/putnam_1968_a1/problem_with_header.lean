import Mathlib

/--
Prove that $$\frac{22}{7} - \pi = \int_{0}^{1} \frac{x^4(1 - x)^4}{1 + x^2} dx$$.
-/
theorem putnam_1968_a1
: 22/7 - Real.pi = ∫ x in (0)..1, x^4 * (1 - x)^4 / (1 + x^2) := by
  have h₀ : (∫ x in (0)..1, (x^4 * (1 - x)^4 / (1 + x^2)) ) = 22/7 - Real.pi := by
    have h₁ : (∫ x in (0)..1, (x^4 * (1 - x)^4 / (1 + x^2)) ) = ∫ x in (0)..1, (x^6 - 4 * x^5 + 5 * x^4 - 4 * x^2 + 4 - 4 / (1 + x^2)) := by
      apply intervalIntegral.integral_congr
      intro x hx
      have h₂ : x ∈ Set.Icc 0 1 := by exact hx
      have h₃ : 0 ≤ x := by linarith [h₂.1]
      have h₄ : x ≤ 1 := by linarith [h₂.2]
      have h₅ : (x : ℝ) ^ 4 * (1 - x) ^ 4 / (1 + x ^ 2) = (x ^ 6 - 4 * x ^ 5 + 5 * x ^ 4 - 4 * x ^ 2 + 4 - 4 / (1 + x ^ 2)) := by
        have h₅₁ : (x : ℝ) ^ 4 * (1 - x) ^ 4 = (x : ℝ) ^ 8 - 4 * x ^ 7 + 6 * x ^ 6 - 4 * x ^ 5 + x ^ 4 := by
          ring_nf
          <;>
          nlinarith
        have h₅₂ : (x : ℝ) ^ 8 - 4 * x ^ 7 + 6 * x ^ 6 - 4 * x ^ 5 + x ^ 4 = (1 + x ^ 2) * (x ^ 6 - 4 * x ^ 5 + 5 * x ^ 4 - 4 * x ^ 2 + 4) - 4 := by
          ring_nf
          <;>
          nlinarith
        have h₅₃ : (x : ℝ) ^ 4 * (1 - x) ^ 4 / (1 + x ^ 2) = (x ^ 6 - 4 * x ^ 5 + 5 * x ^ 4 - 4 * x ^ 2 + 4 - 4 / (1 + x ^ 2)) := by
          have h₅₄ : (1 + x ^ 2 : ℝ) ≠ 0 := by nlinarith
          field_simp [h₅₄]
          rw [h₅₁, h₅₂]
          <;>
          ring_nf
          <;>
          field_simp [h₅₄]
          <;>
          ring_nf
          <;>
          nlinarith
        exact h₅₃
      rw [h₅]
      <;>
      ring_nf
    rw [h₁]
    have h₂ : (∫ x in (0)..1, (x ^ 6 - 4 * x ^ 5 + 5 * x ^ 4 - 4 * x ^ 2 + 4 - 4 / (1 + x ^ 2) : ℝ)) = 22 / 7 - Real.pi := by
      have h₃ : (∫ x in (0)..1, (x ^ 6 - 4 * x ^ 5 + 5 * x ^ 4 - 4 * x ^ 2 + 4 - 4 / (1 + x ^ 2) : ℝ)) = (∫ x in (0)..1, (x ^ 6 - 4 * x ^ 5 + 5 * x ^ 4 - 4 * x ^ 2 + 4 : ℝ)) - ∫ x in (0)..1, (4 / (1 + x ^ 2) : ℝ) := by
        -- Split the integral into two parts
        have h₃₁ : (∫ x in (0)..1, (x ^ 6 - 4 * x ^ 5 + 5 * x ^ 4 - 4 * x ^ 2 + 4 - 4 / (1 + x ^ 2) : ℝ)) = (∫ x in (0)..1, (x ^ 6 - 4 * x ^ 5 + 5 * x ^ 4 - 4 * x ^ 2 + 4 : ℝ)) - ∫ x in (0)..1, (4 / (1 + x ^ 2) : ℝ) := by
          -- Use the linearity of the integral to split it
          have h₃₂ : (∫ x in (0)..1, (x ^ 6 - 4 * x ^ 5 + 5 * x ^ 4 - 4 * x ^ 2 + 4 - 4 / (1 + x ^ 2) : ℝ)) = (∫ x in (0)..1, (x ^ 6 - 4 * x ^ 5 + 5 * x ^ 4 - 4 * x ^ 2 + 4 : ℝ)) - ∫ x in (0)..1, (4 / (1 + x ^ 2) : ℝ) := by
            -- Use the linearity of the integral to split it
            rw [intervalIntegral.integral_sub]
            <;>
            (try norm_num) <;>
            (try
              {
                apply Continuous.intervalIntegrable
                continuity
              }) <;>
            (try
              {
                apply Continuous.intervalIntegrable
                continuity
              })
          exact h₃₂
        exact h₃₁
      rw [h₃]
      have h₄ : (∫ x in (0)..1, (x ^ 6 - 4 * x ^ 5 + 5 * x ^ 4 - 4 * x ^ 2 + 4 : ℝ)) = (22 / 7 : ℝ) := by
        -- Compute the integral of the polynomial part
        norm_num [integral_id, mul_comm]
        <;>
        ring_nf
        <;>
        norm_num
        <;>
        linarith
      have h₅ : (∫ x in (0)..1, (4 / (1 + x ^ 2) : ℝ)) = Real.pi := by
        -- Compute the integral of the rational part
        have h₅₁ : (∫ x in (0)..1, (4 / (1 + x ^ 2) : ℝ)) = 4 * (∫ x in (0)..1, (1 / (1 + x ^ 2) : ℝ)) := by
          -- Factor out the constant
          have h₅₂ : (∫ x in (0)..1, (4 / (1 + x ^ 2) : ℝ)) = 4 * (∫ x in (0)..1, (1 / (1 + x ^ 2) : ℝ)) := by
            -- Factor out the constant
            rw [show (∫ x in (0)..1, (4 / (1 + x ^ 2) : ℝ)) = ∫ x in (0)..1, (4 * (1 / (1 + x ^ 2) : ℝ)) by
              congr
              funext x
              ring]
            -- Factor out the constant
            rw [intervalIntegral.integral_comp_mul_right (fun x => 1 / (1 + x ^ 2 : ℝ))] <;>
            norm_num <;>
            ring_nf <;>
            norm_num <;>
            linarith
          exact h₅₂
        rw [h₅₁]
        -- Use the known integral of 1/(1+x^2)
        have h₅₃ : (∫ x in (0)..1, (1 / (1 + x ^ 2) : ℝ)) = Real.pi / 4 := by
          -- Use the known integral of 1/(1+x^2)
          have h₅₄ : (∫ x in (0)..1, (1 / (1 + x ^ 2) : ℝ)) = Real.pi / 4 := by
            -- Use the known integral of 1/(1+x^2)
            norm_num [integral_one_div_one_add_sq, Real.pi_pos.le]
            <;>
            linarith [Real.pi_pos]
          exact h₅₄
        rw [h₅₃]
        -- Simplify the expression
        ring_nf
        <;>
        field_simp [Real.pi_ne_zero, Real.pi_pos.ne']
        <;>
        ring_nf
        <;>
        linarith [Real.pi_pos]
      rw [h₄, h₅]
      <;>
      ring_nf
      <;>
      linarith [Real.pi_pos]
    rw [h₂]
    <;>
    ring_nf
    <;>
    linarith [Real.pi_pos]
  
  have h₁ : 22/7 - Real.pi = ∫ x in (0)..1, x^4 * (1 - x)^4 / (1 + x^2) := by
    rw [← h₀]
    <;>
    simp [mul_comm]
    <;>
    ring_nf
    <;>
    norm_num
    <;>
    linarith [Real.pi_pos]
  
  rw [h₁]
  <;>
  simp [mul_comm]
  <;>
  ring_nf
  <;>
  norm_num
  <;>
  linarith [Real.pi_pos]