theorem h₉ (a b c k : ℤ) (hk h₁ :  ↑k =    √(↑(4 + 2 * max (max |a| |b|) |c|) ^ 3 + ↑a * ↑(4 + 2 * max (max |a| |b|) |c|) ^ 2 +          ↑b * ↑(4 + 2 * max (max |a| |b|) |c|) +        ↑c)) (h₂ :  ↑k ^ 2 =    ↑(4 + 2 * max (max |a| |b|) |c|) ^ 3 + ↑a * ↑(4 + 2 * max (max |a| |b|) |c|) ^ 2 +        ↑b * ↑(4 + 2 * max (max |a| |b|) |c|) +      ↑c) (h₃ :  k ^ 2 =    (4 + 2 * max (max |a| |b|) |c|) ^ 3 + a * (4 + 2 * max (max |a| |b|) |c|) ^ 2 +        b * (4 + 2 * max (max |a| |b|) |c|) +      c) (h₅ : 4 + 2 * max (max |a| |b|) |c| ≥ 4) (h₆ : (4 + 2 * max (max |a| |b|) |c|) ^ 2 ≥ 16) (h₇ : (4 + 2 * max (max |a| |b|) |c|) ^ 3 ≥ 64) : a ≥ -max (max |a| |b|) |c| :=
  by
  have h₁₀ : (a : ℤ) ≥ -((abs a : ℤ)) := by sorry
  have h₁₁ : (abs a : ℤ) ≤ (max (max (abs a) (abs b)) (abs c) : ℤ) := by sorry
  --  linarith
  linarith