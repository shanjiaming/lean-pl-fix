theorem h1 (n : ℕ) (npos : n ≥ 1) (mats01 : Set (Matrix (Fin (2 * n)) (Fin (2 * n)) ℝ)) (hmats01 : mats01 = {A | ∀ (i j : Fin (2 * n)), A i j = 0 ∨ A i j = 1}) : mats01.Infinite := by
  --  rw [hmats01]
  have h2 : (2 * n : ℕ) ≥ 2 := by sorry
  have h5 : (2 * n : ℕ) > 0 := by sorry
  have h6 :
    ∀ (x : ℝ),
      x = 0 ∨ x = 1 →
        (fun (A : Matrix (Fin (2 * n)) (Fin (2 * n)) ℝ) => ∀ (i j : Fin (2 * n)), A i j = 0 ∨ A i j = 1)
          (Matrix.of fun i j => if i = ⟨0, by omega⟩ ∧ j = ⟨0, by omega⟩ then x else 0) := by sorry
  have h7 : Set.Infinite {A : Matrix (Fin (2 * n)) (Fin (2 * n)) ℝ | ∀ (i j : Fin (2 * n)), A i j = 0 ∨ A i j = 1} := by sorry
  --  exact h7
  hole