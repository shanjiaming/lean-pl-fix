theorem putnam_1993_b6 (S : Fin 3 → ℕ) (f : Fin 3 → Fin 3 → (Fin 3 → ℕ) → Fin 3 → ℕ) (Spos : ∀ (i : Fin 3), S i > 0) (hf :  ∀ (i j k : Fin 3),    i ≠ j ∧ i ≠ k ∧ j ≠ k →      ∀ (S' : Fin 3 → ℕ),        if S' i ≤ S' j then f i j S' i = 2 * S' i ∧ f i j S' j = S' j - S' i ∧ f i j S' k = S' k else f i j S' = S') : ∃ Ss N, Ss 0 = S ∧ (∃ i, Ss N i = 0) ∧ ∀ (n : Fin N), ∃ i j, i ≠ j ∧ f i j (Ss ↑n) = Ss (↑n + 1) :=
  by
  have h₁ : False := by sorry
  --  sorry
  hole