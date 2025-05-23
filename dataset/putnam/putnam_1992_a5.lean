theorem putnam_1992_a5
  (a : ℕ → ℕ)
  (ha : a = fun n ↦ ite (Even {i | (digits 2 n).get i = 1}.ncard) 0 1) :
  ¬∃ k > 0, ∃ m > 0, ∀ j ≤ m - 1,
    a (k + j) = a (k + m + j) ∧ a (k + m + j) = a (k + 2 * m + j) := by
  intro h
  obtain ⟨k, hk₀, m, hm₀, hk⟩ := h
  have h₁ := hk 0
  have h₂ := hk 1
  have h₃ := hk (m - 1)
  have h₄ : a 1 = 1 := by
    rw [ha]
    simp [Nat.even_iff, Nat.mod_eq_of_lt]
    <;>
    norm_num
    <;>
    rfl
    <;>
    simp_all [Set.ncard_eq_zero]
    <;>
    decide
  
  have h₅ : a 2 = 1 := by
    rw [ha]
    simp [Nat.even_iff, Nat.mod_eq_of_lt]
    <;>
    norm_num
    <;>
    rfl
    <;>
    simp_all [Set.ncard_eq_zero]
    <;>
    decide
  
  have h₆ : a 3 = 0 := by
    rw [ha]
    simp [Nat.even_iff, Nat.mod_eq_of_lt]
    <;>
    norm_num
    <;>
    rfl
    <;>
    simp_all [Set.ncard_eq_zero]
    <;>
    decide
  
  have h₇ : ¬(a 1 = a 2 ∧ a 2 = a 3) := by
    intro h₈
    have h₈₁ : a 1 = a 2 := h₈.1
    have h₈₂ : a 2 = a 3 := h₈.2
    have h₉ : a 1 = 1 := h₄
    have h₁₀ : a 2 = 1 := h₅
    have h₁₁ : a 3 = 0 := h₆
    subst_vars
    <;> simp_all
    <;> contradiction
  
  have h₈ : m > 0 := by linarith
  have h₉ : k > 0 := by linarith
  by_cases hm₁ : m = 1
  · -- Case m = 1
    have h₁₀ := hk 0
    have h₁₁ := hk 1
    have h₁₂ : k > 0 := by linarith
    have h₁₃ : m = 1 := hm₁
    have h₁₄ : ∀ j ≤ m - 1, a (k + j) = a (k + m + j) ∧ a (k + m + j) = a (k + 2 * m + j) := hk
    have h₁₅ : a 1 = 1 := h₄
    have h₁₆ : a 2 = 1 := h₅
    have h₁₇ : a 3 = 0 := h₆
    have h₁₈ : ¬(a 1 = a 2 ∧ a 2 = a 3) := h₇
    simp [h₁₃] at h₁₀ h₁₁ h₁₄ ⊢
    <;>
    (try omega) <;>
    (try
      {
        have h₁₉ := h₁₄ 0
        have h₂₀ := h₁₄ 1
        simp at h₁₉ h₂₀ ⊢
        <;>
        (try omega) <;>
        (try
          {
            have h₂₁ := h₁₄ 2
            simp at h₂₁ ⊢
            <;>
            (try omega) <;>
            (try
              {
                simp_all [h₁₅, h₁₆, h₁₇, h₁₈]
                <;>
                (try omega) <;>
                (try
                  {
                    have h₂₂ := h₁₄ 3
                    simp at h₂₂ ⊢
                    <;>
                    (try omega) <;>
                    (try
                      {
                        simp_all [h₁₅, h₁₆, h₁₇, h₁₈]
                        <;>
                        (try omega) <;>
                        (try
                          {
                            aesop
                          })
                      })
                  })
              })
          })
        <;>
        (try
          {
            aesop
          })
      }) <;>
    (try
      {
        have h₂₃ := h₁₄ 0
        have h₂₄ := h₁₄ 1
        simp at h₂₃ h₂₄ ⊢
        <;>
        (try omega) <;>
        (try
          {
            have h₂₅ := h₁₄ 2
            simp at h₂₅ ⊢
            <;>
            (try omega) <;>
            (try
              {
                simp_all [h₁₅, h₁₆, h₁₇, h₁₈]
                <;>
                (try omega) <;>
                (try
                  {
                    have h₂₆ := h₁₄ 3
                    simp at h₂₆ ⊢
                    <;>
                    (try omega) <;>
                    (try
                      {
                        simp_all [h₁₅, h₁₆, h₁₇, h₁₈]
                        <;>
                        (try omega) <;>
                        (try
                          {
                            aesop
                          })
                      })
                  })
              })
          })
        <;>
        (try
          {
            aesop
          })
      })
  
  · -- Case m > 1
    have h₁₀ : m ≥ 2 := by
      have h₁₀₁ : m ≠ 1 := hm₁
      have h₁₀₂ : m > 0 := h₈
      omega
    have h₁₁ : m - 1 ≥ 1 := by omega
    have h₁₂ := hk 1
    have h₁₃ : 1 ≤ m - 1 := by omega
    have h₁₄ := hk (m - 1)
    have h₁₅ : m - 1 ≤ m - 1 := by omega
    have h₁₆ := hk 0
    have h₁₇ : 0 ≤ m - 1 := by omega
    have h₁₈ : a 1 = 1 := h₄
    have h₁₉ : a 2 = 1 := h₅
    have h₂₀ : a 3 = 0 := h₆
    have h₂₁ : ¬(a 1 = a 2 ∧ a 2 = a 3) := h₇
    simp_all [add_assoc]
    <;>
    (try omega) <;>
    (try
      {
        have h₂₂ := hk 2
        have h₂₃ := hk 3
        simp_all [add_assoc]
        <;>
        (try omega)
      })
    <;>
    (try
      {
        have h₂₄ := hk 4
        have h₂₅ := hk 5
        simp_all [add_assoc]
        <;>
        (try omega)
      })
    <;>
    (try
      {
        have h₂₆ := hk 6
        have h₂₇ := hk 7
        simp_all [add_assoc]
        <;>
        (try omega)
      })
    <;>
    (try
      {
        have h₂₈ := hk 8
        have h₂₉ := hk 9
        simp_all [add_assoc]
        <;>
        (try omega)
      })
    <;>
    (try
      {
        have h₃₀ := hk 10
        have h₃₁ := hk 11
        simp_all [add_assoc]
        <;>
        (try omega)
      })
    <;>
    (try
      {
        simp_all [add_assoc]
        <;>
        (try omega)
      })
    <;>
    (try
      {
        aesop
      })