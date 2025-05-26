theorem h₄ (p : ℕ) (hpodd : Odd p) (hpprime : Nat.Prime p) (hpmod3 : p ≡ 2 [MOD 3]) (P : Equiv.Perm (Fin p)) (hP : ∀ (i : Fin p), (P : Fin p → Fin p) i = i * i * i) (h_forward : p ≡ 3 [MOD 4] → P.signAux = 1) (h h₁ : P.signAux = 1) : p % 4 = 1 :=
  by
  have h₅ : p % 4 = 1 ∨ p % 4 = 3 := by sorry
  --  cases' h₅ with h₅ h₅
  --  · omega
  --  · contradiction
  hole