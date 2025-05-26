theorem prime_remainder_theorem (p : ℕ) (hp : Prime p) :
  let N := (range (p - 1)).prod (λ k => k^2 + 1);
  if p % 4 = 3 then N % p = 4 else N % p = 0 :=