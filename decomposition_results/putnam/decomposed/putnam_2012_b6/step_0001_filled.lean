theorem putnam_2012_b6 (p : ℕ) (hpodd : Odd p) (hpprime : Nat.Prime p) (hpmod3 : p ≡ 2 [MOD 3]) (P : Equiv.Perm (Fin p)) (hP : ∀ (i : Fin p), (P : Fin p → Fin p) i = i * i * i) : P.signAux = 1 ↔ p ≡ 3 [MOD 4] :=
  by
  have h_forward : p ≡ 3 [MOD 4] → Equiv.Perm.signAux P = 1 := by sorry
  have h_backward : Equiv.Perm.signAux P = 1 → p ≡ 3 [MOD 4] := by sorry
  --  exact ⟨h_backward, h_forward⟩
  hole