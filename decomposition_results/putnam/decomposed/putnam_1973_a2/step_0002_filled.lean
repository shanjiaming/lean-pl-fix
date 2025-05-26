theorem h₁ (L : List ℝ) (hL : L.length = 8 ∧ ∀ (i : Fin L.length), L[i] = 1 ∨ L[i] = -1) (pluses : ℕ) (hpluses : pluses = {i | L[i] = 1}.ncard) (S : ℕ → ℝ) (hS : S = fun n => ∑ i ∈ Finset.Icc 1 n, L[i % 8] / (↑i : ℝ)) : L.length = 8 := by
  have h₁ : L.length = 8 := hL.1
  --  exact h₁
  hole