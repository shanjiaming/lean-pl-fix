theorem h₁₀ (S T : Set ℤ) (hS : S = {k | ∃ j, 0 ≤ j ∧ j ≤ 33 ∧ k = 3 * j + 1}) (hT : T ⊆ S ∧ T.ncard = 20) (h : ∀ m ∈ T, ∀ n ∈ T, m ≠ n → m + n ≠ 104) (h₁ : T ⊆ S) (h₂ : T.ncard = 20) (h₃ : ∀ m ∈ T, ∀ n ∈ T, m ≠ n → m + n ≠ 104) (j : ℤ) (hj₀ : 0 ≤ j) (hj₁ : j ≤ 33) (hm : 3 * j + 1 ∈ T) (h₆ : 0 ≤ j) (h₇ : j ≤ 33) (h₈ : j ≥ 0) (h₉ : j ≤ 33) : j = 0 ∨ j = 17 ∨ 1 ≤ j ∧ j ≤ 16 ∨ 18 ≤ j ∧ j ≤ 33 :=
  by
  by_cases h₁₀ : j = 0
  · exact Or.inl h₁₀
  · by_cases h₁₁ : j = 17
    · exact Or.inr (Or.inl h₁₁)
    · by_cases h₁₂ : j ≤ 16
      ·
        have h₁₃ : 1 ≤ j := by sorry
        exact Or.inr (Or.inr (Or.inl ⟨h₁₃, h₁₂⟩))
      ·
        have h₁₃ : 18 ≤ j := by sorry
        have h₁₄ : j ≤ 33 := by sorry
        exact Or.inr (Or.inr (Or.inr ⟨h₁₃, h₁₄⟩))