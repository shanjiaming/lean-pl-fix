theorem putnam_1995_a6
(SM : (n : ℕ) → Set (Matrix (Fin 3) (Fin n) ℤ))
(Srowsums : (n : ℕ) → Matrix (Fin 3) (Fin n) ℤ → Set ℤ)
(sumsprog : (Set ℤ) → Prop)
(hSM : ∀ n, SM n = {M : Matrix (Fin 3) (Fin n) ℤ | ∀ j : Fin n, {M i j | i : Fin 3} = {1, 2, 3}})
(hSrowsums : ∀ n M, Srowsums n M = {∑ j : Fin n, M i j | i : Fin 3})
(hsumsprog : ∀ sums, sumsprog sums ↔ sums.encard = 3 ∧ (∃ a b c : ℤ, {a, b, c} = sums ∧ b = a + 1 ∧ c = a + 2))
: ∃ n ≥ 1995, {M : (SM n) | sumsprog (Srowsums n M)}.encard ≥ 4 * {M : (SM n) | (Srowsums n M).encard = 1}.encard := by