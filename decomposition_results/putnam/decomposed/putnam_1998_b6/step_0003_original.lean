theorem h₁ (a b c k : ℤ) (hk :  ↑k =    √(↑(4 + 2 * max (max |a| |b|) |c|) ^ 3 + ↑a * ↑(4 + 2 * max (max |a| |b|) |c|) ^ 2 +          ↑b * ↑(4 + 2 * max (max |a| |b|) |c|) +        ↑c)) : ↑k =
    √(↑(4 + 2 * max (max |a| |b|) |c|) ^ 3 + ↑a * ↑(4 + 2 * max (max |a| |b|) |c|) ^ 2 +
          ↑b * ↑(4 + 2 * max (max |a| |b|) |c|) +
        ↑c) :=
  by simpa using hk