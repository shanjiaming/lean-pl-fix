theorem putnam_1968_a5
(V : Set ℝ[X])
(V_def : V = {P : ℝ[X] | P.degree = 2 ∧ ∀ x ∈ Set.Icc 0 1, |P.eval x| ≤ 1})
: sSup {|(derivative P).eval 0| | P ∈ V} = ((8) : ℝ ) := by