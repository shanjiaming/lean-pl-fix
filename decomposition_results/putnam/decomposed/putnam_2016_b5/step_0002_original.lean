theorem h_forward (f : (↑(Set.Ioi 1) : Type) → (↑(Set.Ioi 1) : Type)) (hf : f ∈ {f | ∃ c > 0, ∀ (x : (↑(Set.Ioi 1) : Type)), (↑(f x) : ℝ) = (↑x : ℝ) ^ c}) : ∀ (x y : (↑(Set.Ioi 1) : Type)),
    (↑x : ℝ) ^ 2 ≤ (↑y : ℝ) ∧ (↑y : ℝ) ≤ (↑x : ℝ) ^ 3 →
      (↑(f x) : ℝ) ^ 2 ≤ (↑(f y) : ℝ) ∧ (↑(f y) : ℝ) ≤ (↑(f x) : ℝ) ^ 3 :=
  by
  rcases hf with ⟨c, hc, hf⟩
  intro x y hxy
  have h₁ : (f x : ℝ) = (x : ℝ) ^ c := by sorry
  have h₂ : (f y : ℝ) = (y : ℝ) ^ c := by sorry
  have h₃ : (x : ℝ) ^ 2 ≤ (y : ℝ) := hxy.1
  have h₄ : (y : ℝ) ≤ (x : ℝ) ^ 3 := hxy.2
  have h₅ : (1 : ℝ) < (x : ℝ) := by sorry
  have h₆ : (1 : ℝ) < (y : ℝ) := by sorry
  have h₇ : (f x : ℝ) ^ 2 ≤ (f y : ℝ) := by sorry
  have h₈ : (f y : ℝ) ≤ (f x : ℝ) ^ 3 := by sorry
  exact ⟨h₇, h₈⟩