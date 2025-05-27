theorem aime_2024i_p7 (f : ℂ → ℂ)
    (h₀ : ∀ (z : ℂ), f z = (75 + 117 * Complex.I) * z + (96 + 144 * Complex.I) / z) :
    IsGreatest {x : ℝ | ∃ (z : ℂ), Complex.abs z = 4 ∧ (f z).re = x} 540 := by