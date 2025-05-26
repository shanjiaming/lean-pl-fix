theorem h₅ (a : ℕ → ℕ) (ha1 : a 1 = 3) (ha : ∀ i ≥ 1, a (i + 1) = 3 ^ a i) (h_a2 : a 2 = 27) (h_a3 : a 3 % 100 = 87) (h_a_ge_3 : ∀ i ≥ 3, a i % 100 = 87) (k : Fin 100) (hk : k ∈ {k | ∀ (N : ℕ), ∃ i ≥ N, a i % 100 = (↑k : ℕ)}) (h₁ : ∀ (N : ℕ), ∃ i ≥ N, a i % 100 = (↑k : ℕ)) (h₃ : k ≠ 87) (h₄ : ∀ i ≥ 3, a i % 100 = 87) : ∃ i ≥ 3, a i % 100 = (↑k : ℕ) := by
  have h₆ := h₁ 3
  obtain ⟨i, hi, h₇⟩ := h₆
  refine' ⟨max i 3, _⟩
  constructor
  · exact le_max_right i 3
  ·
    have h₈ : a (max i 3) % 100 = 87 :=
      h_a_ge_3 (max i 3) (by cases' le_total i 3 with h₉ h₉ <;> simp_all [max_eq_right, max_eq_left] <;> omega)
    have h₉ : a i % 100 = k := h₇
    have h₁₀ : i ≥ 3 ∨ i < 3 := by sorry
    cases' h₁₀ with h₁₀ h₁₀
    ·
      have h₁₁ : a i % 100 = 87 := h_a_ge_3 i h₁₀
      have h₁₂ : k = 87 := by sorry
      simp_all
    ·
      have h₁₁ : i < 3 := h₁₀
      have h₁₂ : i = 0 ∨ i = 1 ∨ i = 2 := by sorry
      rcases h₁₂ with (rfl | rfl | rfl)
      ·
        have h₁₃ := h₁ 0
        obtain ⟨i, hi, h₁₄⟩ := h₁₃
        have h₁₅ : a i % 100 = k := h₁₄
        have h₁₆ : i ≥ 0 := hi
        have h₁₇ : i ≥ 3 ∨ i < 3 := by sorry
        cases' h₁₇ with h₁₇ h₁₇
        ·
          have h₁₈ : a i % 100 = 87 := h_a_ge_3 i h₁₇
          have h₁₉ : k = 87 := by sorry
          simp_all
        ·
          have h₁₈ : i = 0 ∨ i = 1 ∨ i = 2 := by sorry
          rcases h₁₈ with (rfl | rfl | rfl)
          · simp_all [ha1, h_a2, h_a3, ha] <;> omega
          · simp_all [ha1, h_a2, h_a3, ha] <;> omega
          · simp_all [ha1, h_a2, h_a3, ha] <;> omega
      ·
        have h₁₃ := h₁ 1
        obtain ⟨i, hi, h₁₄⟩ := h₁₃
        have h₁₅ : a i % 100 = k := h₁₄
        have h₁₆ : i ≥ 1 := hi
        have h₁₇ : i ≥ 3 ∨ i < 3 := by sorry
        cases' h₁₇ with h₁₇ h₁₇
        ·
          have h₁₈ : a i % 100 = 87 := h_a_ge_3 i h₁₇
          have h₁₉ : k = 87 := by sorry
          simp_all
        ·
          have h₁₈ : i = 1 ∨ i = 2 := by sorry
          rcases h₁₈ with (rfl | rfl)
          · simp_all [ha1, h_a2, h_a3, ha] <;> omega
          · simp_all [ha1, h_a2, h_a3, ha] <;> omega
      ·
        have h₁₃ := h₁ 2
        obtain ⟨i, hi, h₁₄⟩ := h₁₃
        have h₁₅ : a i % 100 = k := h₁₄
        have h₁₆ : i ≥ 2 := hi
        have h₁₇ : i ≥ 3 ∨ i < 3 := by sorry
        cases' h₁₇ with h₁₇ h₁₇
        ·
          have h₁₈ : a i % 100 = 87 := h_a_ge_3 i h₁₇
          have h₁₉ : k = 87 := by sorry
          simp_all
        ·
          have h₁₈ : i = 2 := by sorry
          rw [h₁₈] at h₁₅
          simp_all [ha1, h_a2, h_a3, ha] <;> omega <;> simp_all [h_a_ge_3] <;> omega