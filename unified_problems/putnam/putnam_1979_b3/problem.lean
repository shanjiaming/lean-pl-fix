theorem putnam_1979_b3
(F : Type*) [Field F] [Fintype F]
(n : ℕ)
(hn : n = Fintype.card F)
(nodd : Odd n)
(b c : F)
(p : Polynomial F)
(hp : p = X ^ 2 + (C b) * X + (C c) ∧ Irreducible p)
: ({d : F | Irreducible (p + (C d))}.ncard = (n - 1) / 2) := by