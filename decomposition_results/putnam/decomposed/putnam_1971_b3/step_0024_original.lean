theorem h₁₇ (T : ℝ) (hT : 0 < T) (h : ¬False) (h₁ h₂ : T > 0) (t : ℝ) (ht₁ : t ≥ T) (ht₂ : ⌊t⌋₊ = 2 * ⌊t - T⌋₊) (h₄ : t ≥ T) (h₅ : ⌊t⌋₊ = 2 * ⌊t - T⌋₊) (h₆ : T > 0) (h₈ : (↑⌊t⌋₊ : ℝ) ≤ t) (h₉ : t < (↑⌊t⌋₊ : ℝ) + 1) (h₁₀ : (↑⌊t - T⌋₊ : ℝ) ≤ t - T) (h₁₁ : t - T < (↑⌊t - T⌋₊ : ℝ) + 1) (h₁₂ : (↑⌊t⌋₊ : ℝ) = 2 * (↑⌊t - T⌋₊ : ℝ)) (h₁₃ : (↑⌊t⌋₊ : ℝ) ≤ t) (h₁₄ : t < (↑⌊t⌋₊ : ℝ) + 1) (h₁₅ : (↑⌊t - T⌋₊ : ℝ) ≤ t - T) (h₁₆ : t - T < (↑⌊t - T⌋₊ : ℝ) + 1) : (↑⌊t⌋₊ : ℝ) = 2 * (↑⌊t - T⌋₊ : ℝ) := by
  norm_cast at h₅ ⊢ <;> simp_all [Nat.floor_eq_iff, Int.floor_eq_iff, Nat.cast_add, Nat.cast_mul, Nat.cast_ofNat] <;>
        ring_nf at * <;>
      norm_num at * <;>
    linarith