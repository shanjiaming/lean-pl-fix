theorem perfect_square_condition (m : ℤ) (h : (↑m : ℝ) = 2 + 2 * √(28 * sorry ^ 2 + 1)) (h_int : ∃ k, √(28 * sorry ^ 2 + 1) = (↑k : ℝ)) : ∃ k, m = k ^ 2 :=
  by
  have h_main : ∃ (t : ℤ), m = t ^ 2 := by sorry
  obtain ⟨t, ht⟩ := h_main
  exact ⟨t, by simp_all [sq]⟩