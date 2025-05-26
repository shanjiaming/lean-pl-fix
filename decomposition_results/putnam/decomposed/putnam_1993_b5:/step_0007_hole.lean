theorem h₅ (p : Fin 4 → EuclideanSpace ℝ (Fin 2)) (h : ∀ (i j : Fin 4), i ≠ j → ∃ n, Dist.dist (p i) (p j) = (↑n : ℝ) ∧ Odd n) (h₁ : ∃ n, Dist.dist (p ⟨0, ⋯⟩) (p ⟨1, ⋯⟩) = (↑n : ℝ) ∧ Odd n) (h₂ : ∃ n, Dist.dist (p ⟨0, ⋯⟩) (p ⟨2, ⋯⟩) = (↑n : ℝ) ∧ Odd n) (h₃ : ∃ n, Dist.dist (p ⟨0, ⋯⟩) (p ⟨3, ⋯⟩) = (↑n : ℝ) ∧ Odd n) (h₄ : ∃ n, Dist.dist (p ⟨1, ⋯⟩) (p ⟨2, ⋯⟩) = (↑n : ℝ) ∧ Odd n) (n : ℤ) : 1 < 4 :=
  by
  --  apply h (⟨1, by decide⟩ : Fin 4) (⟨3, by decide⟩ : Fin 4)
  simp [Fin.ext_iff]
  hole