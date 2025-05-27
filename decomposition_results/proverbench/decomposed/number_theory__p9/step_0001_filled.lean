theorem perfect_square_condition (n : ℕ) (m : ℤ) (h : ↑m = 2 + 2 * √(28 * ↑n ^ 2 + 1)) (h_int : ∃ k, √(28 * ↑n ^ 2 + 1) = ↑k) : ∃ k, m = k ^ 2 :=
  by
  have h_main : ∃ (t : ℤ), m = t ^ 2 := by sorry
  --  obtain ⟨t, ht⟩ := h_main
  --  exact ⟨t, by simp_all [sq]⟩
  simpa