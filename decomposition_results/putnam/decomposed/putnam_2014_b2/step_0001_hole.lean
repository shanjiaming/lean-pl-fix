theorem putnam_2014_b2  : IsGreatest
    {t |
      ∃ f,
        (∀ x ∈ Set.Icc 1 3, -1 ≤ f x ∧ f x ≤ 1) ∧
          ∫ (x : ℝ) in Set.Ioo 1 3, f x = 0 ∧ ∫ (x : ℝ) in Set.Ioo 1 3, f x / x = t}
    (Real.log (4 / 3)) :=
  by
  have h_main :
    IsGreatest
      {t |
        ∃ f : ℝ → ℝ,
          (∀ (x : ℝ), x ∈ Set.Icc 1 3 → -1 ≤ f x ∧ f x ≤ 1) ∧
            (∫ x in Set.Ioo 1 3, f x = 0) ∧ (∫ x in Set.Ioo 1 3, (f x) / x) = t}
      (Real.log (4 / 3)) := by sorry
  --  exact h_main
  hole