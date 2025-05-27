theorem induction_pprime_pdvdapowpma (p a : ℕ) (h₀ : 0 < a) (h₁ : Nat.Prime p) : p ∣ a ^ p - a :=
  by
  have h₂ : a ≤ a ^ p := by sorry
  have h₃ : (a : ZMod p) ^ p = a := by sorry
  have h₄ : p ∣ a ^ p - a := by sorry
  exact h₄