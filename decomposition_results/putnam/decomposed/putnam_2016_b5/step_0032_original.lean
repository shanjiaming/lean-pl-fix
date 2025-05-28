theorem h₂₀ (f : ↑(Ioi 1) → ↑(Ioi 1)) (c : ℝ) (hc : c > 0) (hf : ∀ (x : ↑(Ioi 1)), ↑(f x) = ↑x ^ c) (x y : ↑(Ioi 1)) (hxy : ↑x ^ 2 ≤ ↑y ∧ ↑y ≤ ↑x ^ 3) (h₁ : ↑(f x) = ↑x ^ c) (h₂ : ↑(f y) = ↑y ^ c) (h₃ : ↑x ^ 2 ≤ ↑y) (h₄ : ↑y ≤ ↑x ^ 3) (h₅ : 1 < ↑x) (h₆ : 1 < ↑y) (h₇ : ↑(f x) ^ 2 ≤ ↑(f y)) (h₉ : 0 < c) (h₁₀ : 0 < ↑x) (h₁₁ : 0 < ↑y) (h₁₂ : 0 < ↑x ^ c) (h₁₃ : 0 < ↑y ^ c) (h₁₄ : ↑y ≤ ↑x ^ 3) (h₁₅ : 0 < ↑x ^ 3) (h₁₆ : 0 < ↑y) (h₁₇ : ↑y ^ c ≤ (↑x ^ 3) ^ c) (h₁₈ : (↑x ^ 3) ^ c = ↑x ^ (3 * c)) : ↑x ^ (3 * c) = (↑x ^ c) ^ 3 := by
  calc
    (x : ℝ) ^ (3 * c) = (x : ℝ) ^ (c + c + c) := by ring_nf
    _ = (x : ℝ) ^ c * (x : ℝ) ^ c * (x : ℝ) ^ c := by
      rw [Real.rpow_add (by positivity : (0 : ℝ) < (x : ℝ)), Real.rpow_add (by positivity : (0 : ℝ) < (x : ℝ))] <;>
        ring_nf
    _ = ((x : ℝ) ^ c) ^ 3 := by ring