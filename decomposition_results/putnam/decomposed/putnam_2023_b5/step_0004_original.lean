theorem h₂ (n : ℕ) (h : n ∈ {n | n = 1 ∨ n ≡ 2 [MOD 4]}) (h₁ : n = 1 ∨ n ≡ 2 [MOD 4]) : 0 < n := by
  cases h₁ with
  | inl h₁ => norm_num [h₁]
  | inr h₁ =>
    have h₂ : n % 4 = 2 := by simpa [Nat.ModEq, Nat.ModEq] using h₁
    have h₃ : 0 < n := by
      by_contra h₄
      have h₅ : n = 0 := by omega
      rw [h₅] at h₂
      norm_num at h₂
    exact h₃