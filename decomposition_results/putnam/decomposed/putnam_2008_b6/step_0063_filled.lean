theorem h₅₈ (n k : ℕ) (hnk : n > 0 ∧ k > 0) (h₁ : n > 0) (h₂ : k > 0) (h₃ : 2 * k + 1 > 0) (h : k + 1 < n) (h₄ h₅₁ : n > k + 1) (h₅₂ : ∀ (s : Equiv.Perm (Fin n)), sorry → s = 1) : {s | sorry} = {1} :=
  by
  --  apply Set.Subset.antisymm
  --  · intro s hs
    have h₅₉ : s = 1 := h₅₂ s hs
  --    rw [h₅₉]
  --    simp
  --  · intro s hs
    have h₅₉ : s = 1 := by sorry
  --    rw [h₅₉]
  --    intro i
    simp [klimited] <;> norm_num <;> (try omega) <;> simp_all [abs_le] <;> omega
  hole