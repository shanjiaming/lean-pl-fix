theorem mathd_algebra_76 (f : ℤ → ℤ) (h₀ : ∀ n, Odd n → f n = n ^ 2) (h₁ : ∀ n, Even n → f n = n ^ 2 - 4 * n - 1) :
  f 4 = -1:= by
  have h₂ : Even (4 : ℤ):= by -- rw [Int.even_iff] <;> norm_num <;> trivial
    norm_cast
  have h₃ : f 4 = (4 : ℤ) ^ 2 - 4 * (4 : ℤ) - 1:=
    by
    have h₄ : f 4 = (4 : ℤ) ^ 2 - 4 * (4 : ℤ) - 1:=
      by
      have h₅ : Even (4 : ℤ) := h₂
      have h₆ : f 4 = (4 : ℤ) ^ 2 - 4 * (4 : ℤ) - 1:= by
        --  apply h₁
        --  exact h₅
        hole
      --  rw [h₆]
      hole
    --  exact h₄
    linarith
  have h₄ : f 4 = -1:= by -- -- rw [h₃] <;> norm_num <;> trivial
    linarith
  --  apply h₄
  linarith