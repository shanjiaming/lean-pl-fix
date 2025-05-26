theorem h_main  : ∀ (p : Fin 4 → EuclideanSpace ℝ (Fin 2)),
    (∀ (i j : Fin 4), i ≠ j → ∃ n, Dist.dist (p i) (p j) = (↑n : ℝ) ∧ Odd n) → False :=
  by
  --  intro p h
  have h₁ : (∃ n : ℤ, dist (p (⟨0, by decide⟩ : Fin 4)) (p (⟨1, by decide⟩ : Fin 4)) = n ∧ Odd n) := by sorry
  have h₂ : (∃ n : ℤ, dist (p (⟨0, by decide⟩ : Fin 4)) (p (⟨2, by decide⟩ : Fin 4)) = n ∧ Odd n) := by sorry
  have h₃ : (∃ n : ℤ, dist (p (⟨0, by decide⟩ : Fin 4)) (p (⟨3, by decide⟩ : Fin 4)) = n ∧ Odd n) := by sorry
  have h₄ : (∃ n : ℤ, dist (p (⟨1, by decide⟩ : Fin 4)) (p (⟨2, by decide⟩ : Fin 4)) = n ∧ Odd n) := by sorry
  have h₅ : (∃ n : ℤ, dist (p (⟨1, by decide⟩ : Fin 4)) (p (⟨3, by decide⟩ : Fin 4)) = n ∧ Odd n) := by sorry
  have h₆ : (∃ n : ℤ, dist (p (⟨2, by decide⟩ : Fin 4)) (p (⟨3, by decide⟩ : Fin 4)) = n ∧ Odd n) := by sorry
  --  rcases h₁ with ⟨n₁, hn₁, hn₁_odd⟩
  --  rcases h₂ with ⟨n₂, hn₂, hn₂_odd⟩
  --  rcases h₃ with ⟨n₃, hn₃, hn₃_odd⟩
  --  rcases h₄ with ⟨n₄, hn₄, hn₄_odd⟩
  --  rcases h₅ with ⟨n₅, hn₅, hn₅_odd⟩
  --  rcases h₆ with ⟨n₆, hn₆, hn₆_odd⟩
  have h₇ : (dist (p (⟨0, by decide⟩ : Fin 4)) (p (⟨1, by decide⟩ : Fin 4)) : ℝ) = n₁ := by sorry
  have h₈ : (dist (p (⟨0, by decide⟩ : Fin 4)) (p (⟨2, by decide⟩ : Fin 4)) : ℝ) = n₂ := by sorry
  have h₉ : (dist (p (⟨0, by decide⟩ : Fin 4)) (p (⟨3, by decide⟩ : Fin 4)) : ℝ) = n₃ := by sorry
  have h₁₀ : (dist (p (⟨1, by decide⟩ : Fin 4)) (p (⟨2, by decide⟩ : Fin 4)) : ℝ) = n₄ := by sorry
  have h₁₁ : (dist (p (⟨1, by decide⟩ : Fin 4)) (p (⟨3, by decide⟩ : Fin 4)) : ℝ) = n₅ := by sorry
  have h₁₂ : (dist (p (⟨2, by decide⟩ : Fin 4)) (p (⟨3, by decide⟩ : Fin 4)) : ℝ) = n₆ := by sorry
  have h₁₃ : (n₁ : ℤ) % 2 = 1 := by sorry
  have h₁₄ : (n₂ : ℤ) % 2 = 1 := by sorry
  have h₁₅ : (n₃ : ℤ) % 2 = 1 := by sorry
  have h₁₆ : (n₄ : ℤ) % 2 = 1 := by sorry
  have h₁₇ : (n₅ : ℤ) % 2 = 1 := by sorry
  have h₁₈ : (n₆ : ℤ) % 2 = 1 := by sorry
  have h₁₉ : (n₁ : ℤ) ^ 2 % 4 = 1 := by sorry
  have h₂₀ : (n₂ : ℤ) ^ 2 % 4 = 1 := by sorry
  have h₂₁ : (n₃ : ℤ) ^ 2 % 4 = 1 := by sorry
  have h₂₂ : (n₄ : ℤ) ^ 2 % 4 = 1 := by sorry
  have h₂₃ : (n₅ : ℤ) ^ 2 % 4 = 1 := by sorry
  have h₂₄ : (n₆ : ℤ) ^ 2 % 4 = 1 := by sorry
  have h₂₅ : (n₁ : ℝ) ^ 2 = (n₁ : ℝ) ^ 2 := by sorry
  have h₂₆ : (n₂ : ℝ) ^ 2 = (n₂ : ℝ) ^ 2 := by sorry
  have h₂₇ : (n₃ : ℝ) ^ 2 = (n₃ : ℝ) ^ 2 := by sorry
  have h₂₈ : (n₄ : ℝ) ^ 2 = (n₄ : ℝ) ^ 2 := by sorry
  have h₂₉ : (n₅ : ℝ) ^ 2 = (n₅ : ℝ) ^ 2 := by sorry
  have h₃₀ : (n₆ : ℝ) ^ 2 = (n₆ : ℝ) ^ 2 := by sorry
  have h₃₁ : (dist (p (⟨0, by decide⟩ : Fin 4)) (p (⟨1, by decide⟩ : Fin 4)) : ℝ) ^ 2 = (n₁ : ℝ) ^ 2 := by sorry
  have h₃₂ : (dist (p (⟨0, by decide⟩ : Fin 4)) (p (⟨2, by decide⟩ : Fin 4)) : ℝ) ^ 2 = (n₂ : ℝ) ^ 2 := by sorry
  have h₃₃ : (dist (p (⟨0, by decide⟩ : Fin 4)) (p (⟨3, by decide⟩ : Fin 4)) : ℝ) ^ 2 = (n₃ : ℝ) ^ 2 := by sorry
  have h₃₄ : (dist (p (⟨1, by decide⟩ : Fin 4)) (p (⟨2, by decide⟩ : Fin 4)) : ℝ) ^ 2 = (n₄ : ℝ) ^ 2 := by sorry
  have h₃₅ : (dist (p (⟨1, by decide⟩ : Fin 4)) (p (⟨3, by decide⟩ : Fin 4)) : ℝ) ^ 2 = (n₅ : ℝ) ^ 2 := by sorry
  have h₃₆ : (dist (p (⟨2, by decide⟩ : Fin 4)) (p (⟨3, by decide⟩ : Fin 4)) : ℝ) ^ 2 = (n₆ : ℝ) ^ 2 := by sorry
  have h₃₇ : (n₁ : ℝ) ^ 2 = (n₁ : ℝ) ^ 2 := by sorry
  have h₃₈ : (n₂ : ℝ) ^ 2 = (n₂ : ℝ) ^ 2 := by sorry
  have h₃₉ : (n₃ : ℝ) ^ 2 = (n₃ : ℝ) ^ 2 := by sorry
  have h₄₀ : (n₄ : ℝ) ^ 2 = (n₄ : ℝ) ^ 2 := by sorry
  have h₄₁ : (n₅ : ℝ) ^ 2 = (n₅ : ℝ) ^ 2 := by sorry
  have h₄₂ : (n₆ : ℝ) ^ 2 = (n₆ : ℝ) ^ 2 := by sorry
  have h₄₃ : False := by sorry
  --  exact h₄₃
  hole