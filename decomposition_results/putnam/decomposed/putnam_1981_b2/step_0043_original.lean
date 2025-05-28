theorem h₂ (P : ℝ × ℝ × ℝ → Prop) (hP :  P = fun x =>    match x with    | (r, s, t) => 1 ≤ r ∧ r ≤ s ∧ s ≤ t ∧ t ≤ 4) (f : ℝ × ℝ × ℝ → ℝ) (hf :  f = fun x =>    match x with    | (r, s, t) => (r - 1) ^ 2 + (s / r - 1) ^ 2 + (t / s - 1) ^ 2 + (4 / t - 1) ^ 2) (h₀ : 12 - 8 * √2 ∈ {y | ∃ r s t, P (r, s, t) ∧ f (r, s, t) = y}) (h₁ : ∀ y ∈ {y | ∃ r s t, P (r, s, t) ∧ f (r, s, t) = y}, 12 - 8 * √2 ≤ y) : IsLeast {y | ∃ r s t, P (r, s, t) ∧ f (r, s, t) = y} (12 - 8 * √2) :=
  by
  refine' ⟨h₀, _⟩
  intro y hy
  have h₃ : (12 - 8 * Real.sqrt 2 : ℝ) ≤ y := h₁ y hy
  linarith