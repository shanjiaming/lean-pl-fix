theorem h₂ (p : Fin 4 → EuclideanSpace ℝ (Fin 2)) (h : ∀ (i j : Fin 4), i ≠ j → ∃ n, Dist.dist (p i) (p j) = (↑n : ℝ) ∧ Odd n) (h₁ : ∃ n, Dist.dist (p ⟨0, ⋯⟩) (p ⟨1, ⋯⟩) = (↑n : ℝ) ∧ Odd n) (n : ℤ) : 0 < 4 :=
  by
  --  apply h (⟨0, by decide⟩ : Fin 4) (⟨2, by decide⟩ : Fin 4)
  simp [Fin.ext_iff]
  hole