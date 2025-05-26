/-- Main theorem that when the original fraction equals its decomposition,
    the sum of coefficients must be 13 -/
theorem sum_of_coefficients_equals_thirteen
    (h : ∀ X, originalFraction X = decomposedForm α β γ δ X) :
    α + β + γ + δ = 13 :=