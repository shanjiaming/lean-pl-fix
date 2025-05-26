theorem h₃ (p : ℕ) (hpodd : Odd p) (hpprime : Nat.Prime p) (hpmod3 : p ≡ 2 [MOD 3]) (P : Equiv.Perm (Fin p)) (hP : ∀ (i : Fin p), (P : Fin p → Fin p) i = i * i * i) (h h₁ : p ≡ 3 [MOD 4]) (h₂ : p % 4 = 3) : p % 3 = 2 := by
  rw [Nat.ModEq] at hpmod3
  omega