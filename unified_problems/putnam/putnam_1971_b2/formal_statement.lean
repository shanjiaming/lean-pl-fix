theorem putnam_1971_b2
(S : Set ℝ)
(hS : S = univ \ {0, 1})
(P : (ℝ → ℝ) → Prop)
(hP : P = fun (F : ℝ → ℝ) => ∀ x ∈ S, F x + F ((x - 1)/x) = 1 + x)
: (∀ F ∈ (({fun x : ℝ => (x^3 - x^2 - 1)/(2 * x * (x - 1))}) : Set (ℝ → ℝ) ), P F) ∧ ∀ f : ℝ → ℝ, P f → ∃ F ∈ (({fun x : ℝ => (x^3 - x^2 - 1)/(2 * x * (x - 1))}) : Set (ℝ → ℝ) ), (∀ x ∈ S, f x = F x) := by