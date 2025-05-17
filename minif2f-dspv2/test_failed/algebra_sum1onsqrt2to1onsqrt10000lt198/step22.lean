theorem h₄ (h₁ : ∀ k ∈ Finset.Icc 2 10000, 1 / √(↑k : ℝ) < 2 * (√(↑k : ℝ) - √((↑k : ℝ) - 1))) : ∑ k ∈ Finset.Icc 2 10000, 2 * (√(↑k : ℝ) - √((↑k : ℝ) - 1)) = 2 * (√10000 - √1) :=
  by
  have h₅ :
    ∀ (n : ℕ),
      n ≥ 2 →
        (∑ k in Finset.Icc (2 : ℕ) n, 2 * (Real.sqrt (k : ℝ) - Real.sqrt ((k : ℝ) - 1))) =
          2 * (Real.sqrt (n : ℝ) - Real.sqrt (1 : ℝ)) := by sorry
  have h₆ :
    (∑ k in Finset.Icc (2 : ℕ) 10000, 2 * (Real.sqrt (k : ℝ) - Real.sqrt ((k : ℝ) - 1))) =
      2 * (Real.sqrt (10000 : ℝ) - Real.sqrt (1 : ℝ)) := by sorry
  rw [h₆]