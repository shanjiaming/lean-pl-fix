theorem putnam_2023_a2
(n : ℕ)
(hn : n > 0 ∧ Even n)
(p : Polynomial ℝ)
(hp : Polynomial.Monic p ∧ p.degree = 2*n)
(S : Set ℝ)
(hS : S = {x : ℝ | ∃ k : ℤ, x = k ∧ 1 ≤ |k| ∧ |k| ≤ n})
(hpinv : ∀ k ∈ S, p.eval (1/k) = k^2)
: {x : ℝ | p.eval (1/x) = x^2} \ S = ((fun n => {(1 : ℝ)/(factorial n), -(1 : ℝ)/(factorial n)}) : ℕ → Set ℝ ) n := by