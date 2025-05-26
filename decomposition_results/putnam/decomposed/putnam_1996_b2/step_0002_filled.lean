theorem h1 (n : ℕ) (prododd : ℝ) (npos : n > 0) (hprododd : prododd = ∏ i ∈ Finset.range (2 * n), if Odd i then (↑i : ℝ) else 1) : (∏ i ∈ Finset.range (2 * n), if Odd i then (↑i : ℝ) else 1) = ∏ k ∈ Finset.range n, (2 * (↑k : ℝ) + 1) :=
  by
  have h2 :
    ∀ n : ℕ,
      n > 0 →
        (∏ i in Finset.range (2 * n), if Odd i then (i : ℝ) else 1 : ℝ) = ∏ k in Finset.range n, ((2 : ℝ) * k + 1) := by sorry
  --  exact h2 n npos
  hole