theorem asserts that a prime $p > 2$ can be written as the sum of two perfect squres if and only if $p \equiv 1 \bmod 4$. Find which primes $p > 2$ can be written in each of the following forms, using (not necessarily positive) integers $x$ and $y$: (a) $x^2 + 16y^2$, (b) $4x^2 + 4xy + 5y^2$.
-/
theorem putnam_1974_a3
(assmption : ∀ p : ℕ, p.Prime ∧ p > 2 → ((∃ m n : ℤ, p = m^2 + n^2) ↔ p ≡ 1 [MOD 4]))
: ∀ p : ℕ, ((p.Prime ∧ p > 2 ∧ (∃ x y : ℤ, p = x^2 + 16*y^2)) ↔ p ∈ (({p : ℕ | p.Prime ∧ p ≡ 1 [MOD 8]}, {p : ℕ | p.Prime ∧ p ≡ 5 [MOD 8]}) : (Set ℕ) × (Set ℕ) ).1) ∧ ((p.Prime ∧ p > 2 ∧ (∃ x y : ℤ, p = 4*x^2 + 4*x*y + 5*y^2)) ↔ p ∈ (({p : ℕ | p.Prime ∧ p ≡ 1 [MOD 8]}, {p : ℕ | p.Prime ∧ p ≡ 5 [MOD 8]}) : (Set ℕ) × (Set ℕ) ).2) := by