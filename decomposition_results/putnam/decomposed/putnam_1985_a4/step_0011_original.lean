theorem h₈ (a : ℕ → ℕ) (ha1 : a 1 = 3) (ha : ∀ i ≥ 1, a (i + 1) = 3 ^ a i) (h_a2 : a 2 = 27) (h_a3 : a 3 % 100 = 87) (i✝ i : ℕ) (hi : Nat.le 3 i) (IH : a i % 100 = 87) (h₁ : a (i + 1) = 3 ^ a i) (h₂ h₅ : a i % 100 = 87) : ∀ (n : ℕ), 3 ^ n % 100 = 3 ^ (n % 20) % 100 := by
  intro n
  rw [← Nat.mod_add_div n 20]
  simp [pow_add, pow_mul, Nat.pow_mod, Nat.mul_mod, Nat.pow_mod] <;>
          simp_all [Nat.pow_mod, Nat.mul_mod, Nat.pow_mod] <;>
        norm_num <;>
      ring_nf at * <;>
    omega