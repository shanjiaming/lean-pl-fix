theorem h₄₁ (n k : ℕ) (hnk : n > 0 ∧ k > 0) (h₁ : n > 0) (h₂ : k > 0) (h₃ : 2 * k + 1 > 0) (h : n ≤ k + 1) (h₄ h₅ : n ≤ k + 1) (h₆ : ∀ (s : Equiv.Perm (Fin n)), klimited k n s) (h₃₁ : {s | klimited k n s} = univ) (h₃₂ : {s | klimited k n s}.ncard = univ.ncard) (h₃₃ : {s | klimited k n s}.ncard = n !) (h₃₅ : n ≤ k + 1) (h₃₆ : n > 0) (h₃₇ : k > 0) (h₃₈ : n ≤ k + 1) (h₃₉ : n > 0) (h₄₀ : k > 0) : n ≡ 0 [MOD 2 * k + 1] ∨ n ≡ 1 [MOD 2 * k + 1] → n = 1 :=
  by
  --  intro h₄₂
  have h₄₃ : n ≡ 0 [MOD 2 * k + 1] ∨ n ≡ 1 [MOD 2 * k + 1] := h₄₂
  have h₄₄ : n ≤ k + 1 := h₃₅
  have h₄₅ : k > 0 := h₂
  have h₄₆ : 2 * k + 1 > k + 1 := by sorry
  have h₄₇ : n < 2 * k + 1 := by sorry
  --  cases' h₄₃ with h₄₈ h₄₈
  ·
    have h₄₉ : n ≡ 0 [MOD 2 * k + 1] := h₄₈
    have h₅₀ : n % (2 * k + 1) = 0 := by sorry
    have h₅₁ : n < 2 * k + 1 := by sorry
    have h₅₂ : n = 0 := by sorry
    have h₅₆ : n > 0 := h₁
  --    omega
  ·
    have h₄₉ : n ≡ 1 [MOD 2 * k + 1] := h₄₈
    have h₅₀ : n % (2 * k + 1) = 1 := by sorry
    have h₅₁ : n < 2 * k + 1 := by sorry
    have h₅₂ : n = 1 := by sorry
  --    exact h₅₂
  hole