theorem induction_12dvd4expnp1p20 (n : ℕ) : 12 ∣ 4 ^ (n + 1) + 20:=
  by
  have h₁ : (4 ^ (n + 1)) % 12 = 4:=
    by
    have h₂ : ∀ n : ℕ, (4 ^ (n + 1)) % 12 = 4:= by
      --  intro n
      --  induction n with
      --  | zero => norm_num
      --  | succ n ih => simp [pow_succ, Nat.mul_mod, ih, Nat.pow_mod] <;> norm_num <;> omega
      hole
    --  apply h₂
    hole
  have h₂ : (4 ^ (n + 1) + 20) % 12 = 0:=
    by
    have h₃ : (4 ^ (n + 1) + 20) % 12 = 0:= by -- omega
      omega
    --  exact h₃
    linarith
  have h₃ : 12 ∣ 4 ^ (n + 1) + 20:= by
    have h₄ : (4 ^ (n + 1) + 20) % 12 = 0 := h₂
    have h₅ : 12 ∣ 4 ^ (n + 1) + 20:= by -- omega
      omega
    --  exact h₅
    omega
  --  exact h₃
  omega