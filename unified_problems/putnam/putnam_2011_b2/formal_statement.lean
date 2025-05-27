theorem putnam_2011_b2
  (S : Set (Fin 3 → ℕ))
  (t : ℕ)
  (hS : S = {s : Fin 3 → ℕ | (s 0).Prime ∧ (s 1).Prime ∧ (s 2).Prime ∧ ∃ x : ℚ, (s 0) * x ^ 2 + (s 1) * x + (s 2) = 0}) :
  (t.Prime ∧ ({s ∈ S | ∃ i : Fin 3, s i = t}.encard ≥ 7))
  ↔ t ∈ (({2, 5}) : Set ℕ ) := by