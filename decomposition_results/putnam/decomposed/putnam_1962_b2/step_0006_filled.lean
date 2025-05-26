theorem h_final (h_main : ∃ q, Function.Bijective q) : ∃ f, ∀ (a b : ℝ), a < b → f a ⊂ f b :=
  by
  --  obtain ⟨q, hq⟩ := h_main
  have hq' : Function.Surjective q := hq.2
  --  use fun a => {n : ℕ+ | (q n : ℝ) < a}
  intro a b hab
  have h₁ : {n : ℕ+ | (q n : ℝ) < a} ⊆ {n : ℕ+ | (q n : ℝ) < b} := by sorry
  have h₂ : {n : ℕ+ | (q n : ℝ) < a} ≠ {n : ℕ+ | (q n : ℝ) < b} := by sorry
  have h₃ : {n : ℕ+ | (q n : ℝ) < a} ⊂ {n : ℕ+ | (q n : ℝ) < b} := by sorry
  exact h₃
  hole