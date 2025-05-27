theorem aime_2025i_p8 (ans : ℚ) (S : Finset ℝ)
    (h₀ : ∀ k : ℝ, k ∈ S ↔ (∃! (z : ℂ),
      Complex.abs (25 + 20 * Complex.I - z) = 5 ∧
      Complex.abs (z - 4 - k) = Complex.abs (z - 3 * Complex.I - k)
    ))
    (answer : ans = (∑ k in S, k)) :
    ↑ans.den + ans.num = 77 := by