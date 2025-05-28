theorem h₃₃ (n k : ℕ) (hnk : n > 0 ∧ k > 0) (h₁ : n > 0) (h₂ : k > 0) (h₃ : 2 * k + 1 > 0) (h : n ≤ k + 1) (h₄ h₅ : n ≤ k + 1) (h₆ : ∀ (s : Equiv.Perm (Fin n)), klimited k n s) (h₃₁ : {s | klimited k n s} = univ) (h₃₂ : {s | klimited k n s}.ncard = univ.ncard) : {s | klimited k n s}.ncard = n ! :=
  by
  rw [h₃₂]
  have h₃₄ : Set.ncard (Set.univ : Set (Equiv.Perm (Fin n))) = Nat.factorial n := by sorry
  rw [h₃₄] <;> simp_all [Nat.factorial] <;> norm_num <;> aesop