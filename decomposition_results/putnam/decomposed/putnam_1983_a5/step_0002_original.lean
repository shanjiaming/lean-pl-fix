theorem h_main  : ∃ α > 0, ∀ n > 0, Even (⌊α ^ n⌋ - (↑n : ℤ)) :=
  by
  use 1 / 2
  constructor
  · norm_num
  · intro n hn
    have h₁ : ⌊((1 / 2 : ℝ) : ℝ) ^ n⌋ = 0 := by sorry
    rw [h₁]
    have h₂ : Even (0 - (n : ℤ)) := by sorry
    simpa [Int.even_iff, Int.emod_eq_emod_iff_emod_sub_eq_zero] using h₂