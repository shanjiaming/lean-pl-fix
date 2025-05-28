theorem mathd_algebra_176 (x : ℝ) : (x + 1) ^ 2 * x = x ^ 3 + 2 * x ^ 2 + x:=
  by
  have h1 : (x + 1) ^ 2 * x = (x ^ 2 + 2 * x + 1) * x:=
    by
    have h1₁ : (x + 1) ^ 2 = x ^ 2 + 2 * x + 1:= by -- ring
      linarith
    --  rw [h1₁] <;> ring <;> linarith
    linarith
  have h2 : (x ^ 2 + 2 * x + 1) * x = x ^ 3 + 2 * x ^ 2 + x:=
    by
    have h2₁ : (x ^ 2 + 2 * x + 1) * x = x ^ 3 + 2 * x ^ 2 + x:= by -- ring_nf <;> nlinarith
      linarith
    --  rw [h2₁] <;> nlinarith
    linarith
  have h3 : (x + 1) ^ 2 * x = x ^ 3 + 2 * x ^ 2 + x:= by
    --  rw [h1]
    --  rw [h2] <;> ring_nf <;> nlinarith
    linarith
  --  exact h3
  linarith