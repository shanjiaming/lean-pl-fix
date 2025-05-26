theorem h₁ (S : ℕ → ℤ) (hS0 : S 0 = 1) (hSn : ∀ n ≥ 1, S n = (↑{A | (∀ (i j : Fin n), A i j = A j i) ∧ ∀ (j : Fin n), ∑ i, A i j = 1}.ncard : ℤ)) : ∀ n ≥ 1, S n = (↑{A | (∀ (i j : Fin n), A i j = A j i) ∧ ∀ (j : Fin n), ∑ i, A i j = 1}.ncard : ℤ) :=
  by
  --  intro n hn
  have h₂ : S n = {A : Matrix (Fin n) (Fin n) ℕ | (∀ i j, A i j = A j i) ∧ (∀ j, (∑ i, A i j) = 1)}.ncard := by sorry
  --  rw [h₂] <;> simp [Set.ncard] <;> norm_cast
  hole