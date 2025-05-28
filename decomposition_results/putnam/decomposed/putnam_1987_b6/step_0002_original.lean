theorem h_char_ne_two (p : ℕ) (F : Type u_1) (inst✝¹ : Field F) (inst✝ : Fintype F) (S : Set F) (hp : Odd p ∧ Nat.Prime p) (Fcard : Fintype.card F = p ^ 2) (Snz : ∀ x ∈ S, x ≠ 0) (Scard : ↑S.ncard = (↑p ^ 2 - 1) / 2) (hS : ∀ (a : F), a ≠ 0 → Xor' (a ∈ S) (-a ∈ S)) : ringChar F ≠ 2 :=
  by
  have h1 : (p : ℕ) ≠ 0 := by sorry
  have h2 : ringChar F = p := by sorry
  have h3 : ringChar F ≠ 2 := by
    have h4 : ringChar F = p := h2
    have h5 : p ≠ 2 := by
      have h6 : Odd p := hp.1
      have h7 : p % 2 = 1 := by
        cases' h6 with k hk
        omega
      have h8 : p ≠ 2 := by
        intro h9
        rw [h9] at h7
        norm_num at h7
      exact h8
    rw [h4]
    exact h5
  exact h3