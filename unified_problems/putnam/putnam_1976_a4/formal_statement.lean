theorem putnam_1976_a4
(a b c d : ℤ)
(r : ℝ)
(P Q: Polynomial ℚ)
(hP : P = X^3 + (C (a : ℚ))*X^2 + (C (b : ℚ))*X - (C 1) ∧ aeval r P = 0 ∧ Irreducible P)
(hQ : Q =  X^3 + (C (c : ℚ))*X^2 + (C (d : ℚ))*X + (C 1) ∧ aeval (r + 1) Q = 0)
: ∃ s : ℝ, aeval s P = 0 ∧ (s = ((fun r : ℝ => -1/(r + 1), fun r : ℝ => -(r + 1)/r) : (ℝ → ℝ) × (ℝ → ℝ) ).1 r ∨ s = ((fun r : ℝ => -1/(r + 1), fun r : ℝ => -(r + 1)/r) : (ℝ → ℝ) × (ℝ → ℝ) ).2 r) := by