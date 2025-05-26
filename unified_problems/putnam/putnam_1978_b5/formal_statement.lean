theorem putnam_1978_b5
(S : Set (Polynomial ℝ))
(hS : S = {p : Polynomial ℝ | p.degree = 4 ∧ ∀ x ∈ Icc (-1) 1, p.eval x ∈ Icc 0 1})
: (((4 * X ^ 4 - 4 * X ^ 2 + 1) : Polynomial ℝ ) ∈ S ∧ (∀ p ∈ S, p.coeff 4 ≤ ((4 * X ^ 4 - 4 * X ^ 2 + 1) : Polynomial ℝ ).coeff 4)) := by