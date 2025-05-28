theorem putnam_1985_a4 (a : ℕ → ℕ) (ha1 : a 1 = 3) (ha : ∀ i ≥ 1, a (i + 1) = 3 ^ a i) : {k | ∀ (N : ℕ), ∃ i ≥ N, a i % 100 = ↑k} = {87} :=
  by
  have h_a2 : a 2 = 27 := by sorry
  have h_a3 : a 3 % 100 = 87 := by sorry
  have h_a_ge_3 : ∀ i ≥ 3, a i % 100 = 87 := by sorry
  have h_main : {k : Fin 100 | ∀ N : ℕ, ∃ i ≥ N, a i % 100 = k} = (({ 87 }) : Set (Fin 100)) := by sorry
  --  exact h_main
  hole