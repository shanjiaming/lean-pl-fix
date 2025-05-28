theorem h₃ (f : ℝ → ℝ) (c : ℕ → ℝ) (hc : ∀ (n : ℕ), c n = 0 ∨ c n = 1) (hf : ∀ (x : ℝ), f x = ∑' (n : ℕ), c n * x ^ n) (h₁ : f (2 / 3) = 3 / 2) (h_sum : Summable fun n => c n * (2 / 3) ^ n) : ∑' (n : ℕ), c n * (2 / 3) ^ n = 3 / 2 :=
  by
  have h₄ : f (2 / 3 : ℝ) = (∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) := by sorry
  --  rw [h₁] at h₄
  --  linarith
  hole