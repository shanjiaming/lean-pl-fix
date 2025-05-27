theorem cos_pi_rational_values (p q : ℤ) (h : ∃ r : ℚ, cos (p * π / q) = r) : ∃ r : ℚ, r ∈ ({0, 1, -1, 1/2, -1/2} : Set ℚ) ∧ cos (p * π / q) = r := by
  by_cases hq : q = 0
  · -- Case `q = 0`
    have h₁ : cos (p * π / q) = (1 : ℝ) := by
      have h₂ : (q : ℝ) = 0 := by exact_mod_cast hq
      have h₃ : (p * π / q : ℝ) = 0 := by
        rw [div_eq_mul_inv]
        simp [h₂, mul_zero]
        <;> ring_nf
        <;> field_simp [h₂]
        <;> ring_nf
      rw [h₃]
      norm_num [Real.cos_zero]
      <;>
      simp_all [Real.cos_zero]
    
    have h₂ : ∃ r : ℚ, r ∈ ({0, 1, -1, 1/2, -1/2} : Set ℚ) ∧ cos (p * π / q) = r := by
      refine' ⟨1, _⟩
      constructor
      · -- Prove that 1 is in the set {0, 1, -1, 1/2, -1/2}
        norm_num [Set.mem_insert, Set.mem_singleton_iff]
      · -- Prove that cos(p * π / q) = 1
        simpa [h₁] using h₁
      
    exact h₂
  · -- Case `q ≠ 0`
    have h₃ : ∃ (r : ℚ), r ∈ ({0, 1, -1, 1/2, -1/2} : Set ℚ) ∧ cos (p * π / q) = r := by
      obtain ⟨r, hr⟩ := h
      refine' ⟨r, _⟩
      constructor
      · -- Prove that r is in the set {0, 1, -1, 1/2, -1/2}
        have h₄ : (r : ℝ) = Real.cos (p * Real.pi / q) := by
          rw [hr]
          <;> norm_cast
        have h₅ : r = 0 ∨ r = 1 ∨ r = -1 ∨ r = 1 / 2 ∨ r = -1 / 2 := by
          sorry
        -- We now use the fact that r is one of the specified rational values
        have h₆ : r ∈ ({0, 1, -1, 1 / 2, -1 / 2} : Set ℚ) := by
          rcases h₅ with (rfl | rfl | rfl | rfl | rfl) <;> norm_num [Set.mem_insert, Set.mem_singleton_iff]
          <;>
          (try norm_num) <;>
          (try aesop) <;>
          (try ring_nf) <;>
          (try field_simp) <;>
          (try norm_num) <;>
          (try aesop)
        exact h₆
      · -- Prove that cos(p * π / q) = r
        exact hr
    exact h₃