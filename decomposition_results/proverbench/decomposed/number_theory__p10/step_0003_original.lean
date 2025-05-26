theorem h₁ (α : ℝ) (hα : Irrational α) (n : ℕ) (hn : 0 < n) : ∃ k p, 0 < k ∧ k ≤ n ∧ |(↑k : ℝ) * α - (↑p : ℝ)| < 1 / ((↑n : ℝ) + 1) :=
  by
  have h₂ :
    ∃ (i j : ℕ),
      i < j ∧ j ≤ n ∧ |(j : ℝ) * α - (i : ℝ) * α - (round ((j : ℝ) * α) - round ((i : ℝ) * α))| < 1 / (n + 1 : ℝ) := by sorry
  obtain ⟨i, j, hij, hj, hdiff⟩ := h₂
  by_cases h : i = 0
  · use j, round ((j : ℝ) * α)
    have hj' : 0 < j := by sorry
    have hj'' : j ≤ n := by sorry
    constructor
    · exact_mod_cast hj'
    constructor
    · exact hj''
    · simpa [h, abs_sub_lt_iff] using hdiff
  · use j - i, round ((j : ℝ) * α) - round ((i : ℝ) * α)
    have h₁ : 0 < j - i := by sorry
    have h₂ : j - i ≤ n := by sorry
    have h₃ : |(j - i : ℝ) * α - (round ((j : ℝ) * α) - round ((i : ℝ) * α))| < 1 / (n + 1 : ℝ) := by sorry
    constructor
    · exact_mod_cast h₁
    constructor
    · omega
    · simpa [abs_sub_lt_iff] using h₃