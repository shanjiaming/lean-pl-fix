theorem h₅ (a b c k : ℤ) (hk h₁ :  ↑k =    √(↑(4 + 2 * max (max |a| |b|) |c|) ^ 3 + ↑a * ↑(4 + 2 * max (max |a| |b|) |c|) ^ 2 +          ↑b * ↑(4 + 2 * max (max |a| |b|) |c|) +        ↑c)) (h₂ :  ↑k ^ 2 =    ↑(4 + 2 * max (max |a| |b|) |c|) ^ 3 + ↑a * ↑(4 + 2 * max (max |a| |b|) |c|) ^ 2 +        ↑b * ↑(4 + 2 * max (max |a| |b|) |c|) +      ↑c) (h₃ :  k ^ 2 =    (4 + 2 * max (max |a| |b|) |c|) ^ 3 + a * (4 + 2 * max (max |a| |b|) |c|) ^ 2 +        b * (4 + 2 * max (max |a| |b|) |c|) +      c) : 4 + 2 * max (max |a| |b|) |c| ≥ 4 :=
  by
  have h₆ : (max (max (abs a) (abs b)) (abs c) : ℤ) ≥ 0 := by sorry
  have h₇ : (2 : ℤ) * (max (max (abs a) (abs b)) (abs c) : ℤ) ≥ 0 := by sorry
  nlinarith