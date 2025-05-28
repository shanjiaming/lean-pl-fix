theorem h₁₈ (f : ↑(Ioi 1) → ↑(Ioi 1)) (c : ℝ) (hc : c > 0) (hf : ∀ (x : ↑(Ioi 1)), ↑(f x) = ↑x ^ c) (x y : ↑(Ioi 1)) (hxy : ↑x ^ 2 ≤ ↑y ∧ ↑y ≤ ↑x ^ 3) (h₁ : ↑(f x) = ↑x ^ c) (h₂ : ↑(f y) = ↑y ^ c) (h₃ : ↑x ^ 2 ≤ ↑y) (h₄ : ↑y ≤ ↑x ^ 3) (h₅ : 1 < ↑x) (h₆ : 1 < ↑y) (h₇ : ↑(f x) ^ 2 ≤ ↑(f y)) (h₉ : 0 < c) (h₁₀ : 0 < ↑x) (h₁₁ : 0 < ↑y) (h₁₂ : 0 < ↑x ^ c) (h₁₃ : 0 < ↑y ^ c) (h₁₄ : ↑y ≤ ↑x ^ 3) (h₁₅ : 0 < ↑x ^ 3) (h₁₆ : 0 < ↑y) (h₁₇ : ↑y ^ c ≤ (↑x ^ 3) ^ c) : (↑x ^ 3) ^ c = ↑x ^ (3 * c) :=
  by
  rw [← Real.rpow_nat_cast]
  rw [← Real.rpow_mul] <;> ring_nf <;> nlinarith