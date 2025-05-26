theorem putnam_1990_b5 :
    (∃ a : ℕ → ℝ, (∀ i, a i ≠ 0) ∧
      (∀ n ≥ 1, (∑ i in Finset.Iic n, a i • X ^ i : Polynomial ℝ).roots.toFinset.card = n)) ↔
    ((True) : Prop ) :=
  by