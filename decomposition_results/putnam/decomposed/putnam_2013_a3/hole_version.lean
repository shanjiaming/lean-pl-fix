macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem putnam_2013_a3
(n : ℕ)
(a : Set.Icc 0 n → ℝ)
(x : ℝ)
(hx : 0 < x ∧ x < 1)
(hsum : (∑ i : Set.Icc 0 n, a i / (1 - x ^ (i.1 + 1))) = 0)
: ∃ y : ℝ, 0 < y ∧ y < 1 ∧ (∑ i : Set.Icc 0 n, a i * y ^ i.1) = 0 := by
  have h₁ : ∃ y : ℝ, 0 < y ∧ y < 1 ∧ (∑ i : Set.Icc 0 n, a i * y ^ i.1) = 0 := by
    hole_2
  hole_1