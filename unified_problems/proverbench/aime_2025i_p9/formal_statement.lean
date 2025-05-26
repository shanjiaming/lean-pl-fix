theorem aime_2025i_p9 (x y x' y' : ℝ) (hx : 0 < x) (hy : y < 0)
    (hx' : x' = x * Real.cos (Real.pi / 3) + y * Real.sin (Real.pi / 3))
    (hy' : y' = - x * Real.sin (Real.pi / 3) + y * Real.cos (Real.pi / 3))
    (h₀ : y = (x ^ 2) - 4) (h₁ : y' = (x' ^ 2) - 4) :
    ∃ (a b c d : ℕ), 0 < a ∧ 0 < b ∧ 0 < c ∧ Nat.Coprime a c ∧
    y = (a - Real.sqrt b) / c ∧ a + b + c = 62 := by