theorem putnam_1984_b2
    (f : ℝ → ℝ → ℝ)
    (hf : ∀ u v : ℝ, f u v = (u - v) ^ 2 + (Real.sqrt (2 - u ^ 2) - 9 / v) ^ 2) :
    IsLeast {y | ∃ᵉ (u : Set.Ioo 0 √2) (v > 0), f u v = y} ((8) : ℝ ) :=
  by