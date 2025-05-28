theorem h₅ (S : Finset ℕ) (h₀ : ∀ (n : ℕ), n ∈ S ↔ 0 < n ∧ (↑n + 1000) / 70 = ↑⌊√↑n⌋) (n : ℕ) (h : 0 < n ∧ (↑n + 1000) / 70 = ↑⌊√↑n⌋) (h₁ : 0 < n) (h₂ : (↑n + 1000) / 70 = ↑⌊√↑n⌋) (h₃ : (n + 1000) % 70 = 0) (h₄ : n % 70 = 50) : ∃ k, n = 70 * k + 50 := by
  --  use n / 70
  have h₆ := Nat.mod_add_div n 70
  --  omega
  hole