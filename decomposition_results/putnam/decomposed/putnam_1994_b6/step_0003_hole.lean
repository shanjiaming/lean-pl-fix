theorem h2 (n : ℕ → ℤ) (hn : ∀ (a : ℕ), n a = 101 * ↑a - 100 * 2 ^ a) (h1 : False) : ∀ (a b c d : ↑(Set.Icc 0 99)), n ↑a + n ↑b ≡ n ↑c + n ↑d [ZMOD 10100] → {a, b} = {c, d} :=
  by
  intro a b c d h
  exfalso
  exact h1
  hole