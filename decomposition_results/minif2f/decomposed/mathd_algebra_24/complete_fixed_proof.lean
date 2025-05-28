theorem mathd_algebra_24 (x : ℝ) (h₀ : x / 50 = 40) : x = 2000:=
  by
  have h₁ : x = 2000:=
    by
    have h₁ : x = 40 * 50:= by
      have h₁ : x / 50 = 40 := h₀
      have h₂ : x = 40 * 50:= by
        --  calc
        --    x = (x / 50) * 50 := by ring
        --    _ = 40 * 50 := by rw [h₀] <;> ring
        linarith
      --  exact h₂
      linarith
    have h₂ : x = 2000:= by
      --  calc
      --    x = 40 * 50 := h₁
      --    _ = 2000 := by norm_num
      linarith
    --  exact h₂
    linarith
  --  exact h₁
  linarith