theorem h₂ (p : ℕ → ℝ → ℝ) (x✝ y : ℝ) (n : ℕ) (h0 : p 0 = fun x => 1) (hp : ∀ n > 0, p n = fun x => ∏ i ∈ Finset.range n, (x - ↑i)) (x : ℝ) : p 0 x = 1 := by
  have h₃ : (p 0) = fun x : ℝ => 1 := h0
  simp [h₃]