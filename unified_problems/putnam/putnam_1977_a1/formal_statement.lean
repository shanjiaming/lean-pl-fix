theorem putnam_1977_a1
(y : ℝ → ℝ)
(hy : y = fun x ↦ 2 * x ^ 4 + 7 * x ^ 3 + 3 * x - 5)
(S : Finset ℝ)
(hS : S.card = 4)
: (Collinear ℝ {P : Fin 2 → ℝ | P 0 ∈ S ∧ P 1 = y (P 0)} → (∑ x in S, x) / 4 = ((-7 / 8) : ℝ )) := by