theorem h₁ (IsQualifying : Set ℤ → Prop) (IsQualifying_def :  ∀ (S : Set ℤ), IsQualifying S ↔ (∀ n ∈ S, 0 < n) ∧ 2 ∈ S ∧ (∀ n > 0, n ^ 2 ∈ S → n ∈ S) ∧ ∀ n ∈ S, (n + 5) ^ 2 ∈ S) (S : Set ℤ) (hS : IsLeast IsQualifying S) : 1 ∉ S := by
  by_contra h
  have h₂ : IsQualifying S := hS.1
  have h₃ : ∀ n > 0, n ^ 2 ∈ S → n ∈ S := (IsQualifying_def S).1 h₂ |>.2.2.1
  have h₄ : ∀ n ∈ S, (n + 5) ^ 2 ∈ S := (IsQualifying_def S).1 h₂ |>.2.2.2
  have h₅ : (1 + 5 : ℤ) ^ 2 ∈ S := h₄ 1 h
  have h₆ : (6 : ℤ) ^ 2 ∈ S := by sorry
  have h₇ : (6 : ℤ) ∈ S := h₃ 6 (by norm_num) h₆
  have h₈ : (6 + 5 : ℤ) ^ 2 ∈ S := h₄ 6 h₇
  have h₉ : (11 : ℤ) ^ 2 ∈ S := by sorry
  have h₁₀ : (11 : ℤ) ∈ S := h₃ 11 (by norm_num) h₉
  have h₁₁ : (11 + 5 : ℤ) ^ 2 ∈ S := h₄ 11 h₁₀
  have h₁₂ : (16 : ℤ) ^ 2 ∈ S := by sorry
  have h₁₃ : (16 : ℤ) ∈ S := h₃ 16 (by norm_num) h₁₂
  have h₁₄ : (16 + 5 : ℤ) ^ 2 ∈ S := h₄ 16 h₁₃
  have h₁₅ : (21 : ℤ) ^ 2 ∈ S := by sorry
  have h₁₆ : (21 : ℤ) ∈ S := h₃ 21 (by norm_num) h₁₅
  have h₁₇ : 5 ∣ (21 : ℤ) := by sorry
  have h₁₈ : ∀ n ∈ S, 0 < n := (IsQualifying_def S).1 h₂ |>.1
  have h₁₉ : 0 < (21 : ℤ) := h₁₈ 21 h₁₆
  have h₂₀ : 5 ∣ (21 : ℤ) → False := by sorry
  exact h₂₀ h₁₇