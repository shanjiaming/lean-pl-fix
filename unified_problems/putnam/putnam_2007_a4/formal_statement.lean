theorem putnam_2007_a4
(S : Set (Polynomial ℝ))
(repunit : ℝ → Prop)
(hrepunit : ∀ x, repunit x ↔ x > 0 ∧ x = floor x ∧ ∀ d ∈ (digits 10 (floor x)), d = 1)
(hS : ∀ f, f ∈ S ↔ (∀ n : ℝ, repunit n → repunit (f.eval n)))
: (S = (({f : Polynomial ℝ | ∃ d : ℕ, ∃ c ≥ (1 : ℤ) - d, ∀ n : ℝ, f.eval n = (1 / 9) * ((10 ^ c) * (9 * n + 1) ^ d - 1)}) : Set (Polynomial ℝ) )) := by