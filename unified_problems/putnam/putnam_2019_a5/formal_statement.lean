theorem putnam_2019_a5
  (p : ℕ)
  (q : Polynomial (ZMod p))
  (a : ℕ → ZMod p)
  (npoly : ℕ → Polynomial (ZMod p))
  (podd : Odd p)
  (pprime : p.Prime)
  (hq : ∀ k : ℕ, q.coeff k = a k)
  (ha0 : a 0 = 0 ∧ ∀ k > p - 1, a k = 0)
  (haother : ∀ k : Set.Icc 1 (p - 1), a k = ((k : ℕ) ^ ((p - 1) / 2)) % p)
  (hnpoly : ∀ n x, (npoly n).eval x = (x - 1) ^ n) :
  IsGreatest {n | npoly n ∣ q} (((fun p : ℕ => (p - 1) / 2) : ℕ → ℕ ) p) := by