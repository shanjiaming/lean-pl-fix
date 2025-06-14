theorem infinitely_many_positive_integer_pairs_for_real_approximation (α : ℝ) :
  ∃ (p q : ℕ) (h : q > 0), ∀ (n : ℕ), n > 0 → ∃ (p_n q_n : ℕ) (h_n : q_n > 0),
  |α - (p_n : ℝ) / q_n| < 1 / q_n^2 := by
  have h_main : ∃ (p q : ℕ) (h : q > 0), ∀ (n : ℕ), n > 0 → ∃ (p_n q_n : ℕ) (h_n : q_n > 0), |α - (p_n : ℝ) / q_n| < 1 / q_n^2 := by
    use 0, 1, by norm_num
    intro n hn
    use ⌊α⌋.toNat, 1, by norm_num
    have h₁ : (⌊α⌋.toNat : ℝ) = ⌊α⌋ := by
      norm_cast
      <;> simp [Int.toNat_of_nonneg (Int.floor_nonneg.mpr (by
        -- Show that the floor of α is non-negative
        have h₂ : (0 : ℝ) ≤ ⌊α⌋ := by
          -- Use the property of the floor function
          have h₃ : (⌊α⌋ : ℝ) ≤ α := Int.floor_le α
          have h₄ : (⌊α⌋ : ℝ) ≤ α := by simpa using h₃
          by_contra h₅
          -- If ⌊α⌋ < 0, then α < 0, which contradicts the floor's property
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
        exact_mod_cast h₂
      ))]
      <;>
      simp_all [Int.floor_eq_iff, Int.cast_le, Int.cast_lt]
      <;>
      norm_num
      <;>
      linarith
    have h₂ : |α - (⌊α⌋.toNat : ℝ) / 1| < 1 / (1 : ℝ) ^ 2 := by
      rw [h₁]
      have h₃ : (⌊α⌋ : ℝ) ≤ α := Int.floor_le α
      have h₄ : α - 1 < (⌊α⌋ : ℝ) := by
        have h₅ : (⌊α⌋ : ℝ) > α - 1 := by
          linarith [Int.sub_one_lt_floor α]
        linarith
      have h₅ : |α - (⌊α⌋ : ℝ)| < 1 := by
        rw [abs_lt]
        constructor <;> linarith
      have h₆ : (1 : ℝ) / (1 : ℝ) ^ 2 = 1 := by norm_num
      have h₇ : |α - (⌊α⌋ : ℝ) / 1| < 1 := by
        have h₈ : (⌊α⌋ : ℝ) / 1 = (⌊α⌋ : ℝ) := by ring
        rw [h₈]
        exact h₅
      have h₈ : (1 : ℝ) / (1 : ℝ) ^ 2 = 1 := by norm_num
      rw [h₈]
      exact h₇
    simpa using h₂
  exact h_main