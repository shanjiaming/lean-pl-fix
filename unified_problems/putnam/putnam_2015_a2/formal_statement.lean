theorem putnam_2015_a2
(a : ℕ → ℤ)
(abase : a 0 = 1 ∧ a 1 = 2)
(arec : ∀ n ≥ 2, a n = 4 * a (n - 1) - a (n - 2))
: Odd ((181) : ℕ ) ∧ ((181) : ℕ ).Prime ∧ ((((181) : ℕ ) : ℤ) ∣ a 2015) := by