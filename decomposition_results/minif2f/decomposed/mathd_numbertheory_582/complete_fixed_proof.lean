theorem mathd_numbertheory_582 (n : ℕ) (h₀ : 0 < n) (h₁ : 3 ∣ n) : (n + 4 + (n + 6) + (n + 8)) % 9 = 0:=
  by
  have h₂ : (n + 4 + (n + 6) + (n + 8)) = 3 * n + 18:=
    by
    have h₂₁ : n + 4 + (n + 6) + (n + 8) = 3 * n + 18:=
      by
      have h₂₂ : n + 4 + (n + 6) + (n + 8) = (n + 4 + (n + 6)) + (n + 8):= by -- ring
        norm_num
      --  rw [h₂₂]
      have h₂₃ : n + 4 + (n + 6) = 2 * n + 10:= by -- ring
        linarith
      --  rw [h₂₃]
      have h₂₄ : (2 * n + 10) + (n + 8) = 3 * n + 18:= by -- ring
        linarith
      --  rw [h₂₄] <;> ring
      linarith
    --  rw [h₂₁] <;> ring
    linarith
  have h₃ : (n + 4 + (n + 6) + (n + 8)) % 9 = 0:= by
    --  rw [h₂]
    have h₄ : 3 ∣ n := h₁
    have h₅ : n % 9 = 0 ∨ n % 9 = 3 ∨ n % 9 = 6:=
      by
      have h₅₁ : n % 9 = 0 ∨ n % 9 = 3 ∨ n % 9 = 6:= by -- omega
        omega
      --  exact h₅₁
      omega
    --  rcases h₅ with (h₅ | h₅ | h₅)
    --  · simp [h₅, Nat.add_mod, Nat.mul_mod, Nat.mod_mod, Nat.mod_self, Nat.zero_add, Nat.add_assoc] <;> norm_num <;> omega
    --  · simp [h₅, Nat.add_mod, Nat.mul_mod, Nat.mod_mod, Nat.mod_self, Nat.zero_add, Nat.add_assoc] <;> norm_num <;> omega
    --  · simp [h₅, Nat.add_mod, Nat.mul_mod, Nat.mod_mod, Nat.mod_self, Nat.zero_add, Nat.add_assoc] <;> norm_num <;> omega
    omega
  --  exact h₃
  linarith