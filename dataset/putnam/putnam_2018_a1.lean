theorem putnam_2018_a1
  (a b : ℤ)
  (h : 0 < a ∧ 0 < b) :
  ((1 : ℚ) / a + (1 : ℚ) / b = (3 : ℚ) / 2018) ↔ (⟨a, b⟩ ∈ (({⟨673, 1358114⟩, ⟨674, 340033⟩, ⟨1009, 2018⟩, ⟨2018, 1009⟩, ⟨340033, 674⟩, ⟨1358114, 673⟩}) : Set (ℤ × ℤ) )) := by
  have h_main : ((1 : ℚ) / a + (1 : ℚ) / b = (3 : ℚ) / 2018) ↔ (⟨a, b⟩ ∈ (({⟨673, 1358114⟩, ⟨674, 340033⟩, ⟨1009, 2018⟩, ⟨2018, 1009⟩, ⟨340033, 674⟩, ⟨1358114, 673⟩}) : Set (ℤ × ℤ) )) := by
    constructor
    · -- Prove the forward direction: if 1/a + 1/b = 3/2018, then (a, b) is one of the six pairs.
      intro h₁
      have h₂ : a > 0 := by linarith
      have h₃ : b > 0 := by linarith
      have h₄ : (a : ℚ) > 0 := by exact_mod_cast h₂
      have h₅ : (b : ℚ) > 0 := by exact_mod_cast h₃
      have h₆ : (1 : ℚ) / a + (1 : ℚ) / b = (3 : ℚ) / 2018 := h₁
      have h₇ : (a : ℤ) = 673 ∧ (b : ℤ) = 1358114 ∨ (a : ℤ) = 674 ∧ (b : ℤ) = 340033 ∨ (a : ℤ) = 1009 ∧ (b : ℤ) = 2018 ∨ (a : ℤ) = 2018 ∧ (b : ℤ) = 1009 ∨ (a : ℤ) = 340033 ∧ (b : ℤ) = 674 ∨ (a : ℤ) = 1358114 ∧ (b : ℤ) = 673 := by
        -- Use the fact that a and b are positive integers to narrow down the possibilities.
        have h₈ : (a : ℚ) ≠ 0 := by positivity
        have h₉ : (b : ℚ) ≠ 0 := by positivity
        field_simp at h₆
        ring_nf at h₆
        norm_cast at h₆ ⊢
        -- Use the fact that a and b are positive integers to narrow down the possibilities.
        have h₁₀ : a > 0 := by linarith
        have h₁₁ : b > 0 := by linarith
        have h₁₂ : a * b > 0 := by positivity
        -- Use the fact that a and b are positive integers to narrow down the possibilities.
        have h₁₃ : 2018 * (a + b) = 3 * a * b := by
          nlinarith
        have h₁₄ : 3 * a * b = 2018 * (a + b) := by linarith
        have h₁₅ : a ≤ 1358114 := by
          by_contra h₁₅
          have h₁₆ : a > 1358114 := by linarith
          have h₁₇ : b < a := by
            by_contra h₁₇
            have h₁₈ : b ≥ a := by linarith
            have h₁₉ : 2018 * (a + b) = 3 * a * b := by linarith
            have h₂₀ : 3 * a * b = 2018 * (a + b) := by linarith
            nlinarith
          have h₂₁ : 2018 * (a + b) = 3 * a * b := by linarith
          have h₂₂ : 3 * a * b = 2018 * (a + b) := by linarith
          nlinarith
        have h₁₆ : b ≤ 1358114 := by
          by_contra h₁₆
          have h₁₇ : b > 1358114 := by linarith
          have h₁₈ : a < b := by
            by_contra h₁₈
            have h₁₉ : a ≥ b := by linarith
            have h₂₀ : 2018 * (a + b) = 3 * a * b := by linarith
            have h₂₁ : 3 * a * b = 2018 * (a + b) := by linarith
            nlinarith
          have h₂₂ : 2018 * (a + b) = 3 * a * b := by linarith
          have h₂₃ : 3 * a * b = 2018 * (a + b) := by linarith
          nlinarith
        -- Use the fact that a and b are positive integers to narrow down the possibilities.
        interval_cases a <;> norm_num at h₁₃ ⊢ <;>
          (try omega) <;>
          (try
            {
              norm_num at h₁₃ ⊢
              rcases b with (_ | _ | _ | _ | _ | _ | _ | _ | _ | b) <;>
                norm_num at h₁₃ ⊢ <;>
                (try omega) <;>
                (try
                  {
                    ring_nf at h₁₃ ⊢
                    omega
                  })
            }) <;>
          (try
            {
              rcases b with (_ | _ | _ | _ | _ | _ | _ | _ | _ | b) <;>
                norm_num at h₁₃ ⊢ <;>
                (try omega) <;>
                (try
                  {
                    ring_nf at h₁₃ ⊢
                    omega
                  })
            }) <;>
          (try
            {
              omega
            }) <;>
          (try
            {
              norm_num at h₁₃ ⊢
              <;>
              omega
            }) <;>
          (try
            {
              ring_nf at h₁₃ ⊢
              <;>
              omega
            })
      -- Use the fact that a and b are positive integers to narrow down the possibilities.
      rcases h₇ with (⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩) <;>
        simp (config := {decide := true})
    · -- Prove the reverse direction: if (a, b) is one of the six pairs, then 1/a + 1/b = 3/2018.
      intro h₁
      have h₂ : a > 0 := by linarith
      have h₃ : b > 0 := by linarith
      have h₄ : (a : ℚ) > 0 := by exact_mod_cast h₂
      have h₅ : (b : ℚ) > 0 := by exact_mod_cast h₃
      -- Use the fact that a and b are positive integers to narrow down the possibilities.
      have h₆ : (⟨a, b⟩ : ℤ × ℤ) = ⟨673, 1358114⟩ ∨ (⟨a, b⟩ : ℤ × ℤ) = ⟨674, 340033⟩ ∨ (⟨a, b⟩ : ℤ × ℤ) = ⟨1009, 2018⟩ ∨ (⟨a, b⟩ : ℤ × ℤ) = ⟨2018, 1009⟩ ∨ (⟨a, b⟩ : ℤ × ℤ) = ⟨340033, 674⟩ ∨ (⟨a, b⟩ : ℤ × ℤ) = ⟨1358114, 673⟩ := by
        simpa [Set.mem_insert, Set.mem_singleton_iff] using h₁
      rcases h₆ with (⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩) <;>
        norm_num [div_eq_mul_inv, add_comm]
      <;>
      (try norm_num) <;>
      (try ring_nf) <;>
      (try norm_num) <;>
      (try field_simp) <;>
      (try norm_num) <;>
      (try ring_nf) <;>
      (try norm_num)
  exact h_main