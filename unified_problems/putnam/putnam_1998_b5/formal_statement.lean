theorem putnam_1998_b5
(N : ℕ)
(hN : N = ∑ i in Finset.range 1998, 10^i)
: ((1) : ℕ ) = (Nat.floor (10^1000 * Real.sqrt N)) % 10 := by