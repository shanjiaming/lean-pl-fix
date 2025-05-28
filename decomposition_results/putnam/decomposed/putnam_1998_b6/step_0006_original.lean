theorem h₃ (a b c k : ℤ) (hk h₁ :  ↑k =    √(↑(4 + 2 * max (max |a| |b|) |c|) ^ 3 + ↑a * ↑(4 + 2 * max (max |a| |b|) |c|) ^ 2 +          ↑b * ↑(4 + 2 * max (max |a| |b|) |c|) +        ↑c)) (h₂ :  ↑k ^ 2 =    ↑(4 + 2 * max (max |a| |b|) |c|) ^ 3 + ↑a * ↑(4 + 2 * max (max |a| |b|) |c|) ^ 2 +        ↑b * ↑(4 + 2 * max (max |a| |b|) |c|) +      ↑c) : k ^ 2 =
    (4 + 2 * max (max |a| |b|) |c|) ^ 3 + a * (4 + 2 * max (max |a| |b|) |c|) ^ 2 +
        b * (4 + 2 * max (max |a| |b|) |c|) +
      c :=
  by
  norm_cast at h₂ ⊢ <;> (try norm_num) <;> (try ring_nf at h₂ ⊢) <;>
            (try simp_all [Complex.ext_iff, pow_two, pow_three]) <;>
          (try nlinarith) <;>
        (try ring_nf at h₂ ⊢) <;>
      (try norm_num at h₂ ⊢) <;>
    (try linarith)