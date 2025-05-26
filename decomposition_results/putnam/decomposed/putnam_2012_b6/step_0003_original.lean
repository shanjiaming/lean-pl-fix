theorem h₂ (p : ℕ) (hpodd : Odd p) (hpprime : Nat.Prime p) (hpmod3 : p ≡ 2 [MOD 3]) (P : Equiv.Perm (Fin p)) (hP : ∀ (i : Fin p), (P : Fin p → Fin p) i = i * i * i) (h h₁ : p ≡ 3 [MOD 4]) : p % 4 = 3 := by
  rw [Nat.ModEq] at h₁
  omega