theorem putnam_1986_a3
(cot : ℝ → ℝ)
(fcot : cot = fun θ ↦ cos θ / sin θ)
(arccot : ℝ → ℝ)
(harccot : ∀ t : ℝ, t ≥ 0 → arccot t ∈ Set.Ioc 0 (Real.pi / 2) ∧ cot (arccot t) = t)
: (∑' n : ℕ, arccot (n ^ 2 + n + 1) = ((Real.pi / 2) : ℝ )) := by