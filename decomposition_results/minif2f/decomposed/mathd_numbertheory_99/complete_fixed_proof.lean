theorem mathd_numbertheory_99 (n : ℕ) (h₀ : 2 * n % 47 = 15) : n % 47 = 31:=
  by
  have h₁ : n % 47 = 31:=
    by
    have h₂ : (2 * (n % 47)) % 47 = 15:= by
      have h₃ : (2 * n) % 47 = 15 := h₀
      have h₄ : (2 * n) % 47 = (2 * (n % 47)) % 47:= by -- simp [Nat.mul_mod, Nat.add_mod, Nat.mod_mod]
        norm_num
      --  rw [h₄] at h₃
      --  exact h₃
      linarith
    have h₅ : n % 47 < 47 := Nat.mod_lt n (by norm_num)
    --  --  interval_cases n % 47 <;> norm_num at h₂ ⊢ <;> omega
    omega
  --  exact h₁
  linarith