theorem putnam_1970_a1
(a b : ℝ)
(ha : a > 0)
(hb : b > 0)
(f : ℝ → ℝ)
(f_def : f = fun x : ℝ => Real.exp (a*x) * Real.cos (b*x))
(p : ℕ → ℝ)
(hp : ∃ c : ℝ, c > 0 ∧ ∀ x ∈ ball 0 c, ∑' n : ℕ, (p n)*x^n = f x)
(S : Set ℕ)
(S_def : S = {n : ℕ | p n = 0})
: S = ∅ ∨ ¬Finite S := by