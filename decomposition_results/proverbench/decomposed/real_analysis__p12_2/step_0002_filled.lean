theorem h_main (x✝ x : ℕ → ℝ) (hx : ∃ L, Tendsto x atTop (𝓝 L)) : ∃ M, ∀ (n : ℕ), |x n| ≤ M := by
  obtain ⟨L, hL⟩ := hx
  have h₁ : ∃ (N : ℕ), ∀ n ≥ N, |x n - L| < 1 := by sorry
  obtain ⟨N, hN⟩ := h₁
  have h₂ : ∃ (C : ℝ), ∀ n < N, |x n| ≤ C := by sorry
  obtain ⟨C, hC⟩ := h₂
  use max C (|L| + 1)
  intro n
  by_cases h₃ : n < N
  ·
    have h₄ : |x n| ≤ C := hC n h₃
    have h₅ : C ≤ max C (|L| + 1) := by sorry
    have h₆ : |x n| ≤ max C (|L| + 1) := by sorry
    exact h₆
  ·
    have h₄ : n ≥ N := by sorry
    have h₅ : |x n - L| < 1 := hN n h₄
    have h₆ : |x n| - |L| ≤ |x n - L| := by sorry
    have h₇ : |x n| - |L| < 1 := by sorry
    have h₈ : |x n| < |L| + 1 := by sorry
    have h₉ : |x n| ≤ max C (|L| + 1) := by sorry
    exact h₉
  hole