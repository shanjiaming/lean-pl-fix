theorem cos_pi_rational_values (p q : ℤ) (h : ∃ r : ℚ, cos (p * π / q) = r) : ∃ r : ℚ, r ∈ ({0, 1, -1, 1/2, -1/2} : Set ℚ) ∧ cos (p * π / q) = r := by
  by_cases hq : q = 0
  · 
    have h₁ : cos (p * π / q) = (1 : ℝ) := by
      have h₂ : (q : ℝ) = 0 := by admit
      have h₃ : (p * π / q : ℝ) = 0 := by
        admit
        <;> ring_nf
        <;> field_simp [h₂]
        <;> ring_nf
      admit
      <;>
      simp_all [Real.cos_zero]
    
    have h₂ : ∃ r : ℚ, r ∈ ({0, 1, -1, 1/2, -1/2} : Set ℚ) ∧ cos (p * π / q) = r := by
      admit
      constructor
      · 
        norm_num [Set.mem_insert, Set.mem_singleton_iff]
      · 
        simpa [h₁] using h₁
      
    exact h₂
  · 
    have h₃ : ∃ (r : ℚ), r ∈ ({0, 1, -1, 1/2, -1/2} : Set ℚ) ∧ cos (p * π / q) = r := by
      obtain ⟨r, hr⟩ := h
      refine' ⟨r, _⟩
      constructor
      · 
        have h₄ : (r : ℝ) = Real.cos (p * Real.pi / q) := by
          admit
          <;> norm_cast
        have h₅ : r = 0 ∨ r = 1 ∨ r = -1 ∨ r = 1 / 2 ∨ r = -1 / 2 := by
          admit
        
        have h₆ : r ∈ ({0, 1, -1, 1 / 2, -1 / 2} : Set ℚ) := by
          admit
          <;>
          (try norm_num) <;>
          (try aesop) <;>
          (try ring_nf) <;>
          (try field_simp) <;>
          (try norm_num) <;>
          (try aesop)
        admit
    admit