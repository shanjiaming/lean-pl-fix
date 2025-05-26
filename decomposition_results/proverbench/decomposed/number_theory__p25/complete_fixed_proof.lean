theorem divisibility_by_37 (x y : ℕ) (h : 37 ∣ 15 * x + 11 * y) : 37 ∣ 7 * x + 15 * y:=
  by
  have h₁ : 37 ∣ 35 * (15 * x + 11 * y):= by -- exact dvd_mul_of_dvd_right h 35
    omega
  have h₂ : 35 * (15 * x + 11 * y) = 7 * x + 15 * y + 37 * (14 * x + 10 * y):=
    by
    have h₂₀ : 35 * (15 * x + 11 * y) = 35 * (15 * x) + 35 * (11 * y):= by -- ring
      linarith
    have h₂₁ : 7 * x + 15 * y + 37 * (14 * x + 10 * y) = 7 * x + 15 * y + (37 * (14 * x) + 37 * (10 * y)):= by -- ring
      linarith
    --  --  rw [h₂₀, h₂₁] <;> ring_nf at * <;> omega
    linarith
  have h₃ : 37 ∣ 7 * x + 15 * y + 37 * (14 * x + 10 * y):=
    by
    have h₃₁ : 37 ∣ 7 * x + 15 * y + 37 * (14 * x + 10 * y):=
      by
      --  rw [← h₂]
      --  exact h₁
      omega
    --  exact h₃₁
    omega
  have h₄ : 37 ∣ 7 * x + 15 * y:=
    by
    have h₄₁ : 37 ∣ 7 * x + 15 * y + 37 * (14 * x + 10 * y) := h₃
    have h₄₂ : 37 ∣ 7 * x + 15 * y:=
      by
      have h₄₃ : 37 ∣ 7 * x + 15 * y + 37 * (14 * x + 10 * y) := h₄₁
      have h₄₄ : 37 ∣ 37 * (14 * x + 10 * y):= by -- apply dvd_mul_right
        norm_num
      have h₄₅ : 37 ∣ 7 * x + 15 * y:=
        by
        have h₄₅₁ : 37 ∣ (7 * x + 15 * y + 37 * (14 * x + 10 * y)) - 37 * (14 * x + 10 * y) := Nat.dvd_sub' h₄₃ h₄₄
        have h₄₅₂ : (7 * x + 15 * y + 37 * (14 * x + 10 * y)) - 37 * (14 * x + 10 * y) = 7 * x + 15 * y:=
          by
          have h₄₅₃ : 7 * x + 15 * y + 37 * (14 * x + 10 * y) ≥ 37 * (14 * x + 10 * y):= by -- omega
            norm_num
          have h₄₅₄ : (7 * x + 15 * y + 37 * (14 * x + 10 * y)) - 37 * (14 * x + 10 * y) = 7 * x + 15 * y:= by -- omega
            norm_num
          --  exact h₄₅₄
          norm_num
        --  rw [h₄₅₂] at h₄₅₁
        --  exact h₄₅₁
        omega
      --  exact h₄₅
      omega
    --  exact h₄₂
    omega
  --  exact h₄
  omega