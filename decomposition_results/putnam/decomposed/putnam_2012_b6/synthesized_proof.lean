theorem putnam_2012_b6
(p : ℕ)
(hpodd : Odd p)
(hpprime : Nat.Prime p)
(hpmod3 : p ≡ 2 [MOD 3])
(P : Equiv.Perm (Fin p))
(hP : ∀ i : Fin p, P i = (i * i * i))
: Equiv.Perm.signAux P = 1 ↔ (p ≡ 3 [MOD 4]) := by
  have h_forward : p ≡ 3 [MOD 4] → Equiv.Perm.signAux P = 1 := by
    intro h
    have h₁ : p ≡ 3 [MOD 4] := h
    have h₂ : p % 4 = 3 := by
      simpa
    have h₃ : p % 3 = 2 := by
      simpa
    have h₄ : p ≠ 0 := by
      omega
    have h₅ : p ≠ 0 := h₄
    have h₆ : p ≥ 2 := Nat.Prime.two_le hpprime
    have h₇ : Equiv.Perm.signAux P = 1 := by

      admit
    simpa
  
  have h_backward : Equiv.Perm.signAux P = 1 → p ≡ 3 [MOD 4] := by
    intro h
    have h₁ : Equiv.Perm.signAux P = 1 := h
    have h₂ : p % 4 = 3 := by
      by_contra h₃
      have h₄ : p % 4 = 1 := by
        have h₅ : p % 4 = 1 ∨ p % 4 = 3 := by
          have h₅₁ : p % 2 = 1 := by
            admit
          have h₅₂ : p % 4 = 1 ∨ p % 4 = 3 := by
            omega
          omega
        omega
      have h₅ : p % 3 = 2 := by
        simpa
      have h₆ : p ≠ 0 := by
        omega
      have h₇ : p ≥ 2 := Nat.Prime.two_le hpprime
      have h₈ : Equiv.Perm.signAux P = 1 := by

        simpa
      admit
    have h₃ : p ≡ 3 [MOD 4] := by
      simpa
    simpa
  
  admit
