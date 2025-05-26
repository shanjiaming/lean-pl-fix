theorem putnam_1995_b4
    (contfrac : ℝ)
    (hcontfrac : contfrac = 2207 - 1 / contfrac)
    (hcontfrac' : 1 < contfrac) :
    let ⟨a, b, c, d⟩ := ((⟨3,1,5,2⟩) : ℤ × ℤ × ℤ × ℤ )
    contfrac ^ ((1 : ℝ) / 8) = (a + b * sqrt c) / d :=
  by