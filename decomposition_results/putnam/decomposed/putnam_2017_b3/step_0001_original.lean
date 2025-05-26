theorem putnam_2017_b3 (f : ℝ → ℝ) (c : ℕ → ℝ) (hc : ∀ (n : ℕ), c n = 0 ∨ c n = 1) (hf : ∀ (x : ℝ), f x = ∑' (n : ℕ), c n * x ^ n) : f (2 / 3) = 3 / 2 → Irrational (f 1 / 2) := by
  intro h₁
  have h₂ : False := by sorry
  have h₃ : Irrational (f 1 / 2) := by sorry
  exact h₃