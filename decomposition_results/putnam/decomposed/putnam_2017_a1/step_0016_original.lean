theorem h₂₁ (IsQualifying : Set ℤ → Prop) (IsQualifying_def :  ∀ (S : Set ℤ), IsQualifying S ↔ (∀ n ∈ S, 0 < n) ∧ 2 ∈ S ∧ (∀ n > 0, n ^ 2 ∈ S → n ∈ S) ∧ ∀ n ∈ S, (n + 5) ^ 2 ∈ S) (S : Set ℤ) (hS : IsLeast IsQualifying S) (h₁ : 1 ∉ S) (x : ℤ) (hx_pos : x > 0) (hx_div : 5 ∣ x) (hx_in_S : x ∈ S) (h₂ : IsQualifying S) (h₃ : ∀ n ∈ S, 0 < n) (h₄ : 2 ∈ S) (h₅ : ∀ n > 0, n ^ 2 ∈ S → n ∈ S) (h₆ : ∀ n ∈ S, (n + 5) ^ 2 ∈ S) (h₇ : x ∈ S) (h₈ : 0 < x) (h₉ : 5 ∣ x) (n : ℤ) (hn_in_S : n ∈ S) (hn_pos : 0 < n) (hn_div : 5 ∣ n) (h₁₁ : (n + 5) ^ 2 ∈ S) (h₁₂ : 0 < (n + 5) ^ 2) (h₁₃ : 5 ∣ (n + 5) ^ 2) (h₁₇ : (n + 5) ^ 2 ∈ S) (h₁₈ : 0 < (n + 5) ^ 2) (h₁₉ : 5 ∣ (n + 5) ^ 2) : IsQualifying (S \ {x | 5 ∣ x}) := by
  rw [IsQualifying_def]
  constructor
  · intro n hn
    have h₂₂ : n ∈ S := by sorry
    have h₂₃ : ¬5 ∣ n := by sorry
    have h₂₄ : 0 < n := h₃ n h₂₂
    exact h₂₄
  · constructor
    ·
      have h₂₅ : (2 : ℤ) ∈ S := h₄
      have h₂₆ : ¬5 ∣ (2 : ℤ) := by sorry
      exact ⟨h₂₅, h₂₆⟩
    · constructor
      · intro n hn_pos hn_in_S
        have h₂₇ : n ^ 2 ∈ S := hn_in_S.1
        have h₂₈ : ¬5 ∣ n ^ 2 := hn_in_S.2
        have h₂₉ : n ∈ S := h₅ n hn_pos h₂₇
        have h₃₀ : ¬5 ∣ n := by sorry
        exact ⟨h₂₉, h₃₀⟩
      · intro n hn_in_S
        have h₃₁ : n ∈ S := hn_in_S.1
        have h₃₂ : ¬5 ∣ n := hn_in_S.2
        have h₃₃ : (n + 5 : ℤ) ^ 2 ∈ S := h₆ n h₃₁
        have h₃₄ : ¬5 ∣ (n + 5 : ℤ) ^ 2 := by sorry
        exact ⟨h₃₃, h₃₄⟩