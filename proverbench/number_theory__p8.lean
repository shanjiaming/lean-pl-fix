theorem sum_of_squares_representation (x y z : ℕ) (h : x * y = z ^ 2 + 1) :
  ∃ (a b c d : ℤ), x = a ^ 2 + b ^ 2 ∧ y = c ^ 2 + d ^ 2 ∧ z = a * c + b * d := by
  have h₁ : x = 1 ∧ y = z ^ 2 + 1 ∨ x = z ^ 2 + 1 ∧ y = 1 ∨ ∃ (a b : ℤ), x = a ^ 2 + b ^ 2 ∧ y = 1 := by
    by_cases hx : x = 1
    · -- Case: x = 1
      refine' Or.inl ⟨hx, _⟩
      have h₂ : y = z ^ 2 + 1 := by
        have h₃ : (x : ℕ) * y = z ^ 2 + 1 := by simpa using h
        have h₄ : y = z ^ 2 + 1 := by
          norm_num [hx] at h₃ ⊢
          <;> nlinarith
        exact h₄
      exact h₂
    · -- Case: x ≠ 1
      by_cases hy : y = 1
      · -- Subcase: y = 1
        by_cases hx' : x = z ^ 2 + 1
        · -- Subsubcase: x = z ^ 2 + 1
          refine' Or.inr (Or.inl ⟨hx', hy⟩)
        · -- Subsubcase: x ≠ z ^ 2 + 1
          exfalso
          have h₂ : x * y = z ^ 2 + 1 := by simpa using h
          have h₃ : x = z ^ 2 + 1 := by
            have h₄ : y = 1 := by simpa using hy
            have h₅ : x * y = z ^ 2 + 1 := by simpa using h
            have h₆ : x = z ^ 2 + 1 := by
              simp_all [mul_comm]
              <;> ring_nf at *
              <;> nlinarith
            exact h₆
          contradiction
      · -- Subcase: y ≠ 1
        exfalso
        have h₂ : x * y = z ^ 2 + 1 := by simpa using h
        have h₃ : x = z ^ 2 + 1 := by
          by_contra h₄
          have h₅ : x ≠ 1 := hx
          have h₆ : y ≠ 1 := hy
          have h₇ : x > 1 := by
            by_contra h₈
            interval_cases x <;> simp_all [mul_comm]
            <;> ring_nf at * <;> nlinarith
          have h₈ : y > 1 := by
            by_contra h₉
            have h₉ : y = 0 ∨ y = 1 := by omega
            cases h₉ with
            | inl h₉ =>
              simp_all [mul_comm]
              <;> ring_nf at * <;> nlinarith
            | inr h₉ =>
              simp_all [mul_comm]
              <;> ring_nf at * <;> nlinarith
          have h₉ : x * y > z ^ 2 + 1 := by
            nlinarith [sq_nonneg (x - y), sq_nonneg (x - (z ^ 2 + 1)), sq_nonneg (y - (z ^ 2 + 1))]
          nlinarith
        have h₄ : x = z ^ 2 + 1 := by
          exact h₃
        have h₅ : y = 1 := by
          have h₅ : x * y = z ^ 2 + 1 := by simpa using h
          have h₆ : x = z ^ 2 + 1 := by exact h₃
          simp_all [mul_comm]
          <;> ring_nf at *
          <;> nlinarith
        contradiction

  have h₂ : ∃ (a b c d : ℤ), x = a ^ 2 + b ^ 2 ∧ y = c ^ 2 + d ^ 2 ∧ z = a * c + b * d := by
    cases h₁ with
    | inl h₁ =>
      have h₃ : x = 1 := h₁.1
      have h₄ : y = z ^ 2 + 1 := h₁.2
      use 1, 0, z, 1
      have h₅ : (x : ℤ) = 1 := by norm_cast <;> simp [h₃]
      have h₆ : (y : ℤ) = z ^ 2 + 1 := by norm_cast <;> simp [h₄]
      have h₇ : (z : ℤ) = z := by simp
      constructor
      · -- Prove x = a^2 + b^2
        norm_num [h₅]
      · constructor
        · -- Prove y = c^2 + d^2
          norm_num [h₆] <;> ring_nf <;> simp [h₇] <;> nlinarith
        · -- Prove z = a*c + b*d
          norm_num [h₅, h₆, h₇] <;> ring_nf <;> simp [h₃, h₄] <;> nlinarith
    | inr h₁ =>
      cases h₁ with
      | inl h₁ =>
        have h₃ : x = z ^ 2 + 1 := h₁.1
        have h₄ : y = 1 := h₁.2
        use z, 1, 1, 0
        have h₅ : (x : ℤ) = z ^ 2 + 1 := by norm_cast <;> simp [h₃]
        have h₆ : (y : ℤ) = 1 := by norm_cast <;> simp [h₄]
        have h₇ : (z : ℤ) = z := by simp
        constructor
        · -- Prove x = a^2 + b^2
          norm_num [h₅, h₇] <;> ring_nf <;> simp [h₃] <;> nlinarith
        · constructor
          · -- Prove y = c^2 + d^2
            norm_num [h₆]
          · -- Prove z = a*c + b*d
            norm_num [h₅, h₆, h₇] <;> ring_nf <;> simp [h₃, h₄] <;> nlinarith
      | inr h₁ =>
        obtain ⟨a, b, h₂, h₃⟩ := h₁
        use a, b, 1, 0
        have h₄ : (x : ℤ) = a ^ 2 + b ^ 2 := by
          norm_num at h₂ ⊢ <;>
          (try norm_cast) <;>
          (try simp_all) <;>
          (try ring_nf at * <;> nlinarith)
        have h₅ : (y : ℤ) = 1 := by
          norm_num at h₃ ⊢ <;>
          (try norm_cast) <;>
          (try simp_all) <;>
          (try ring_nf at * <;> nlinarith)
        have h₆ : (z : ℤ) = z := by simp
        constructor
        · -- Prove x = a^2 + b^2
          exact h₄
        · constructor
          · -- Prove y = c^2 + d^2
            norm_num [h₅]
          · -- Prove z = a*c + b*d
            have h₇ : (z : ℤ) = a * 1 + b * 0 := by
              have h₇₁ : (x : ℕ) * y = z ^ 2 + 1 := by simpa using h
              have h₇₂ : x = 1 := by
                norm_num [h₃] at h₂ ⊢ <;>
                (try norm_cast at h₂ ⊢) <;>
                (try simp_all) <;>
                (try ring_nf at * <;> nlinarith)
              have h₇₃ : y = 1 := by
                norm_num [h₃] at h₂ ⊢ <;>
                (try norm_cast at h₂ ⊢) <;>
                (try simp_all) <;>
                (try ring_nf at * <;> nlinarith)
              have h₇₄ : z = 0 := by
                norm_num [h₃, h₇₂, h₇₃] at h₇₁ ⊢ <;>
                (try norm_cast at h₇₁ ⊢) <;>
                (try simp_all) <;>
                (try ring_nf at * <;> nlinarith)
              norm_num [h₇₄, h₄, h₅, h₆] at h₂ ⊢ <;>
              (try norm_cast at h₂ ⊢) <;>
              (try simp_all) <;>
              (try ring_nf at * <;> nlinarith)
            simp_all [add_assoc]
            <;> ring_nf at *
            <;> nlinarith
  
  exact h₂