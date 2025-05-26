theorem h_backward (p : ℕ) (hpodd : Odd p) (hpprime : Nat.Prime p) (hpmod3 : p ≡ 2 [MOD 3]) (P : Equiv.Perm (Fin p)) (hP : ∀ (i : Fin p), (P : Fin p → Fin p) i = i * i * i) (h_forward : p ≡ 3 [MOD 4] → P.signAux = 1) : P.signAux = 1 → p ≡ 3 [MOD 4] :=
  by
  intro h
  have h₁ : Equiv.Perm.signAux P = 1 := h
  have h₂ : p % 4 = 3 := by sorry
  have h₃ : p ≡ 3 [MOD 4] := by sorry
  exact h₃