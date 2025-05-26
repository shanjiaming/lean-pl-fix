theorem h₁ (n p : ℕ) (nppos : n > 0 ∧ p > 0) (pprime : Nat.Prime p) (cong : Polynomial ℤ → Polynomial ℤ → ℤ → Prop) (hcong : ∀ (f g : Polynomial ℤ) (m : ℤ), cong f g m ↔ ∀ (i : ℕ), m ∣ (f - g).coeff i) (f g h r s : Polynomial ℤ) (hcoprime : cong (r * f + s * g) 1 (↑p : ℤ)) (hprod : cong (f * g) h (↑p : ℤ)) : n = 1 ∨ n > 1 := by
  have h₂ : n > 0 := nppos.1
  --  cases n with
  --  | zero =>
  --    exfalso
  --    linarith
  --  | succ n =>
  --    cases n with
  --    | zero => exact Or.inl rfl
  --    | succ n => apply Or.inr <;> simp_all [Nat.succ_eq_add_one, Nat.add_assoc] <;> omega
  omega