theorem h₆₁ (n k : ℕ) (hnk : n > 0 ∧ k > 0) (h₁ : n > 0) (h₂ : k > 0) (h₃ : 2 * k + 1 > 0) (h : k + 1 < n) (h₄ h₅₁ : n > k + 1) (h₅₂ : ∀ (s : Equiv.Perm (Fin n)), klimited k n s → s = 1) (h₅₈ : {s | klimited k n s} = {1}) (h₅₉ : {s | klimited k n s}.ncard = 1) (h₆₀ : Odd {s | klimited k n s}.ncard) : n ≡ 0 [MOD 2 * k + 1] ∨ n ≡ 1 [MOD 2 * k + 1] :=
  by
  --  exfalso
  have h₆₂ := h₅₂ (Equiv.swap (⟨0, by omega⟩ : Fin n) ⟨1, by omega⟩)
  have h₆₃ : klimited k n (Equiv.swap (⟨0, by omega⟩ : Fin n) ⟨1, by omega⟩) → False := by sorry
  --  exact h₆₃ (by simpa using h₆₂)
  hole