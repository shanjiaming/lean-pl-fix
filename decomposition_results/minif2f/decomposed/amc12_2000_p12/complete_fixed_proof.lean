theorem amc12_2000_p12 (a m c : ℕ) (h₀ : a + m + c = 12) : a * m * c + a * m + m * c + a * c ≤ 112:=
  by
  have h₁ : a ≤ 12:= by -- omega
    linarith
  have h₂ : m ≤ 12:= by -- omega
    linarith
  have h₃ : c ≤ 12:= by -- omega
    linarith
  have h₄ : a * m * c + a * m + m * c + a * c ≤ 112:=
    by
    have h₅ : a ≤ 12:= by -- omega
      linarith
    have h₆ : m ≤ 12:= by -- omega
      linarith
    have h₇ : c ≤ 12:= by -- omega
      linarith
    --  --  --  --  interval_cases a <;> interval_cases m <;> interval_cases c <;> norm_num at h₀ ⊢ <;> (try omega) <;>
            (try nlinarith) <;>
          (try ring_nf at h₀ ⊢ <;> omega) <;>
        (try norm_num at h₀ ⊢ <;> nlinarith) <;>
      (try ring_nf at h₀ ⊢ <;> omega)
    hole
  --  exact h₄
  linarith