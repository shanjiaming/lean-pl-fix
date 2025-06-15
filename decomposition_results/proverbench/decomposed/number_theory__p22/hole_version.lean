macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem cos_pi_rational_values (p q : ℤ) (h : ∃ r : ℚ, cos (p * π / q) = r) : ∃ r : ℚ, r ∈ ({0, 1, -1, 1/2, -1/2} : Set ℚ) ∧ cos (p * π / q) = r := by
  by_cases hq : q = 0
  · 
    have h₁ : cos (p * π / q) = (1 : ℝ) := by
      have h₂ : (q : ℝ) = 0 := by hole_3
      have h₃ : (p * π / q : ℝ) = 0 := by
        hole_4
        <;> ring_nf
        <;> field_simp [h₂]
        <;> ring_nf
      hole_2
      <;>
      simp_all [Real.cos_zero]
    
    have h₂ : ∃ r : ℚ, r ∈ ({0, 1, -1, 1/2, -1/2} : Set ℚ) ∧ cos (p * π / q) = r := by
      hole_5
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
          hole_7
          <;> norm_cast
        have h₅ : r = 0 ∨ r = 1 ∨ r = -1 ∨ r = 1 / 2 ∨ r = -1 / 2 := by
          hole_8
        
        have h₆ : r ∈ ({0, 1, -1, 1 / 2, -1 / 2} : Set ℚ) := by
          hole_9
          <;>
          (try norm_num) <;>
          (try aesop) <;>
          (try ring_nf) <;>
          (try field_simp) <;>
          (try norm_num) <;>
          (try aesop)
        hole_6
    hole_1