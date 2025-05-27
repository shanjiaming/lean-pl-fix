theorem imoProblem : a * y + b * z + c * x < S ^ 2:=
  by
  have h₁ : x = S - a:= by
    have h₁₁ : a + x = S := hS.1
    --  linarith
    linarith
  have h₂ : y = S - b:= by
    have h₂₁ : b + y = S := hS.2.1
    --  linarith
    linarith
  have h₃ : z = S - c:= by
    have h₃₁ : c + z = S := hS.2.2
    --  linarith
    linarith
  have h₄ : a * y + b * z + c * x = S * (a + b + c) - (a * b + b * c + c * a):=
    by
    --  rw [h₂, h₃, h₁]
    --  ring <;> (try ring_nf) <;> (try nlinarith [ha, hb, hc, hx, hy, hz, hS.1, hS.2.1, hS.2.2]) <;> (try nlinarith)
    nlinarith
  have h₅ : (S - a) * (S - b) * (S - c) > 0:=
    by
    have h₅₁ : S - a > 0:= by
      have h₅₁₁ : a + x = S := hS.1
      have h₅₁₂ : x > 0 := hx
      --  linarith
      linarith
    have h₅₂ : S - b > 0:= by
      have h₅₂₁ : b + y = S := hS.2.1
      have h₅₂₂ : y > 0 := hy
      --  linarith
      linarith
    have h₅₃ : S - c > 0:= by
      have h₅₃₁ : c + z = S := hS.2.2
      have h₅₃₂ : z > 0 := hz
      --  linarith
      linarith
    have h₅₄ : (S - a) > 0 := h₅₁
    have h₅₅ : (S - b) > 0 := h₅₂
    have h₅₆ : (S - c) > 0 := h₅₃
    have h₅₇ : (S - a) * (S - b) > 0:= by -- positivity
      nlinarith
    have h₅₈ : (S - a) * (S - b) * (S - c) > 0:= by -- positivity
      nlinarith
    --  exact h₅₈
    linarith
  have h₆ : S ^ 2 - S * (a + b + c) + (a * b + b * c + c * a) > 0:=
    by
    have h₆₁ : (S - a) * (S - b) * (S - c) > 0 := h₅
    have h₆₂ : 0 < S:= by -- nlinarith [ha, hx]
      linarith
    have h₆₃ : S ^ 3 - S ^ 2 * (a + b + c) + S * (a * b + b * c + c * a) - a * b * c > 0:=
      by
      have h₆₃₁ : (S - a) * (S - b) * (S - c) = S ^ 3 - S ^ 2 * (a + b + c) + S * (a * b + b * c + c * a) - a * b * c:= by
        --  ring
        linarith
      --  rw [← h₆₃₁]
      --  exact h₆₁
      linarith
    have h₆₄ : S ^ 2 - S * (a + b + c) + (a * b + b * c + c * a) > 0:=
      by
      have h₆₄₁ : S ^ 3 - S ^ 2 * (a + b + c) + S * (a * b + b * c + c * a) - a * b * c > 0 := h₆₃
      have h₆₄₂ : 0 < S := h₆₂
      have h₆₄₃ : 0 < a * b * c:= by -- positivity
        positivity
      have h₆₄₄ : 0 < a * b * c / S:= by -- positivity
        positivity
      have h₆₄₅ : S ^ 2 - S * (a + b + c) + (a * b + b * c + c * a) > a * b * c / S:=
        by
        have h₆₄₅₁ : S * (S ^ 2 - S * (a + b + c) + (a * b + b * c + c * a)) > a * b * c:= by -- nlinarith [h₆₃]
          linarith
        have h₆₄₅₂ : S > 0 := h₆₂
        have h₆₄₅₃ : S * (S ^ 2 - S * (a + b + c) + (a * b + b * c + c * a)) > a * b * c := h₆₄₅₁
        have h₆₄₅₄ : S ^ 2 - S * (a + b + c) + (a * b + b * c + c * a) > a * b * c / S:= by
          --  calc
          --    S ^ 2 - S * (a + b + c) + (a * b + b * c + c * a) = (S * (S ^ 2 - S * (a + b + c) + (a * b + b * c + c * a))) / S :=
          --      by field_simp [h₆₂.ne'] <;> ring_nf <;> nlinarith
          --    _ > (a * b * c) / S :=
          --      by
          --      have h₆₄₅₅ : S * (S ^ 2 - S * (a + b + c) + (a * b + b * c + c * a)) > a * b * c := h₆₄₅₁
          --      have h₆₄₅₆ : 0 < S := h₆₂
          --      have h₆₄₅₇ : 0 < a * b * c := by positivity
          --      have h₆₄₅₈ : 0 < a * b * c / S := by positivity
          --      have h₆₄₅₉ : (S * (S ^ 2 - S * (a + b + c) + (a * b + b * c + c * a))) / S > (a * b * c) / S :=
          --        by
          --        apply (div_lt_div_iff (by positivity) (by positivity)).mpr
          --        nlinarith
          --      exact h₆₄₅₉
          hole
        --  exact h₆₄₅₄
        linarith
      have h₆₄₆ : a * b * c / S > 0:= by -- positivity
        linarith
      --  nlinarith
      linarith
    --  exact h₆₄
    linarith
  have h₇ : S * (a + b + c) - (a * b + b * c + c * a) < S ^ 2:=
    by
    have h₇₁ : S ^ 2 - S * (a + b + c) + (a * b + b * c + c * a) > 0 := h₆
    have h₇₂ : S * (a + b + c) - (a * b + b * c + c * a) < S ^ 2:= by -- nlinarith
      linarith
    --  exact h₇₂
    linarith
  have h₈ : a * y + b * z + c * x < S ^ 2:= by
    --  rw [h₄]
    --  linarith
    linarith
  --  exact h₈
  linarith