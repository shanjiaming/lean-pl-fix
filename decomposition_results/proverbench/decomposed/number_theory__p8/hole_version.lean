macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem sum_of_squares_representation (x y z : ℕ) (h : x * y = z ^ 2 + 1) :
  ∃ (a b c d : ℤ), x = a ^ 2 + b ^ 2 ∧ y = c ^ 2 + d ^ 2 ∧ z = a * c + b * d := by
  have h₁ : x = 1 ∧ y = z ^ 2 + 1 ∨ x = z ^ 2 + 1 ∧ y = 1 ∨ ∃ (a b : ℤ), x = a ^ 2 + b ^ 2 ∧ y = 1 := by
    by_cases hx : x = 1
    · 
      refine' Or.inl ⟨hx, _⟩
      have h₂ : y = z ^ 2 + 1 := by
        have h₃ : (x : ℕ) * y = z ^ 2 + 1 := by hole_4
        have h₄ : y = z ^ 2 + 1 := by
          hole_5
        hole_3
      exact h₂
    · 
      by_cases hy : y = 1
      · 
        by_cases hx' : x = z ^ 2 + 1
        · 
          refine' Or.inr (Or.inl ⟨hx', hy⟩)
        · 
          exfalso
          have h₂ : x * y = z ^ 2 + 1 := by hole_6
          have h₃ : x = z ^ 2 + 1 := by
            have h₄ : y = 1 := by hole_8
            have h₅ : x * y = z ^ 2 + 1 := by hole_9
            have h₆ : x = z ^ 2 + 1 := by
              hole_10
            hole_7
          contradiction
      · 
        exfalso
        have h₂ : x * y = z ^ 2 + 1 := by hole_11
        have h₃ : x = z ^ 2 + 1 := by
          by_contra h₄
          have h₅ : x ≠ 1 := hx
          have h₆ : y ≠ 1 := hy
          have h₇ : x > 1 := by
            hole_13
          have h₈ : y > 1 := by
            by_contra h₉
            have h₉ : y = 0 ∨ y = 1 := by hole_15
            hole_14
          have h₉ : x * y > z ^ 2 + 1 := by
            hole_16
          hole_12
        have h₄ : x = z ^ 2 + 1 := by
          hole_17
        have h₅ : y = 1 := by
          have h₅ : x * y = z ^ 2 + 1 := by hole_19
          have h₆ : x = z ^ 2 + 1 := by hole_20
          hole_18
        hole_2

  have h₂ : ∃ (a b c d : ℤ), x = a ^ 2 + b ^ 2 ∧ y = c ^ 2 + d ^ 2 ∧ z = a * c + b * d := by
    cases h₁ with
    | inl h₁ =>
      have h₃ : x = 1 := h₁.1
      have h₄ : y = z ^ 2 + 1 := h₁.2
      use 1, 0, z, 1
      have h₅ : (x : ℤ) = 1 := by hole_22
      have h₆ : (y : ℤ) = z ^ 2 + 1 := by hole_23
      have h₇ : (z : ℤ) = z := by hole_24
      constructor
      · 
        norm_num [h₅]
      · constructor
        · 
          norm_num [h₆] <;> ring_nf <;> simp [h₇] <;> nlinarith
        · 
          norm_num [h₅, h₆, h₇] <;> ring_nf <;> simp [h₃, h₄] <;> nlinarith
    | inr h₁ =>
      cases h₁ with
      | inl h₁ =>
        have h₃ : x = z ^ 2 + 1 := h₁.1
        have h₄ : y = 1 := h₁.2
        use z, 1, 1, 0
        have h₅ : (x : ℤ) = z ^ 2 + 1 := by hole_25
        have h₆ : (y : ℤ) = 1 := by hole_26
        have h₇ : (z : ℤ) = z := by hole_27
        constructor
        · 
          norm_num [h₅, h₇] <;> ring_nf <;> simp [h₃] <;> nlinarith
        · constructor
          · 
            norm_num [h₆]
          · 
            norm_num [h₅, h₆, h₇] <;> ring_nf <;> simp [h₃, h₄] <;> nlinarith
      | inr h₁ =>
        obtain ⟨a, b, h₂, h₃⟩ := h₁
        use a, b, 1, 0
        have h₄ : (x : ℤ) = a ^ 2 + b ^ 2 := by
          hole_28
        have h₅ : (y : ℤ) = 1 := by
          hole_29
        have h₆ : (z : ℤ) = z := by hole_30
        constructor
        · 
          exact h₄
        · constructor
          · 
            norm_num [h₅]
          · 
            have h₇ : (z : ℤ) = a * 1 + b * 0 := by
              have h₇₁ : (x : ℕ) * y = z ^ 2 + 1 := by hole_32
              have h₇₂ : x = 1 := by
                hole_33
              have h₇₃ : y = 1 := by
                hole_34
              have h₇₄ : z = 0 := by
                hole_35
              hole_31
            simp_all [add_assoc]
            <;> ring_nf at *
            <;> nlinarith
  
  hole_1