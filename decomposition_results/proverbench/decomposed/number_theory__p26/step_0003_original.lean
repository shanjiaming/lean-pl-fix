theorem h₁ (α : ℝ) (n : ℕ) (hn : n > 0) : ↑⌊α⌋.toNat = ↑⌊α⌋ := by
  norm_cast <;>
          simp [Int.toNat_of_nonneg
              (Int.floor_nonneg.mpr
                (by
                  have h₂ : (0 : ℝ) ≤ ⌊α⌋ := by
                    have h₃ : (⌊α⌋ : ℝ) ≤ α := Int.floor_le α
                    have h₄ : (⌊α⌋ : ℝ) ≤ α := by simpa using h₃
                    by_contra h₅
                    have h₆ : (⌊α⌋ : ℝ) < 0 := by linarith
                    have h₇ : (⌊α⌋ : ℤ) < 0 := by exact_mod_cast h₆
                    have h₈ : α < 0 := by
                      by_contra h₉
                      have h₁₀ : 0 ≤ α := by linarith
                      have h₁₁ : (⌊α⌋ : ℤ) ≥ 0 := by
                        apply Int.floor_nonneg.mpr
                        linarith
                      linarith
                    have h₉ : (⌊α⌋ : ℝ) ≤ α := Int.floor_le α
                    linarith
                  exact_mod_cast h₂))] <;>
        simp_all [Int.floor_eq_iff, Int.cast_le, Int.cast_lt] <;>
      norm_num <;>
    linarith