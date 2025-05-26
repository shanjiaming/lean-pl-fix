theorem putnam_1982_b2
(A : ℝ × ℝ → ℕ)
(g I : ℝ)
(hA : A = fun (x, y) => {(m, n) : ℤ × ℤ | m^2 + n^2 ≤ x^2 + y^2}.ncard)
(hg : g = ∑' k : ℕ, Real.exp (-k^2))
(hI : I = ∫ y : ℝ, ∫ x : ℝ, A (x, y) * Real.exp (-x^2 - y^2))
: I = ((C Real.pi * (2*X - 1)^2) : Polynomial ℝ ).eval g := by