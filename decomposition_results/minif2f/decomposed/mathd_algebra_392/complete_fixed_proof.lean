theorem mathd_algebra_392 (n : ℕ) (h₀ : Even n) (h₁ : (↑n - 2) ^ 2 + ↑n ^ 2 + (↑n + 2) ^ 2 = (12296 : ℤ)) :
  (↑n - 2) * ↑n * (↑n + 2) / 8 = (32736 : ℤ):=
  by
  have h₂ : (n : ℤ) ^ 2 = 4096:=
    by
    have h₂₁ : 3 * (n : ℤ) ^ 2 + 8 = 12296:=
      by
      have h₂₂ : (↑n - 2 : ℤ) ^ 2 + (↑n : ℤ) ^ 2 + (↑n + 2 : ℤ) ^ 2 = 12296:= by -- simpa using h₁
        linarith
      --  --  ring_nf at h₂₂ ⊢ <;> nlinarith
      linarith
    have h₂₂ : (n : ℤ) ^ 2 = 4096:= by
      have h₂₃ : 3 * (n : ℤ) ^ 2 = 12288:= by -- linarith
        linarith
      have h₂₄ : (n : ℤ) ^ 2 = 4096:= by -- linarith
        linarith
      --  exact h₂₄
      linarith
    --  exact h₂₂
    linarith
  have h₃ : n = 64:=
    by
    have h₃₁ : n ≤ 64:= by
      --  by_contra h
      have h₃₂ : n ≥ 65:= by -- omega
        linarith
      have h₃₃ : (n : ℤ) ^ 2 > 4096:= by
        have h₃₄ : (n : ℤ) ≥ 65:= by -- exact_mod_cast h₃₂
          linarith
        --  nlinarith
        nlinarith
      --  linarith
      linarith
    --  --  interval_cases n <;> norm_num at h₂ ⊢ <;> (try omega) <;>
            (try norm_num [Int.ofNat_eq_coe, Nat.even_iff, Nat.odd_iff] at h₀ h₁ h₂ ⊢) <;>
          (try ring_nf at h₁ h₂ ⊢) <;>
        (try linarith) <;>
      (try omega)
    hole
  have h₄ : (↑n - 2) * ↑n * (↑n + 2) / 8 = (32736 : ℤ) :=
    by
    rw [h₃]
    norm_num <;> (try ring_nf at h₁ ⊢) <;> (try norm_num at h₁ ⊢) <;> (try linarith) <;> (try omega)
  have h₄ : (↑n - 2) * ↑n * (↑n + 2) / 8 = (32736 : ℤ):= by
    --  rw [h₃]
    norm_num <;> (try ring_nf at h₁ ⊢) <;> (try norm_num at h₁ ⊢) <;> (try linarith) <;> (try omega)
    hole
have mathd_algebra_392 (n : ℕ) (h₀ : Even n) (h₁ : (↑n - 2) ^ 2 + ↑n ^ 2 + (↑n + 2) ^ 2 = (12296 : ℤ)) :
  (↑n - 2) * ↑n * (↑n + 2) / 8 = (32736 : ℤ) :=
  by
  have h₂ : (n : ℤ) ^ 2 = 4096 := by sorry
  have h₃ : n = 64 := by sorry
  have h₄ : (↑n - 2) * ↑n * (↑n + 2) / 8 = (32736 : ℤ) :=
    by
    rw [h₃]
    norm_num <;> (try ring_nf at h₁ ⊢) <;> (try norm_num at h₁ ⊢) <;> (try linarith) <;> (try omega)
  exact h₄
  hole