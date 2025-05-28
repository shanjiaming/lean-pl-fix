theorem putnam_1993_b5  : ¬∃ p, ∀ (i j : Fin 4), i ≠ j → ∃ n, dist (p i) (p j) = ↑n ∧ Odd n :=
  by
  have h_main :
    ∀ (p : Fin 4 → EuclideanSpace ℝ (Fin 2)), (∀ i j, i ≠ j → (∃ n : ℤ, dist (p i) (p j) = n ∧ Odd n)) → False := by sorry
  --  intro h
  --  rcases h with ⟨p, hp⟩
  have h₁ : False := h_main p hp
  exact h₁
  hole