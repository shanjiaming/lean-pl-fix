theorem putnam_2019_a5 (p : ℕ) (q : Polynomial (ZMod p)) (a : ℕ → ZMod p) (npoly : ℕ → Polynomial (ZMod p)) (podd : Odd p) (pprime : Nat.Prime p) (hq : ∀ (k : ℕ), q.coeff k = a k) (ha0 : a 0 = 0 ∧ ∀ k > p - 1, a k = 0) (haother : ∀ (k : ↑(Set.Icc 1 (p - 1))), a ↑k = ↑(↑k ^ ((p - 1) / 2) % p)) (hnpoly : ∀ (n : ℕ) (x : ZMod p), Polynomial.eval x (npoly n) = (x - 1) ^ n) : IsGreatest {n | npoly n ∣ q} ((fun z => (z - 1) / 2) p) :=
  by
  have h0 : (p - 1) / 2 ∈ {n : ℕ | npoly n ∣ q} := by sorry
  have h1 : ∀ n ∈ {n : ℕ | npoly n ∣ q}, n ≤ (p - 1) / 2 := by sorry
  have h2 : IsGreatest {n : ℕ | npoly n ∣ q} (((fun z : ℕ => (z - 1) / 2) : ℕ → ℕ) p) := by sorry
  --  sorry
  hole