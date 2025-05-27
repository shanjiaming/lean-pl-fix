theorem imo_inequality :
  a ^ 2 * ((s a b c) - a) + b ^ 2 * ((s a b c) - b) + c ^ 2 * ((s a b c) - c) ≤ (3 / 2) * a * b * c:=
  by
  have h1 :
    a ^ 2 * ((s a b c) - a) + b ^ 2 * ((s a b c) - b) + c ^ 2 * ((s a b c) - c) =
      (a ^ 2 * (b + c - a) + b ^ 2 * (a + c - b) + c ^ 2 * (a + b - c)) / 2 := by sorry
  have h2 : a ^ 2 * (b + c - a) + b ^ 2 * (a + c - b) + c ^ 2 * (a + b - c) ≤ 3 * a * b * c:=
    by
    have h₂ : a > 0 := ha
    have h₃ : b > 0 := hb
    have h₄ : c > 0 := hc
    have h₅ :
      a ^ 3 + b ^ 3 + c ^ 3 + 3 * a * b * c ≥ a ^ 2 * b + a * b ^ 2 + a ^ 2 * c + a * c ^ 2 + b ^ 2 * c + b * c ^ 2 := by sorry
    have h₆ : a ^ 2 * (b + c - a) + b ^ 2 * (a + c - b) + c ^ 2 * (a + b - c) ≤ 3 * a * b * c:=
      by
      have h₇ :
        a ^ 2 * (b + c - a) + b ^ 2 * (a + c - b) + c ^ 2 * (a + b - c) =
          a ^ 2 * b + a ^ 2 * c - a ^ 3 + b ^ 2 * a + b ^ 2 * c - b ^ 3 + c ^ 2 * a + c ^ 2 * b - c ^ 3 := by sorry
      --  rw [h₇]
      have h₈ :
        a ^ 2 * b + a ^ 2 * c - a ^ 3 + b ^ 2 * a + b ^ 2 * c - b ^ 3 + c ^ 2 * a + c ^ 2 * b - c ^ 3 ≤ 3 * a * b * c := by sorry
      --  linarith
      linarith
    --  exact h₆
    linarith
  have h3 : a ^ 2 * ((s a b c) - a) + b ^ 2 * ((s a b c) - b) + c ^ 2 * ((s a b c) - c) ≤ (3 / 2) * a * b * c:=
    by
    have h₃ :
      a ^ 2 * ((s a b c) - a) + b ^ 2 * ((s a b c) - b) + c ^ 2 * ((s a b c) - c) =
        (a ^ 2 * (b + c - a) + b ^ 2 * (a + c - b) + c ^ 2 * (a + b - c)) / 2 :=
      h1
    --  rw [h₃]
    have h₄ : (a ^ 2 * (b + c - a) + b ^ 2 * (a + c - b) + c ^ 2 * (a + b - c)) / 2 ≤ (3 / 2 : ℝ) * a * b * c:=
      by
      have h₅ : a ^ 2 * (b + c - a) + b ^ 2 * (a + c - b) + c ^ 2 * (a + b - c) ≤ 3 * a * b * c := h2
      have h₆ : (a ^ 2 * (b + c - a) + b ^ 2 * (a + c - b) + c ^ 2 * (a + b - c)) / 2 ≤ (3 * a * b * c) / 2:= by -- linarith
        linarith
      have h₇ : (3 * a * b * c : ℝ) / 2 = (3 / 2 : ℝ) * a * b * c:= by -- ring
        linarith
      --  rw [h₇] at h₆
      --  linarith
      linarith
    --  linarith
    linarith
  --  exact h3
  linarith