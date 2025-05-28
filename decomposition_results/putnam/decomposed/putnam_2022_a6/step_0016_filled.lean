theorem h_absurd (n : ℕ) (hn : 0 < n) (h_main : False) : IsGreatest
    {m |
      ∃ x,
        StrictMono x ∧
          -1 < x 1 ∧
            x (2 * n) < 1 ∧
              ∀ k ∈ Icc 1 m, ∑ i ∈ Finset.Icc 1 n, (x (2 * i - 1) ^ (2 * k - 1) - x (2 * i) ^ (2 * k - 1)) = 1}
    ((fun n => n) n) :=
  by
  --  exfalso
  --  exact h_main
  norm_cast