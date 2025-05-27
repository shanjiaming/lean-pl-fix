/-- Theorem: If the limit of f(x) as x approaches x₀ is A and A > 0, then f(x) > 0 in some punctured neighborhood of x₀. -/
theorem limit_positive_implies_function_positive (h : Tendsto f (𝓝 x₀) (𝓝 A)) (hA : A > (0 : Y)) :
∃ δ > (0 : ℝ), ∀ x, 0 < dist x x₀ ∧ dist x x₀ < δ → 0 < f x :=