theorem putnam_2019_a5
  (p : ℕ)
  (q : Polynomial (ZMod p))
  (a : ℕ → ZMod p)
  (npoly : ℕ → Polynomial (ZMod p))
  (podd : Odd p)
  (pprime : p.Prime)
  (hq : ∀ k : ℕ, q.coeff k = a k)
  (ha0 : a 0 = 0 ∧ ∀ k > p - 1, a k = 0)
  (haother : ∀ (k : Set.Icc 1 (p - 1)), a k = ((k : ℕ) ^ ((p - 1) / 2)) % p)
  (hnpoly : ∀ n x, (npoly n).eval x = (x - 1) ^ n) :
  IsGreatest {n | npoly n ∣ q} (((fun z : ℕ => (z - 1) / 2) : ℕ → ℕ ) p) := by
  have h0 : (p - 1) / 2 ∈ {n : ℕ | npoly n ∣ q} := by
    admit
  have h1 : ∀ n ∈ {n : ℕ | npoly n ∣ q}, n ≤ (p - 1) / 2 := by
    admit
  have h2 : IsGreatest {n : ℕ | npoly n ∣ q} (((fun z : ℕ => (z - 1) / 2) : ℕ → ℕ) p) := by
    norm_cast
  simpa
