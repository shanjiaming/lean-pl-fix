theorem h₁ (p : Fin 4 → EuclideanSpace ℝ (Fin 2)) (h : ∀ (i j : Fin 4), i ≠ j → ∃ n, dist (p i) (p j) = ↑n ∧ Odd n) (n : ℤ) : 0 < 4 :=
  by
  apply h (⟨0, by decide⟩ : Fin 4) (⟨1, by decide⟩ : Fin 4)
  simp [Fin.ext_iff]