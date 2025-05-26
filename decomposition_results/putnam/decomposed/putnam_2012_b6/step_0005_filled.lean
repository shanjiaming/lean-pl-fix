theorem h₄ (p : ℕ) (hpodd : Odd p) (hpprime : Nat.Prime p) (hpmod3 : p ≡ 2 [MOD 3]) (P : Equiv.Perm (Fin p)) (hP : ∀ (i : Fin p), (P : Fin p → Fin p) i = i * i * i) (h h₁ : p ≡ 3 [MOD 4]) (h₂ : p % 4 = 3) (h₃ : p % 3 = 2) : p ≠ 0 := by
  --  intro h₄
  --  rw [h₄] at hpprime
  --  norm_num at hpprime <;> contradiction
  omega