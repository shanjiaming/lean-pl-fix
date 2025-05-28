theorem h₂₆ (a b : ℝ) (g : ℝ → ℝ) (abint : 0 < a ∧ a < 1 / 2 ∧ 0 < b ∧ b < 1 / 2) (gcont : Continuous g) (hg : ∀ (x : ℝ), g (g x) = a * g x + b * x) (h₁ : 0 < a) (h₂ : a < 1 / 2) (h₃ : 0 < b) (h₄ : b < 1 / 2) (h₅ : 0 < a ^ 2 + 4 * b) (h₆ : 0 < √(a ^ 2 + 4 * b)) (h₇ : (a + √(a ^ 2 + 4 * b)) / 2 > 0) (h₈ : (a - √(a ^ 2 + 4 * b)) / 2 < 0) (h₉ : ((a + √(a ^ 2 + 4 * b)) / 2) ^ 2 - a * ((a + √(a ^ 2 + 4 * b)) / 2) - b = 0) (h₁₀ : ((a - √(a ^ 2 + 4 * b)) / 2) ^ 2 - a * ((a - √(a ^ 2 + 4 * b)) / 2) - b = 0) (h₁₁ : ∃ c > 0, c ^ 2 - a * c - b = 0) (c : ℝ) (hc₁ : c > 0) (hc₂ : c ^ 2 - a * c - b = 0) (hc₃ h₁₅ : ∀ (x : ℝ), g (g x) = a * g x + b * x) (h₁₆ : c ^ 2 - a * c - b = 0) (h₁₇ : c > 0) (h₁₈ : ContinuousOn (fun x => g x - c * x) univ) (h₂₁ : ∀ (x : ℝ), g (g x) = a * g x + b * x) (h₂₂ : c ^ 2 - a * c - b = 0) (h₂₃ : c > 0) (x : ℝ) (h₂₅ : g (g x) = a * g x + b * x) : g x = c * x := by
  --  by_contra h
  have h₂₇ : g x ≠ c * x := h
  have h₂₈ : g (g x) = a * g x + b * x := hg x
  have h₂₉ : g (g x) = a * g x + b * x := hg x
  have h₃₀ : g (g x) = a * g x + b * x := hg x
  have h₃₁ : g (g x) = a * g x + b * x := hg x
  have h₃₂ : c ^ 2 - a * c - b = 0 := hc₂
  have h₃₃ : c > 0 := hc₁
  have h₃₄ : ∃ (y : ℝ), g y ≠ c * y := by sorry
  have h₃₅ : False := by sorry
  --  contradiction
  hole