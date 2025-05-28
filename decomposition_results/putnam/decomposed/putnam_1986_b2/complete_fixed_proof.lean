theorem putnam_1986_b2 :
  ({T : ℂ × ℂ × ℂ |
      ∃ x y z : ℂ,
        T = (x - y, y - z, z - x) ∧
          x * (x - 1) + 2 * y * z = y * (y - 1) + 2 * z * x ∧ y * (y - 1) + 2 * z * x = z * (z - 1) + 2 * x * y} =
    (({(0, 0, 0), (0, -1, 1), (1, 0, -1), (-1, 1, 0)}) : Finset (ℂ × ℂ × ℂ))):=
  by
  have h_subset₁ :
    {T : ℂ × ℂ × ℂ |
        ∃ x y z : ℂ,
          T = (x - y, y - z, z - x) ∧
            x * (x - 1) + 2 * y * z = y * (y - 1) + 2 * z * x ∧ y * (y - 1) + 2 * z * x = z * (z - 1) + 2 * x * y} ⊆
      ({(0, 0, 0), (0, -1, 1), (1, 0, -1), (-1, 1, 0)} : Finset (ℂ × ℂ × ℂ)) := by sorry
  have h_subset₂ :
    ({(0, 0, 0), (0, -1, 1), (1, 0, -1), (-1, 1, 0)} : Finset (ℂ × ℂ × ℂ)) ⊆
      {T : ℂ × ℂ × ℂ |
        ∃ x y z : ℂ,
          T = (x - y, y - z, z - x) ∧
            x * (x - 1) + 2 * y * z = y * (y - 1) + 2 * z * x ∧ y * (y - 1) + 2 * z * x = z * (z - 1) + 2 * x * y} :=
    by
    intro T hT
    simp only [Finset.mem_insert, Finset.mem_singleton, Set.mem_setOf_eq] at hT ⊢
    rcases hT with (⟨rfl, rfl, rfl⟩ | ⟨rfl, rfl, rfl⟩ | ⟨rfl, rfl, rfl⟩ | ⟨rfl, rfl, rfl⟩)
    · refine' ⟨0, 0, 0, by simp [Complex.ext_iff], by simp [Complex.ext_iff], by simp [Complex.ext_iff]⟩
    · refine' ⟨0, 0, 1, by simp [Complex.ext_iff], by simp [Complex.ext_iff], by simp [Complex.ext_iff]⟩
    · refine' ⟨1, 0, 0, by simp [Complex.ext_iff], by simp [Complex.ext_iff], by simp [Complex.ext_iff]⟩
    · refine' ⟨0, 1, 0, by simp [Complex.ext_iff], by simp [Complex.ext_iff], by simp [Complex.ext_iff]⟩
  have h_main :
    {T : ℂ × ℂ × ℂ |
        ∃ x y z : ℂ,
          T = (x - y, y - z, z - x) ∧
            x * (x - 1) + 2 * y * z = y * (y - 1) + 2 * z * x ∧ y * (y - 1) + 2 * z * x = z * (z - 1) + 2 * x * y} =
      (({(0, 0, 0), (0, -1, 1), (1, 0, -1), (-1, 1, 0)}) : Finset (ℂ × ℂ × ℂ)) :=
    by
    apply Set.Subset.antisymm
    · exact h_subset₁
    · exact h_subset₂
  --  exact h_main
  hole