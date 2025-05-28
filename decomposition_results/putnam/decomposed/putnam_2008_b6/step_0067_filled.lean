theorem h₅ (n k : ℕ) (hnk : n > 0 ∧ k > 0) (h₁ : n > 0) (h₂ : k > 0) (h₃ : 2 * k + 1 > 0) (h : k + 1 < n) (h₄ : n > k + 1) : Odd {s | klimited k n s}.ncard ↔ n ≡ 0 [MOD 2 * k + 1] ∨ n ≡ 1 [MOD 2 * k + 1] :=
  by
  have h₅₁ : n > k + 1 := h₄
  have h₅₂ : ∀ (s : Equiv.Perm (Fin n)), klimited k n s → s = 1 := by sorry
  have h₅₈ : {s : Equiv.Perm (Fin n) | klimited k n s} = { 1 } := by sorry
  have h₅₉ : Set.ncard {s : Equiv.Perm (Fin n) | klimited k n s} = 1 := by sorry
  have h₆₀ : Odd (Set.ncard {s : Equiv.Perm (Fin n) | klimited k n s}) := by sorry
  have h₆₁ : n ≡ 0 [MOD 2 * k + 1] ∨ n ≡ 1 [MOD 2 * k + 1] := by sorry
  --  simp_all
  hole