theorem prime_remainder_theorem (p : ℕ) (hp : sorry) : let N := sorry;
  if p % 4 = 3 then N % p = 4 else N % p = 0 := (range (p - 1)).prod (λ k => k ^ 2 + 1);
  if p % 4 = 3 then N % p = 4 else N % p = 0 :=
  by
  intro N
  have h_main : (if p % 4 = 3 then N % p = 4 else N % p = 0) := by sorry
  exact h_main