theorem h₁₁ (m : ℚ) (h₀ : 0 < m) (h₁ : ∑ k ∈ Finset.Icc 1 35, sin (5 * (↑k : ℝ) * π / 180) = tan ((↑m : ℝ) * π / 180)) (h₂ : (↑m.num : ℝ) / (↑m.den : ℝ) < 90) (h_sum : ∑ k ∈ Finset.Icc 1 35, sin (5 * (↑k : ℝ) * π / 180) = cos (2.5 * π / 180) / sin (2.5 * π / 180)) (h_sum_tan : ∑ k ∈ Finset.Icc 1 35, sin (5 * (↑k : ℝ) * π / 180) = tan (35 * π / 72)) (h_tan_eq h₃ : tan ((↑m : ℝ) * π / 180) = tan (35 * π / 72)) (h₆ : (↑m : ℝ) * π / 180 < π / 2) (h₇ : 35 * π / 72 < π / 2) (h₈ h₁₀ : tan ((↑m : ℝ) * π / 180) = tan (35 * π / 72)) : (↑m : ℝ) * π / 180 = 35 * π / 72 := by
  apply
    (injOn_tan.eq_iff
          ⟨by
            have h₁₂ : (m : ℝ) * Real.pi / 180 > 0 :=
              by
              have h₁₃ : (m : ℝ) > 0 := by exact_mod_cast h₀
              have h₁₄ : 0 < Real.pi := Real.pi_pos
              have h₁₅ : 0 < (180 : ℝ) := by norm_num
              positivity
            linarith, by linarith⟩
          ⟨by linarith, by linarith⟩).mp
      h₁₀