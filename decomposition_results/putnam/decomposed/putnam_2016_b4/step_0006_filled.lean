theorem h6 (n : ℕ) (npos : n ≥ 1) (mats01 : Set (Matrix (Fin (2 * n)) (Fin (2 * n)) ℝ)) (hmats01 : mats01 = {A | ∀ (i j : Fin (2 * n)), A i j = 0 ∨ A i j = 1}) (h2 : 2 * n ≥ 2) (h5 : 2 * n > 0) (x : ℝ) (i j : Fin (2 * n)) : 0 < 2 * n :=
  by
  --  intro x hx
  intro i j
  by_cases h : i = ⟨0, by omega⟩ ∧ j = ⟨0, by omega⟩
  · simp_all [Matrix.of_apply, Fin.ext_iff] <;> aesop
  · simp_all [Matrix.of_apply, Fin.ext_iff] <;> aesop
  hole