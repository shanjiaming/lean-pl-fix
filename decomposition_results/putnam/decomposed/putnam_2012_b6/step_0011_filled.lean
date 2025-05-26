theorem h₅₁ (p : ℕ) (hpodd : Odd p) (hpprime : Nat.Prime p) (hpmod3 : p ≡ 2 [MOD 3]) (P : Equiv.Perm (Fin p)) (hP : ∀ (i : Fin p), (P : Fin p → Fin p) i = i * i * i) (h_forward : p ≡ 3 [MOD 4] → P.signAux = 1) (h h₁ : P.signAux = 1) : p % 2 = 1 := by
  --  cases' hpodd with k hk
  --  omega
  hole