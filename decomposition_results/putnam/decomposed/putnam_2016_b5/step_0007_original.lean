theorem h₉ (f : ↑(Ioi 1) → ↑(Ioi 1)) (c : ℝ) (hc : c > 0) (hf : ∀ (x : ↑(Ioi 1)), ↑(f x) = ↑x ^ c) (x y : ↑(Ioi 1)) (hxy : ↑x ^ 2 ≤ ↑y ∧ ↑y ≤ ↑x ^ 3) (h₁ : ↑(f x) = ↑x ^ c) (h₂ : ↑(f y) = ↑y ^ c) (h₃ : ↑x ^ 2 ≤ ↑y) (h₄ : ↑y ≤ ↑x ^ 3) (h₅ h₇ : 1 < ↑x) (h₈ : ↑x ^ 2 ≤ ↑y) : 1 < ↑x ^ 2 := by
  have h₁₀ : (1 : ℝ) < (x : ℝ) := x.2
  nlinarith