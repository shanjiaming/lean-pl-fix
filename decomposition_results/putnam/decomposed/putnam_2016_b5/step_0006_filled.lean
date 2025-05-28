theorem h₆ (f : ↑(Ioi 1) → ↑(Ioi 1)) (c : ℝ) (hc : c > 0) (hf : ∀ (x : ↑(Ioi 1)), ↑(f x) = ↑x ^ c) (x y : ↑(Ioi 1)) (hxy : ↑x ^ 2 ≤ ↑y ∧ ↑y ≤ ↑x ^ 3) (h₁ : ↑(f x) = ↑x ^ c) (h₂ : ↑(f y) = ↑y ^ c) (h₃ : ↑x ^ 2 ≤ ↑y) (h₄ : ↑y ≤ ↑x ^ 3) (h₅ : 1 < ↑x) : 1 < ↑y := by
  have h₇ : (1 : ℝ) < (x : ℝ) := x.2
  have h₈ : (x : ℝ) ^ 2 ≤ (y : ℝ) := hxy.1
  have h₉ : (1 : ℝ) < (x : ℝ) ^ 2 := by sorry
  nlinarith
  hole