theorem infinitely_many_positive_integer_pairs_for_real_approximation (α : ℝ) :
  ∃ (p q : ℕ) (h : q > 0), ∀ (n : ℕ), n > 0 → ∃ (p_n q_n : ℕ) (h_n : q_n > 0), |α - (p_n : ℝ) / q_n| < 1 / q_n ^ 2:=
  by
  have h_main :
    ∃ (p q : ℕ) (h : q > 0), ∀ (n : ℕ), n > 0 → ∃ (p_n q_n : ℕ) (h_n : q_n > 0), |α - (p_n : ℝ) / q_n| < 1 / q_n ^ 2 := by sorry
  --  exact h_main
  hole