theorem integral_over_triangular_prism :(∫⁻ (p : ℝ × ℝ × ℝ) in {p : ℝ × ℝ × ℝ | p.1 ∈ Set.Icc 0 5 ∧ p.2.1 ∈ Set.Icc 0 1 ∧
  p.2.2 ∈ Set.Icc 0 1 ∧ p.2.1 + p.2.2 ≤ 1}, ENNReal.ofReal p.2.2) = 5 / 6 :=