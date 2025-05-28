theorem h₁₇ (IsQualifying : Set ℤ → Prop) (IsQualifying_def :  ∀ (S : Set ℤ), IsQualifying S ↔ (∀ n ∈ S, 0 < n) ∧ 2 ∈ S ∧ (∀ n > 0, n ^ 2 ∈ S → n ∈ S) ∧ ∀ n ∈ S, (n + 5) ^ 2 ∈ S) (S : Set ℤ) (hS : IsLeast IsQualifying S) (h₁ : 1 ∉ S) (h₂ : ∀ x > 0, 5 ∣ x → x ∉ S) (x : ℤ) (hx : x ∉ S ∧ 0 < x) (h₄ : x ∉ S) (h₅ : 0 < x) (h₆ : x > 0) (h₈ : ¬x = 1) (h₉ : x ≠ 1) (h₁₀ : ¬5 ∣ x) (h₁₃ : x ∉ S) (h₁₄ : x > 0) (h₁₅ : x ≠ 1) (h₁₆ : ¬5 ∣ x) : x ∈ S := by
  have h₁₈ : IsQualifying S := hS.1
  have h₁₉ : ∀ n ∈ S, 0 < n := (IsQualifying_def S).1 h₁₈ |>.1
  have h₂₀ : 2 ∈ S := (IsQualifying_def S).1 h₁₈ |>.2.1
  have h₂₁ : ∀ n > 0, n ^ 2 ∈ S → n ∈ S := (IsQualifying_def S).1 h₁₈ |>.2.2.1
  have h₂₂ : ∀ n ∈ S, (n + 5) ^ 2 ∈ S := (IsQualifying_def S).1 h₁₈ |>.2.2.2
  by_contra h₂₃
  have h₂₄ : x ∉ S := h₂₃
  have h₂₅ : IsQualifying (S ∪ { x }) := by sorry
  have h₃₆ : S ⊆ S ∪ { x } := by
    intro y hy
    exact Or.inl hy
  have h₃₇ : IsQualifying (S ∪ { x }) := h₂₅
  have h₃₈ : S ∪ { x } ⊆ S := by
    apply hS.2
    exact h₃₇
  have h₃₉ : x ∈ S := by
    have h₄₀ : x ∈ S ∪ { x } := by exact Or.inr rfl
    have h₄₁ : x ∈ S := h₃₈ h₄₀
    exact h₄₁
  exact h₃₉