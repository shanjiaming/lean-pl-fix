theorem h_forward (p : ℕ) (hpodd : Odd p) (hpprime : Nat.Prime p) (hpmod3 : p ≡ 2 [MOD 3]) (P : Equiv.Perm (Fin p)) (hP : ∀ (i : Fin p), (P : Fin p → Fin p) i = i * i * i) : p ≡ 3 [MOD 4] → P.signAux = 1 :=
  by
  --  intro h
  have h₁ : p ≡ 3 [MOD 4] := h
  have h₂ : p % 4 = 3 := by sorry
  have h₃ : p % 3 = 2 := by sorry
  have h₄ : p ≠ 0 := by sorry
  have h₅ : p ≠ 0 := h₄
  have h₆ : p ≥ 2 := Nat.Prime.two_le hpprime
  have h₇ : Equiv.Perm.signAux P = 1 := by sorry
  --  exact h₇
  hole