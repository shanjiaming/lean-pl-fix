lemma neg_elements_bound (b : Int) (hb : b ∈ B) (hneg : b < 0) : b ≤ -4 := by
  have h_main : ∃ (k : Int), b = -44 + 5 * k := by
    have h₁ : b ∈ B := hb
    have h₂ : b ∈ B ↔ ∃ k : Int, b = -44 + 5 * k := by
      apply characterize_B
    have h₃ : ∃ k : Int, b = -44 + 5 * k := by
      rw [h₂] at h₁
      exact h₁
    exact h₃
  
  have h_k_le_8 : ∀ (k : Int), b = -44 + 5 * k → k ≤ 8 := by
    intro k hk
    have h₁ : b = -44 + 5 * k := hk
    have h₂ : b < 0 := hneg
    have h₃ : -44 + 5 * k < 0 := by linarith
    have h₄ : 5 * k < 44 := by linarith
    have h₅ : k ≤ 8 := by
      by_contra h
      -- If k > 8, then k ≥ 9 since k is an integer.
      have h₆ : k ≥ 9 := by
        by_contra h₆
        -- If k is not ≥ 9, then k ≤ 8.
        have h₇ : k ≤ 8 := by linarith
        omega
      -- If k ≥ 9, then 5 * k ≥ 45, which implies -44 + 5 * k ≥ 1, contradicting b < 0.
      have h₇ : 5 * k ≥ 45 := by nlinarith
      have h₈ : -44 + 5 * k ≥ 1 := by nlinarith
      linarith
    exact h₅
  
  have h_final : b ≤ -4 := by
    have h₁ : ∃ (k : Int), b = -44 + 5 * k := h_main
    obtain ⟨k, hk⟩ := h₁
    have h₂ : k ≤ 8 := h_k_le_8 k hk
    have h₃ : b = -44 + 5 * k := hk
    have h₄ : b ≤ -4 := by
      have h₅ : k ≤ 8 := h₂
      have h₆ : 5 * k ≤ 40 := by linarith
      have h₇ : -44 + 5 * k ≤ -4 := by linarith
      linarith
    exact h₄
  
  exact h_final