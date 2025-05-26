theorem unique_solution :
  ∃! x : ℚ × ℚ × ℚ,
    -19 * x.1 + 8 * x.2.1 = -108 ∧ -71 * x.1 + 30 * x.2.1 = -404 ∧ -2 * x.1 + x.2.1 = -12 ∧ 4 * x.1 + x.2.2 = 14:=
  by
  have h_exists :
    ∃ (x : ℚ × ℚ × ℚ),
      -19 * x.1 + 8 * x.2.1 = -108 ∧ -71 * x.1 + 30 * x.2.1 = -404 ∧ -2 * x.1 + x.2.1 = -12 ∧ 4 * x.1 + x.2.2 = 14 := by sorry
  have h_unique :
    ∀ (x y : ℚ × ℚ × ℚ),
      (-19 * x.1 + 8 * x.2.1 = -108 ∧ -71 * x.1 + 30 * x.2.1 = -404 ∧ -2 * x.1 + x.2.1 = -12 ∧ 4 * x.1 + x.2.2 = 14) →
        (-19 * y.1 + 8 * y.2.1 = -108 ∧ -71 * y.1 + 30 * y.2.1 = -404 ∧ -2 * y.1 + y.2.1 = -12 ∧ 4 * y.1 + y.2.2 = 14) →
          x = y := by sorry
  --  obtain ⟨x, hx⟩ := h_exists
  --  refine' ⟨x, hx, _⟩
  intro y hy
  have h_eq : y = x := h_unique y x hy hx
  rw [h_eq]
  hole