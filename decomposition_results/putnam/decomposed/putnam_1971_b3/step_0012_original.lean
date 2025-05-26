theorem h₇ (T : ℝ) (hT : 0 < T) (h : ¬False) (h₁ h₂ : T > 0) (h₄ : 2 * T ≥ T) (h₅ : ⌊2 * T⌋₊ = 2 * ⌊T⌋₊) (h₆ : ⌊2 * T - T⌋₊ = ⌊T⌋₊) : ⌊2 * T⌋₊ = 2 * ⌊2 * T - T⌋₊ := by
  rw [h₆] <;> simp_all [Nat.floor_eq_iff, Int.floor_eq_iff, Nat.cast_add, Nat.cast_mul, Nat.cast_ofNat] <;>
        ring_nf at * <;>
      norm_num at * <;>
    linarith