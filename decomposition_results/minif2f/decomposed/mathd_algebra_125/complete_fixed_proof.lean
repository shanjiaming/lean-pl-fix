theorem mathd_algebra_125 (x y : ℕ) (h₀ : 0 < x ∧ 0 < y) (h₁ : 5 * x = y) (h₂ : ↑x - (3 : ℤ) + (y - (3 : ℤ)) = 30) :
  x = 6:=
  by
  have h₃ : (x : ℤ) + y = 36:=
    by
    have h₃₁ : (x : ℤ) - (3 : ℤ) + ((y : ℤ) - (3 : ℤ)) = 30:= by -- simpa using h₂
      linarith
    have h₃₂ : (x : ℤ) + (y : ℤ) - 6 = 30:= by -- linarith
      omega
    have h₃₃ : (x : ℤ) + (y : ℤ) = 36:= by -- linarith
      omega
    --  exact_mod_cast h₃₃
    linarith
  have h₄ : x + y = 36:= by -- norm_cast at h₃ ⊢ <;> omega
    linarith
  have h₅ : x = 6:= by
    have h₅₁ : y = 5 * x:= by -- omega
      linarith
    have h₅₂ : x + y = 36 := h₄
    --  rw [h₅₁] at h₅₂
    have h₅₃ : x + (5 * x) = 36:= by -- simpa using h₅₂
      linarith
    have h₅₄ : 6 * x = 36:= by -- omega
      linarith
    have h₅₅ : x = 6:= by -- omega
      linarith
    --  exact h₅₅
    linarith
  --  exact h₅
  linarith