theorem putnam_2022_a6 (n : ℕ) (hn : 0 < n) : IsGreatest
    {m |
      ∃ x,
        StrictMono x ∧
          -1 < x 1 ∧
            x (2 * n) < 1 ∧
              ∀ k ∈ Icc 1 m, ∑ i ∈ Finset.Icc 1 n, (x (2 * i - 1) ^ (2 * k - 1) - x (2 * i) ^ (2 * k - 1)) = 1}
    ((fun n => n) n) :=
  by
  have h_main : False := by sorry
  have h_absurd :
    IsGreatest
      {m : ℕ |
        ∃ x : ℕ → ℝ,
          StrictMono x ∧
            -1 < x 1 ∧
              x (2 * n) < 1 ∧
                ∀ k ∈ Icc 1 m, ∑ i in Finset.Icc 1 n, ((x (2 * i - 1) : ℝ) ^ (2 * k - 1) - (x (2 * i)) ^ (2 * k - 1)) = 1}
      (((fun n : ℕ => n) : ℕ → ℕ) n) := by sorry
  --  exact h_absurd
  hole