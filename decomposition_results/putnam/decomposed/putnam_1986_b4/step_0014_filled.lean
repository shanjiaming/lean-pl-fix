theorem h₅ (G : ℝ → ℝ) (hGeq : ∀ (r : ℝ), ∃ m n, G r = |r - √((↑m : ℝ) ^ 2 + 2 * (↑n : ℝ) ^ 2)|) (hGlb : ∀ (r : ℝ) (m n : ℤ), G r ≤ |r - √((↑m : ℝ) ^ 2 + 2 * (↑n : ℝ) ^ 2)|) (h₂ h₃ : ∀ (r : ℝ), G r = 0) : G = fun x => 0 := by
  --  funext r
  --  rw [h₃ r] <;> simp
  hole