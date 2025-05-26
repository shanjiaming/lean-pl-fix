theorem putnam_1992_b1
  (n : ℕ) (hn : n ≥ 2)
  (A : Finset ℝ → Set ℝ)
  (hA : A = fun S ↦ {x | ∃ a ∈ S, ∃ b ∈ S, a ≠ b ∧ (a + b) / 2 = x}) :
  IsLeast {k : ℤ | ∃ S : Finset ℝ, S.card = n ∧ k = (A S).ncard} (((fun n ↦ 2 * n - 3) : ℕ → ℤ ) n) := by