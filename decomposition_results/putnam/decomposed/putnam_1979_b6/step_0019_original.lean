theorem h₁₅ (n : ℕ) (z : Fin n → ℂ) (h : ¬∑ i, z i ^ 2 = 0) (h₁ : ∑ i, z i ^ 2 ≠ 0) (h₂ : (∑ i, z i ^ 2) ^ (1 / 2) = (∑ i, z i ^ 2) ^ (1 / 2)) (h₃ : |((∑ i, z i ^ 2) ^ (1 / 2)).re| ≤ ((∑ i, z i ^ 2) ^ (1 / 2)).abs) (h₄ : ((∑ i, z i ^ 2) ^ (1 / 2)).abs = √(∑ i, z i ^ 2).abs) (h₆ : √(∑ i, z i ^ 2).abs ≤ √(∑ i, (z i ^ 2).abs)) (h₈ : √(∑ i, (z i ^ 2).abs) = √(∑ i, (z i).abs ^ 2)) (h₁₀ : ∀ (i : Fin n), 0 ≤ (z i).abs) (h₁₁ : 0 ≤ ∑ i, (z i).abs) (h₁₃ : ∑ i, (z i).abs ^ 2 ≤ (∑ i, (z i).abs) ^ 2) : √(∑ i, (z i).abs ^ 2) ≤ ∑ i, (z i).abs :=
  by
  apply Real.sqrt_le_iff.mpr
  constructor
  · positivity
  ·
    have h₁₆ : (∑ i : Fin n, Complex.abs (z i) : ℝ) ≥ 0 := by positivity
    have h₁₇ : (∑ i : Fin n, Complex.abs (z i) : ℝ) ^ 2 ≥ 0 := by positivity
    have h₁₈ : (∑ i : Fin n, Complex.abs (z i) ^ 2 : ℝ) ≤ (∑ i : Fin n, Complex.abs (z i) : ℝ) ^ 2 := by
      simpa [Complex.abs_pow, pow_two] using h₁₃
    nlinarith